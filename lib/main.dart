// This is the code which i wrote for the single button which will automatically change the background colors.

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'dart:async';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Back Ground Change',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageStste createState() => _MyHomePageStste();
// }

// class _MyHomePageStste extends State<MyHomePage> {
//   List<Color> randomColors = [
//     Colors.amber,
//     Colors.amberAccent,
//     Colors.black,
//     Colors.black54,
//     Colors.blueAccent,
//     Colors.deepOrange,
//     Colors.indigo,
//     Colors.lightGreenAccent,
//     Colors.pinkAccent,
//     Colors.redAccent,
//     Colors.white70,
//     Colors.deepPurple
//   ];

//   int index;
//   Color colorrightNow = Colors.deepPurpleAccent;
//   void changeColor(int _start) {
//     setState(() {
//       index = Random().nextInt(randomColors.length);
//       colorrightNow = randomColors[_start];
//     });
//   }

//   // For the timer
//   Timer _timer;
// int _start = 10;

// void startTimer() {
//   const oneSec = const Duration(seconds: 1);
//   _timer = new Timer.periodic(
//     oneSec,
//     (Timer timer) => setState(
//       () {
//         if (_start < 1) {
//           _start=10;
//           startTimer();
//         } else {
//           _start = _start - 1;
//           changeColor(_start);
//         }
//       },
//     ),
//   );
// }

// @override
// void dispose() {
//   _timer.cancel();
//   super.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: colorrightNow,
//       ),
//       child: FlatButton(
//         onPressed: startTimer,
//         highlightColor: Colors.transparent,
//         splashColor: Colors.transparent,
//         child: RaisedButton(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(18)),
//             onPressed: (){startTimer();},color: Colors.white54,
//             child: Text("press me")),
//       ),
//     );
//   }
// }


// IN the code below i have added the above feature.
// The code below has two buttons, one to change the color of background on button press and oter to change the color automatically..
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class BackChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Changing Background",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var colors = [
    Colors.teal,
    Colors.yellow,
    Colors.amber,
    Colors.blueAccent,
    Colors.grey,
    Colors.orange,
    Colors.purple,
    Colors.primaries,
    Colors.redAccent,
  ];

  var currentColor = Colors.white;
  var currentButtonColor = Colors.black;

  // For the timer
  Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            _start = 10;
            startTimer();
          } else {
            _start = _start - 1;
            changeColor(_start);
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  int index;
  Color colorrightNow;
  void changeColor(int _start) {
    setState(() {
      // index = Random().nextInt(colors.length);
      currentColor = colors[_start];
    });
  }

  void changeBackground() {
    int random = Random().nextInt(colors.length);
    int randomButtonColor = Random().nextInt(colors.length);
    setState(() {
      currentColor = colors[random];
      currentButtonColor = colors[randomButtonColor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: currentColor,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: currentButtonColor,
                  child: Text(
                    "Change Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                  onPressed: changeBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: currentButtonColor,
                  child: Text(
                    "AutoChange",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                  onPressed:(){ startTimer();},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

void main() => runApp(BackChange());
