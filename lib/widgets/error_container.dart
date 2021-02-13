import 'package:flutter/material.dart';
import 'package:money_app/widgets/error_row.dart';

class FormErrorAlert extends StatelessWidget {
  const FormErrorAlert({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => buildErrorRow(
          err: errors[index],
        ),
      ),
    );
  }
}
