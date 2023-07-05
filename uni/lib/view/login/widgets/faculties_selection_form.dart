import 'package:flutter/material.dart';
import 'package:uni/utils/constants.dart' as constants;
import 'package:uni/view/common_widgets/toast_message.dart';
import 'package:uni/generated/l10n.dart';

class FacultiesSelectionForm extends StatefulWidget {
  final List<String> selectedFaculties;
  final Function setFaculties;

  const FacultiesSelectionForm(this.selectedFaculties, this.setFaculties,
      {super.key});

  @override
  State<StatefulWidget> createState() => _FacultiesSelectionFormState();
}

class _FacultiesSelectionFormState extends State<FacultiesSelectionForm> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 0x75, 0x17, 0x1e),
        title: Text(S.of(context).college_select),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0xfa, 0xfa, 0xfa), fontSize: 18),
        content: SizedBox(
            height: 500.0, width: 200.0, child: createCheckList(context)),
        actions: createActionButtons(context));
  }

  List<Widget> createActionButtons(BuildContext context) {
    return [
      TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(S.of(context).cancel, style: const TextStyle(color: Colors.white))),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.white),
          onPressed: () {
            if (widget.selectedFaculties.isEmpty) {
              ToastMessage.warning(
                  context, S.of(context).at_least_one_college);
              return;
            }
            Navigator.pop(context);
            widget.setFaculties(widget.selectedFaculties);
          },
          child: Text(S.of(context).confirm))
    ];
  }

  Widget createCheckList(BuildContext context) {
    return ListView(
        children: List.generate(constants.faculties.length, (i) {
      final String faculty = constants.faculties.elementAt(i);
      return CheckboxListTile(
          title: Text(faculty.toUpperCase(),
              style: const TextStyle(color: Colors.white, fontSize: 20.0)),
          key: Key('FacultyCheck$faculty'),
          value: widget.selectedFaculties.contains(faculty),
          onChanged: (value) {
            setState(() {
              if (value != null && value) {
                widget.selectedFaculties.add(faculty);
              } else {
                widget.selectedFaculties.remove(faculty);
              }
            });
          });
    }));
  }
}
