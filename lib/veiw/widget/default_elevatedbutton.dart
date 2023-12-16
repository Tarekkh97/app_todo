// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:todo_app/veiw/widget/smalltext.dart';

// ignore: must_be_immutable
class defult_elvatedbutton extends StatelessWidget {
  defult_elvatedbutton(
      {super.key, required this.onpressed, required this.text});

  void Function() onpressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      child: Smalltext(
        text: text,
      ),
    );
  }
}
