import 'package:first_flutter_project/mahasiswa/mahasiswa_add.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetMahasiswa extends StatefulWidget {
  const GetMahasiswa({Key? key}) : super(key: key);

  @override
  State<GetMahasiswa> createState() => _GetMahasiswaState();
}
class _GetMahasiswaState extends State<GetMahasiswa>{
  List _get = [];
  
  Future _getDataMhs() async {
    try{
      final response = await http.get(Uri.parse(
          'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/72200371'
      ));

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);

        setState((){
          _get = data;
        });
      }
    }catch(e) {}
    }

  @override
  void initState(){
    //useEffect()
    super.initState();
    _getDataMhs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Mahasiswa'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Mahasiswa_add()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _get.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black45, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(_get[index]['nim']+ "-" + _get[index]['nama']),
              subtitle: Text(_get[index]['email']),
            ),

          );
        }

        ),
    );
  }
  }



