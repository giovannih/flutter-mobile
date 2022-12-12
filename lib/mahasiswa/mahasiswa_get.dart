import 'package:first_flutter_project/mahasiswa/mahasiswa_add.dart';
import 'package:first_flutter_project/mahasiswa/mahasiswa_update.dart';
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
  Future _delMhs(String id,nimProgmob) async {
    final http.Response response = await http.post((Uri.parse(
        'https://kpsi.fti.ukdw.ac.id/api/progmob/mhs/delete'
    )),
      headers: <String, String>{
        "Content-Type": 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'id' : id,
        'nim_progmob': nimProgmob
      }),
    );
    if (response.statusCode == 201) {
      throw Exception('Failed to load response');
    } else {
      _getDataMhs();
    }
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
      body: RefreshIndicator(
        onRefresh: _getDataMhs,
        child: ListView.builder(
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
                trailing: PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: Text('edit'),
                          value: 'edit',
                          onTap: () async {
                            final navigator = Navigator.of(context);
                            await Future.delayed(Duration.zero);
                            navigator.push(
                              MaterialPageRoute(builder: (context) => Mahasiswa_update(nim: _get[index]['nim'].toString())),
                            );
                          },
                      ),
                      PopupMenuItem(
                        child: Text('delete'),
                        value: 'delete',
                        onTap: () async {
                          _delMhs(_get[index]['id'].toString(),'72200366');
                          },
                      )
                    ];
                  }
                ),
                ),
            );
          }

          ),
        )
      );
    }
  }



