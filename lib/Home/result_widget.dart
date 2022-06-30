import 'package:chuyen_doi_luong/home/result.dart';
import 'package:chuyen_doi_luong/home/row_item.dart';
import 'package:flutter/material.dart';

class ResultWiget extends StatelessWidget {
  final Result result;
  const ResultWiget({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ResultItem> list = result.getList();

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final color =
            index % 2 == 0 ? Colors.grey.withAlpha(128) : Colors.transparent;
        final resultItem = list[index];

        return Container(
          color: color,
          child: RowItem(
            leftText: resultItem.leftText,
            rightText: resultItem.rightText,
          ),
        );
      },
    );
  }
}
