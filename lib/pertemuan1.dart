import 'package:first_flutter_project/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 1 Flutter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Pertemuan1(title: 'Pertemuan 1 Brow'),
    );
  }
}

class Pertemuan1 extends StatefulWidget {
  const Pertemuan1({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Pertemuan1> createState() => _Pertemuan1State();
}

class _Pertemuan1State extends State<Pertemuan1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Ini Label Masseh",
                hintText: "Teks yang diinput adalah yes or yes",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all((5.0)),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Ini Label Lagi Brow",
                hintText: "Teks yang diinput adalah no or no",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all((5.0)),
            ),
            TextButton(
                onPressed: () {},

                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent
                ),
                child: Text(
                  "Submit me daddy",
                  style: TextStyle(fontSize: 16)
                ),
            ),TextButton(
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 0);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Hello World')),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent
                ),
                child: const Text(
                   "Logout",
                    style: TextStyle(fontSize: 16)
                ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
