import 'dart:async';

import 'package:redux/redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:tuple/tuple.dart';
import 'package:uni/controller/networking/network_router.dart';
import 'package:uni/controller/parsers/parser_exams.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/course.dart';
import 'package:uni/model/entities/course_unit.dart';
import 'package:uni/model/entities/exam.dart';
import 'package:uni/model/entities/profile.dart';
import 'package:uni/model/entities/session.dart';
import 'package:uni/redux/action_creators.dart';

class MockStore extends Mock implements Store<AppState> {}

class ParserMock extends Mock implements ParserExams {}

class MockClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

void main() {
  group('ActionCreators', () {
    group('Exams Action Creator', () {
      final sopeCourseUnit = CourseUnit(abbreviation: 'SOPE');
      final sdisCourseUnit = CourseUnit(abbreviation: 'SDIS');
      NetworkRouter.httpClient = MockClient();
      final sopeExam = Exam('09:00-12:00', 'SOPE', 'B119, B107, B205',
          '2800-09-11', 'Recurso - Época Recurso (2ºS)', 'Quarta');
      final sdisExam = Exam('12:00-15:00', 'SDIS', 'B119, B107, B205',
          '2800-09-12', 'Recurso - Época Recurso (2ºS)', 'Quarta');
      final parserMock = ParserMock();
      final Tuple2<String, String> userPersistentInfo = Tuple2('', '');
      final mockStore = MockStore();
      final mockResponse = MockResponse();

      final profile = Profile();
      profile.courses = [Course(id: 7474)];
      final content = {
        'session': Session(authenticated: true),
        'currUcs': [sopeCourseUnit, sdisCourseUnit],
        'profile': profile,
      };

      when(NetworkRouter.httpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => mockResponse);
      when(mockResponse.statusCode).thenReturn(200);
      when(mockStore.state).thenReturn(AppState(content));
      test('When given a single exam', () async {
        final Completer<Null> completer = Completer();
        final actionCreator =
            getUserExams(completer, parserMock, userPersistentInfo);
        when(parserMock.parseExams(any)).thenAnswer((_) async => [sopeExam]);

        actionCreator(mockStore);
        await completer.future;
        final List<dynamic> actions =
            verify(mockStore.dispatch(captureAny)).captured;
        expect(actions.length, 3);
        expect(actions[0].status, RequestStatus.busy);
        expect(actions[1].status, RequestStatus.successful);
        expect(actions[2].exams, [sopeExam]);
      });
      test('When given two exams', () async {
        final Completer<Null> completer = Completer();
        final actionCreator =
            getUserExams(completer, parserMock, userPersistentInfo);
        when(parserMock.parseExams(any))
            .thenAnswer((_) async => [sopeExam, sdisExam]);

        actionCreator(mockStore);
        await completer.future;
        final List<dynamic> actions =
            verify(mockStore.dispatch(captureAny)).captured;
        expect(actions.length, 3);
        expect(actions[0].status, RequestStatus.busy);
        expect(actions[1].status, RequestStatus.successful);
        expect(actions[2].exams, [sopeExam, sdisExam]);
      });
      test('When given three exams but one is to be parsed', () async {
        final specialExam = Exam(
            '12:00-15:00',
            'SDIS',
            'B119, B107, B205',
            '2800-09-12',
            'Exames ao abrigo de estatutos especiais - Port.Est.Especiais',
            'Quarta');
        final Completer<Null> completer = Completer();
        final actionCreator =
            getUserExams(completer, parserMock, userPersistentInfo);
        when(parserMock.parseExams(any))
            .thenAnswer((_) async => [sopeExam, sdisExam, specialExam]);

        actionCreator(mockStore);
        await completer.future;
        final List<dynamic> actions =
            verify(mockStore.dispatch(captureAny)).captured;
        expect(actions.length, 3);
        expect(actions[0].status, RequestStatus.busy);
        expect(actions[1].status, RequestStatus.successful);
        expect(actions[2].exams, [sopeExam, sdisExam]);
      });
      test('When an error occurs while trying to obtain the exams', () async {
        final Completer<Null> completer = Completer();
        final actionCreator =
            getUserExams(completer, parserMock, userPersistentInfo);
        when(parserMock.parseExams(any))
            .thenAnswer((_) async => throw Exception('RIP'));

        actionCreator(mockStore);
        await completer.future;
        final List<dynamic> actions =
            verify(mockStore.dispatch(captureAny)).captured;
        expect(actions.length, 2);
        expect(actions[0].status, RequestStatus.busy);
        expect(actions[1].status, RequestStatus.failed);
      });
    });
  });
}
