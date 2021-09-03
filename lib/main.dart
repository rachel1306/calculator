import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
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
  String eqn="0",result="0",exp,expression;
  buttonPressed(String text){
    setState(() {
      if(text == 'c'){
        eqn="0";
        result="0";
      }
      else if(text == '='){
        exp=eqn;
        exp=exp.replaceAll('x', '*');
        exp=exp.replaceAll('÷','/');
        try{
          Parser p=Parser();
          Expression expression=p.parse(exp);
          ContextModel cm=ContextModel();
          result='${expression.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result="Error";
        }
      }
      else if(text == '⌫'){
        eqn=eqn.substring(0,eqn.length-1);
        if(eqn=="") eqn="0";
      }
      else{
        if(eqn=="0") eqn=text;
        eqn+=text;
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
            Container(child: Text(eqn,style: TextStyle(fontSize: 30,color: Colors.blueGrey[700]),),alignment: Alignment.topRight,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(child: Text(result,style: TextStyle(fontSize: 35),),alignment: Alignment.topRight,),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.75,
                  child: Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(
                        children: [
                          content('c',Colors.red),
                          content('⌫',Colors.blue),
                          content('÷',Colors.blue),
                        ]
                      ),
                      TableRow(
                          children: [
                            content('7',Colors.grey),
                            content('8',Colors.grey),
                            content('9',Colors.grey),
                        ],
                      ),
                      TableRow(
                          children: [
                            content('4',Colors.grey),
                            content('5',Colors.grey),
                            content('6',Colors.grey),
                          ]
                      ),
                      TableRow(
                          children: [
                            content('1',Colors.grey),
                            content('2',Colors.grey),
                            content('3',Colors.grey),
                          ]
                      ),
                      TableRow(
                          children: [
                            content('.',Colors.grey),
                            content('0',Colors.grey),
                            content('00',Colors.grey),
                          ]
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.25,
                  child: Table(
                    border: TableBorder.all(color: Colors.white),
                    children: [
                      TableRow(children: [content('x',Colors.blue),]),
                      TableRow(children: [content('-',Colors.blue),]),
                      TableRow(children: [content('+',Colors.blue),]),
                      TableRow(children: [
                        Container(
                          color: Colors.red,
                          alignment: Alignment.center,
                          height: 100,
                          child: FlatButton(
                            child: Text("="),
                            onPressed: () => buttonPressed("=")
                          ),
                        ),
                       ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
