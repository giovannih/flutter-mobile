import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mahasiswa_add extends StatefulWidget {
  const Mahasiswa_add({Key? key}) : super(key: key);

  @override
  State<Mahasiswa_add> createState() => _Mahasiswa_addState();
}

class _Mahasiswa_addState extends State<Mahasiswa_add> {
  final _formKey = GlobalKey<FormState>();
  Future<List>? resp;

  TextEditingController namaController = new TextEditingController(text: 'Nama');
  TextEditingController nimController = new TextEditingController(text: 'Nim');
  TextEditingController alamatController = new TextEditingController(text: 'Alamat');
  TextEditingController emailController = new TextEditingController(text: 'Email');
  TextEditingController fotoController = new TextEditingController(text: 'Foto');
  TextEditingController nimProgmobController = new TextEditingController(text: 'Nimp Pogmob');

  Future<List> sendMhs(String nama,nim,alamat,email,foto,nim_progmob) async {
    final http.Response response = await http.post((Uri.parse(
        'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200371'
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Mahasiswa"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0)),
            TextFormField(
              decoration: InputDecoration(
                labelText: "something",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              maxLength: 50,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            buildPadding(5.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "something",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              maxLength: 50,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            buildPadding(5.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "something",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              maxLength: 50,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            buildPadding(5.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "something",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              maxLength: 50,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            buildPadding(5.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "something",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              maxLength: 50,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            buildPadding(5.0),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "something",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              maxLength: 50,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            buildPadding(5.0),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],

        ),
      ),
    );
  }

  Padding buildPadding(double) => Padding(padding: EdgeInsets.all(double));
}
