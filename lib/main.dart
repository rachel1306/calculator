import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final VoidCallback myVoidCallback = () {};
  Widget content(String ch,Color color){
    return Container(
      color: color,
      alignment: Alignment.center,
      height: 50,
      child: FlatButton(
        child: Text(ch),
        onPressed: myVoidCallback
      ),
    );
    print(myVoidCallback);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: /*Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  color: Colors.red,
                  child: Text('C'),
                ),
                Container(
                  color: Colors.blue,
                  child: Icon(Icons.close)
                ),
                Container(
                    color: Colors.blue,
                    child: TextButton(child: Text('/'),)
                ),
                Container(
                    color: Colors.blue,
                    child: TextButton(child: Text('x'),)
                ),
              ],
            ),
            Column(
              children: [
                for();,
          ],
        ),
      ),*/
      Container(
        child: Column(
          children: [
            Expanded(child: Divider()),
            Table(
              border: TableBorder.all(color: Colors.white),
              children: [
                TableRow(
                  children: [
                    content('c',Colors.red),
                    content('⌫',Colors.blue),
                    content('÷',Colors.blue),
                    content('x',Colors.blue),
                    //Container(color: Colors.red,child: Text('C'),alignment: Alignment.center,height: 50,),
                    //Container(color: Colors.blue,child: Text('⌫'),alignment: Alignment.center,height: 50,),
                    //Container(color: Colors.blue,child: Text('÷'),alignment: Alignment.center,height: 50,),
                    //Container(color: Colors.blue,child: Text('x'),alignment: Alignment.center,height: 50,),
                  ]
                ),
                TableRow(
                    children: [
                      content('7',Colors.grey),
                      content('8',Colors.grey),
                      content('9',Colors.grey),
                      content('-',Colors.blue),
                      //Container(color: Colors.grey,child: Text('7'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('8'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('9'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.blue,child: Text('-'),alignment: Alignment.center,height: 50,),
                    ]
                ),
                TableRow(
                    children: [
                      content('4',Colors.grey),
                      content('5',Colors.grey),
                      content('6',Colors.grey),
                      content('+',Colors.blue),
                      //Container(color: Colors.grey,child: Text('4'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('5'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('6'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.blue,child: Text('+'),alignment: Alignment.center,height: 50,),
                    ]
                ),
              ],
            ),
            Table(
              border: TableBorder.all(color: Colors.white),
              children: [
                TableRow(
                    children: [
                      content('1',Colors.grey),
                      content('2',Colors.grey),
                      content('3',Colors.grey),
                      content('=',Colors.red),
                      //Container(color: Colors.grey,child: Text('1'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('2'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('3'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.red,child: Text('='),alignment: Alignment.center,height: 100,),
                    ]
                ),
               TableRow(
                    children: [
                      content('.',Colors.grey),
                      content('0',Colors.grey),
                      content('00',Colors.grey),
                      content("",Colors.red),
                      //Container(color: Colors.grey,child: Text('.'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('0'),alignment: Alignment.center,height: 50,),
                      //Container(color: Colors.grey,child: Text('00'),alignment: Alignment.center,height: 50,),
                      //Container(),
                    ]
                ),
              ],
            ),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
