import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';
import 'package:redux/redux.dart';
import 'package:uni/controller/local_storage/image_offline_storage.dart';
import 'package:uni/controller/parsers/parser_exams.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/redux/refresh_items_action.dart';

import 'local_storage/app_shared_preferences.dart';

Future loadReloginInfo(Store<AppState> store) async {
  final Tuple2<String, String> userPersistentInfo =
      await AppSharedPreferences.getPersistentUserInfo();
  final String userName = userPersistentInfo.item1;
  final String password = userPersistentInfo.item2;
  if (userName != '' && password != '') {
    final action = Completer();
    store.dispatch(reLogin(userName, password, 'feup', action: action));
    return action.future;
  }
  return Future.error('No credentials stored');
}

Future loadUserInfoToState(store) async {
  loadLocalUserInfoToState(store);
  if (await (Connectivity().checkConnectivity()) != ConnectionState.none) {
    return loadRemoteUserInfoToState(store);
  }
}

Future loadRemoteUserInfoToState(Store<AppState> store) async {
  if (store.state.content['session'] == null) {
    return null;
  } else if (!store.state.content['session'].authenticated &&
      store.state.content['session'].persistentSession) {
    await loadReloginInfo(store);
  }

  final Completer<Null> userInfo = Completer(),
      exams = Completer(),
      schedule = Completer(),
      printBalance = Completer(),
      fees = Completer(),
      coursesStates = Completer(),
      trips = Completer(),
      lastUpdate = Completer();

  store.dispatch(getUserInfo(userInfo));
  store.dispatch(getUserSchedule(schedule));
  store.dispatch(getUserPrintBalance(printBalance));
  store.dispatch(getUserFees(fees));
  store.dispatch(getUserCoursesState(coursesStates));
  store.dispatch(getUserBusTrips(trips));

  final Tuple2<String, String> userPersistentInfo =
      await AppSharedPreferences.getPersistentUserInfo();
  userInfo.future.then((value) => store.dispatch(getUserExams(
        exams,
        ParserExams(),
        userPersistentInfo
      )));

  final allRequests = Future.wait([
    exams.future,
    schedule.future,
    printBalance.future,
    fees.future,
    coursesStates.future,
    userInfo.future,
    trips.future
  ]);
  allRequests.then((futures) {
    store.dispatch(setLastUserInfoUpdateTimestamp(lastUpdate));
  });
  return lastUpdate.future;
}

void loadLocalUserInfoToState(store) async {
  store.dispatch(
      UpdateFavoriteCards(await AppSharedPreferences.getFavoriteCards()));
  final Tuple2<String, String> userPersistentInfo =
      await AppSharedPreferences.getPersistentUserInfo();
  if (userPersistentInfo.item1 != '' && userPersistentInfo.item2 != '') {
    store.dispatch(updateStateBasedOnLocalProfile());
    store.dispatch(updateStateBasedOnLocalUserExams());
    store.dispatch(updateStateBasedOnLocalUserLectures());
    store.dispatch(updateStateBasedOnLocalUserBusStops());
    store.dispatch(updateStateBasedOnLocalRefreshTimes());
    store.dispatch(updateStateBasedOnLocalTime());
    store.dispatch(SaveProfileStatusAction(RequestStatus.successful));
    store.dispatch(SetPrintBalanceStatusAction(RequestStatus.successful));
    store.dispatch(SetFeesStatusAction(RequestStatus.successful));
    store.dispatch(SetCoursesStatesStatusAction(RequestStatus.successful));
  }
}

Future<void> handleRefresh(store) {
  final action = RefreshItemsAction();
  store.dispatch(action);
  return action.completer.future;
}

Future<File> loadProfilePic(Store<AppState> store) {
  final String studentNo = store.state.content['session'].studentNumber;
  String url =
      'https://sigarra.up.pt/feup/pt/fotografias_service.foto?pct_cod=';
  final Map<String, String> headers = Map<String, String>();

  if (studentNo != null) {
    url += studentNo;
    headers['cookie'] = store.state.content['session'].cookies;
  }
  return retrieveImage(url, headers);
}
