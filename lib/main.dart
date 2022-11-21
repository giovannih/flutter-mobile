import 'package:first_flutter_project/pertemuan1.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  // void navigateLogin() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   int? isLogin = pref.getInt("is_login");
  //   if (isLogin == 1){
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Pertemuan1(title: 'Hello World',)),
  //     );
  //   }
  // }


  // @override
  // void initState() {
  //   navigateLogin();
  // }

  @override
  Widget build(BuildContext context) {
    // return new SplashScreen(
    //     seconds: 10,
    //     navigateAfterSeconds: Pertemuan1(title: 'Pertemuan 1'),
    //     title: new Text('Welcome to our app'),
    //     image: Image.asset('images/logo.png'),
    //     backgroundColor: Colors.white,
    //     photoSize: 100.0,
    //     loaderColor: Colors.black45
    // );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  await pref.setInt("is_login", 1);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Pertemuan1(title: 'Hello World',)),
                  );
                },
                child: Text(
                  "Login"
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}