import 'package:chuyen_doi_luong/home/form_data.dart';
import 'package:chuyen_doi_luong/home/result.dart';
import 'package:chuyen_doi_luong/home/result_widget.dart';
import 'package:chuyen_doi_luong/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  final String title;
  final int counter;
  final Function incrementCounter;
  final Vung vung;
  final Function changeVung;
  final FormData formData;

  final Function grossToNet;
  final Function netToGross;
  final Result result;

  const HomePage({
    super.key,
    required this.title,
    required this.counter,
    required this.incrementCounter,
    required this.vung,
    required this.changeVung,
    required this.formData,
    required this.grossToNet,
    required this.netToGross,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  // Thu nhap
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: formData.thuNhapController,
                          decoration: const InputDecoration(
                            labelText: 'Thu nhập',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: formData.tiGiaDola,
                          decoration: const InputDecoration(
                            labelText: '1 USD = VND',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  // So nguoi phu thuoc
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: formData.soNguoiPhuThuoc,
                    decoration: const InputDecoration(
                      labelText: 'Số người phụ thuộc',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                Container(
                  // Vung
                  padding: const EdgeInsets.all(8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Expanded(
                          flex: 1,
                          child: Text('Vùng'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Radio(
                                  value: Vung.one,
                                  groupValue: vung,
                                  onChanged: (value) {
                                    changeVung.call(value);
                                  }),
                              const Expanded(
                                child: Text('I'),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Radio(
                                  value: Vung.two,
                                  groupValue: vung,
                                  onChanged: (value) {
                                    changeVung.call(value);
                                  }),
                              const Expanded(child: Text('II'))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Radio(
                                  value: Vung.three,
                                  groupValue: vung,
                                  onChanged: (value) {
                                    changeVung.call(value);
                                  }),
                              const Expanded(child: Text('III'))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Radio(
                                  value: Vung.four,
                                  groupValue: vung,
                                  onChanged: (value) {
                                    changeVung.call(value);
                                  }),
                              const Expanded(child: Text('IV'))
                            ],
                          ),
                        ),
                      ]),
                ),
                Row(
                  // Button doi luong
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        grossToNet.call();
                      },
                      child: Text('Gross sang Net'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        netToGross.call();
                      },
                      child: Text('Net sang Gross'),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ResultWiget(
              result: result,
            ),
          )
        ],
      ),
    );
  }
}
