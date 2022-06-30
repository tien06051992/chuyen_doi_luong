class ResultItem {
  String leftText = "";
  String rightText = "";
}

class Result {
  ResultItem gross = ResultItem()
    ..leftText = "Gross"
    ..rightText = "0";

  ResultItem net = ResultItem()
    ..leftText = "Net"
    ..rightText = "0";

  List<ResultItem> getList() => [
        gross,
        net,
      ];
}
