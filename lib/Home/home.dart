import 'package:chuyen_doi_luong/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final int counter;
  final Function incrementCounter;
  final Vung vung;
  final Function changeVung;

  const HomePage({
    super.key,
    required this.title,
    required this.counter,
    required this.incrementCounter,
    required this.vung,
    required this.changeVung,
  });

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Form(
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
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
                            decoration: const InputDecoration(
                              labelText: 'Thu nhập',
                            ),
                          ))),
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: '1 USD = VND',
                            ),
                          ))),
                ],
              ),
              Container(
                  // So nguoi phu thuoc
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Số người phụ thuộc',
                    ),
                  )),
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
                    onPressed: () {},
                    child: Text('Gross sang Net'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text('Net sang Gross'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementCounter.call();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
