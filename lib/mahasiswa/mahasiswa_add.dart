import 'dart:convert';

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

  TextEditingController namaController = new TextEditingController();
  TextEditingController nimController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController fotoController = new TextEditingController();
  TextEditingController nimProgmobController = new TextEditingController();

  Future<List> sendMhs(String nama,nim,alamat,email,foto,nim_progmob) async {
    final http.Response response = await http.post((Uri.parse(
        'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/create'
    )),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'nama': nama,
        'nim': nim,
        'alamat': alamat,
        'email': email,
        'foto': foto,
        'nim_progmob': nim_progmob
      }),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
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
              controller: namaController,
              decoration: InputDecoration(
                labelText: "nama",
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
            TextFormField(
              controller: nimController,
              decoration: InputDecoration(
                  labelText: "nim",
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
            TextFormField(
              controller: alamatController,
              decoration: InputDecoration(
                  labelText: "alamat",
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
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "email",
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
            TextFormField(
              controller: fotoController,
              decoration: InputDecoration(
                  labelText: "foto",
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
            TextFormField(
              controller: nimProgmobController,
              decoration: InputDecoration(
                  labelText: "nim_progmob",
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
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  resp = sendMhs(namaController.text, nimController.text, alamatController.text, emailController.text,
                  fotoController.text, nimProgmobController.text);
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
