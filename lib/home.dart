import 'package:flutter/material.dart';

// void main() {
//   runApp(const Home());
// }
void main() {
  runApp(new MaterialApp(
      home: Home()
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi UAS'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/logo.png"),
                ),
                accountName: Text("Aplikasi UAS"),
                accountEmail: Text("CRUD Matakuliah")),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Pertemuan 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                //Then Close The drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Pertemuan 13'),
              leading: Icon(Icons.ac_unit_outlined),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Punten'),
              leading: Icon(Icons.add_circle),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildContainer(),
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard(),

        ],
      ),
    );
  }

  Card buildCard() {
    return Card(
          color: Colors.white,
          elevation: 15,
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.access_alarms_sharp),
                title: Text("Ticket to Heaven"),
                subtitle: Text("Not Expensive"),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Text("Buy Me")),

                  TextButton(
                      onPressed: (){},
                      child: Text("Listen"))
                ],
              )
            ],
          ),
        );
  }

  Container buildContainer() {
    return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: Colors.black26
            )
          ),
          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          padding: EdgeInsets.all(10.0),
        );
  }
}
