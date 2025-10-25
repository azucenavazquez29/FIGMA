import 'package:flutter/material.dart';

Future<void> selectDate(BuildContext context, TextEditingController ctrl) async {
  final date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),
  );
  if (date != null) {
    ctrl.text = date.toIso8601String().split('T')[0];
  }
}
