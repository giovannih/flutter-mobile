import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mahasiswa_update extends StatefulWidget {

  Mahasiswa_update({Key? key , required this.nim}) : super(key: key);
  final String nim;
  
  @override
  State<Mahasiswa_update> createState() => _Mahasiswa_updateState();
}

class _Mahasiswa_updateState extends State<Mahasiswa_update> {
  List _get = [];

  Future _getDataMhs() async {
    try{
      final response = await http.get(Uri.parse(
          'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200366'
      ));

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);

        setState((){
          _get.clear();
          _get = data;
        });
      }
    }catch(e) {
      print(e);
    }
  }
  @override
  void initState(){
    //useEffect()
    super.initState();
    _getDataMhs();
  }
  final _formKey = GlobalKey<FormState>();
  Future<List>? resp;
  
  TextEditingController idController = new TextEditingController();
  TextEditingController namaController = new TextEditingController();
  TextEditingController nimController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController fotoController = new TextEditingController();
  TextEditingController nimProgmobController = new TextEditingController();

  Future<List> updateMhs(String id,nama,nim,alamat,email,foto,nim_progmob) async {
    final http.Response response = await http.post((Uri.parse(
        'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/update'
    )),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'nama': nama,
        'nim': nim,
        'alamat': alamat,
        'email': email,
        'foto': foto,
        'nim_progmob': nim_progmob
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Mahasiswa"),
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
                  resp = updateMhs(idController.text,namaController.text, nimController.text, alamatController.text, emailController.text,
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
