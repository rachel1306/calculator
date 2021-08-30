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
  String equation="0";
  buttonPressed(String text){
    setState(() {
      if(text == 'C'){
        equation="0";
      }
      else if(text == '='){

      }
      else if(text == '⌫'){

      }
      else{
        equation+=text;
      }
    });
  }
  Widget content(String ch,Color color){
    return Container(
      color: color,
      alignment: Alignment.center,
      height: 50,
      child: FlatButton(
        child: Text(ch),
        onPressed: () => buttonPressed(ch)
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
      body:
      Container(
        child: Column(
          children: [
            Expanded(child: Divider()),
            Container(child: Text(equation,style: TextStyle(fontSize: 30,color: Colors.blueGrey[700]),),alignment: Alignment.topRight,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(child: Text('450',style: TextStyle(fontSize: 35),),alignment: Alignment.topRight,),
            ),
            Table(
              border: TableBorder.all(color: Colors.white),
              children: [
                TableRow(
                  children: [
                    content('c',Colors.red),
                    content('⌫',Colors.blue),
                    content('÷',Colors.blue),
                    content('x',Colors.blue),
                  ]
                ),
                TableRow(
                    children: [
                      content('7',Colors.grey),
                      content('8',Colors.grey),
                      content('9',Colors.grey),
                      content('-',Colors.blue),
                  ],
                ),
                TableRow(
                    children: [
                      content('4',Colors.grey),
                      content('5',Colors.grey),
                      content('6',Colors.grey),
                      content('+',Colors.blue),
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
                    ]
                ),
               TableRow(
                    children: [
                      content('.',Colors.grey),
                      content('0',Colors.grey),
                      content('00',Colors.grey),
                      content("",Colors.red),
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
