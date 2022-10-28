import 'package:flutter/material.dart';
import 'dart:math';
var rng = Random();
final numbers =List<int>.filled(6,0,growable: true);

void main() {
    for(int i=0; i<6; i++){
      numbers[i]=rng.nextInt(500);
    }
    numbers.sort();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  int ?NUM;
  double SIZE=120;

  void _incrementCounter() {
    setState(() {
       _index++;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children:[
            for (int i=0 ; i<_index ; i++)...[
             for(int x=i; x<=i;x++,SIZE-=3)...[
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10),
                 child: Text(
                   numbers[x].toString(),
                   style:TextStyle(
                       fontSize: SIZE
                   ),
                 ),
               ),

             ]
              ],

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Text("add"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
