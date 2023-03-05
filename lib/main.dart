import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './question.dart';
import './answers.dart';
import './quiz.dart';
import './Result.dart';

// void main() => runApp(MyApp()) // this is shorthand for functions having ONLY 1 expression
void main() {
  runApp(
      MyApp()); //runApp is provided by material.dart and is used to run the app
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); //ADDING _ BEFORE MYAPP MAKES IT PRIVATE, only usable where it is declared
  }
}

class _MyAppState extends State<MyApp> {
  var ansNum = 0;
  var index = 0;
  var total = 0;
  var questions = const [
    //list of questions (string data) square brackets->list

    {
      "questiontext": "Favourite \"colour\"?",
      "answertext": [
        {"text": "black", "score": 10},
        {"text": "green", "score": 5},
        {"text": "white", "score": 1}
      ],
    },

    {
      "questiontext": "Favourite \"animal\"?",
      "answertext": [
        {"text": "snake", "score": 10},
        {"text": "lion", "score": 5},
        {"text": "rabbit", "score": 2}
      ],
    },

    {
      "questiontext": "Favourite \"car\"?",
      "answertext": [
        {"text": "lamborghini", "score": 10},
        {"text": "Jaguar", "score": 5},
        {"text": "BMW", "score": 2}
      ],
    },

    {
      "questiontext": "Favourite \"tourist place\"?",
      "answertext": [
        {"text": "LA", "score": 10},
        {"text": "NYC", "score": 5},
        {"text": "Agra", "score": 2}
      ],
    },
  ];

  void nextQues(int score) {
    if (index < questions.length) {}
    index += 1;
    total+=score;

    setState(() {});
    print("totaltag : $total");
    print("tagindex $index");
    //print("tag1" + questions[index]);
  }

  void restartQuiz(){
    index=0;
    total=0;
    setState(() {
    });
    print("restarted");
  }


  // void ToastMaker() {
  //   Fluttertoast.showToast(
  //       msg: "Answer $ansNum selected",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  // }

  @override //decorator provided by dart. to make code cleaner
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFEFEFEF),
            primarySwatch: Colors.cyan),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //ctrl + space for autocompletion
          appBar: AppBar(
            centerTitle: true,
              // AppBar is the material appbar
              title: Text(" Sorting Hat "),
              // backgroundColor: Colors.deepPurple,
              // actions: [CircleAvatar(backgroundColor: Colors.deepPurpleAccent,)],
            ),
          body: index < questions.length
              ? //NOTE: body only takes 1 widget.
              Quiz(nextQues,
                  questions,
                  index)
              : Result(total,restartQuiz),
        )); //Text("Hello")/*text widget*/
    //     new Scaffold(
    //   body: Center (child: new Text("Hello")),
    //   backgroundColor: Colors.white,
    // )
    // home is the main widget this app will mount on screen
    // throw UnimplementedError();
  } // name of class should be in pascal case
// should extend a class provided by flutter here : Stateless widget
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // in wdg build MatApp set false
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.lime,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
