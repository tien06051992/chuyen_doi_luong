import 'package:chuyen_doi_luong/home/form_data.dart';
import 'package:chuyen_doi_luong/home/home.dart';
import 'package:chuyen_doi_luong/home/result.dart';
import 'package:chuyen_doi_luong/utils/constants.dart';
import 'package:chuyen_doi_luong/utils/numbers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Chuyen doi luong'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Vung _vung = Vung.one;

  final FormData _formData = FormData();
  final Result _result = Result();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeVung(value) {
    setState(() {
      _vung = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(
      title: widget.title,
      counter: _counter,
      incrementCounter: _incrementCounter,
      vung: _vung,
      changeVung: _changeVung,
      formData: _formData,
      grossToNet: () {
        // Thu nhap
        print(Numbers.toInt(_formData.thuNhapController.text, defaultVlue: 0));
        print(_formData.soNguoiPhuThuoc.text);
        print(_formData.tiGiaDola.text);
        print(_vung.name);

        setState(() {
          _result.net.rightText =
              "${Numbers.toInt(_formData.thuNhapController.text, defaultVlue: 0) * 0.9} VND";
        });
        print(_result.net.rightText);
      },
      netToGross: () {},
      result: _result,
    );
  }

  @override
  void dispose() {
    _formData.soNguoiPhuThuoc.dispose();
    _formData.tiGiaDola.dispose();
    _formData.thuNhapController.dispose();
    super.dispose();
  }
}
