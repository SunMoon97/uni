import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni/model/providers/exam_provider.dart';
import 'package:uni/view/exams/widgets/exam_filter_form.dart';

class ExamFilterMenu extends StatefulWidget {
  const ExamFilterMenu({super.key});

  @override
  ExamFilterMenuState createState() => ExamFilterMenuState();
}

class ExamFilterMenuState extends State<ExamFilterMenu> {
  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          final filteredExamsTypes = Provider.of<ExamProvider>(context, listen:false).filteredExamsTypes;
          return ExamFilterForm(Map<String, bool>.from(filteredExamsTypes));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.filter_alt),
      onPressed: () {
        showAlertDialog(context);
      },
    );
  }
}
