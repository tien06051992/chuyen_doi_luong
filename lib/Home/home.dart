import 'package:flutter/material.dart';

enum Vung { one, two, three, four }

class HomePage extends StatelessWidget {
  final String title;
  final int counter;
  final Function incrementCounter;
  Vung? _character = Vung.one;

  const HomePage({
    super.key,
    required this.title,
    required this.counter,
    required this.incrementCounter,
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
                padding: const EdgeInsets.all(8),
                child: Row(children: <Widget>[
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ]),
              )
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
