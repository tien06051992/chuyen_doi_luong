class Numbers {
  // convert text -> int
  static toInt(final String num, {final defaultVlue = 0}) {
    return int.tryParse(num) ?? defaultVlue;
  }
}
