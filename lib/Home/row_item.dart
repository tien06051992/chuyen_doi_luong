import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  const RowItem({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(leftText),
      trailing: Text(rightText),
    );
  }
}
