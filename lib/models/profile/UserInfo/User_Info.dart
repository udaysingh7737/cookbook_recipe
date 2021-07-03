import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class User_info extends StatefulWidget {
  @override
  _User_infoState createState() => _User_infoState();
}

// ignore: camel_case_types
class _User_infoState extends State<User_info> {
  final TextEditingController _textEditingController = TextEditingController();
  final FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("Contects").orderBy("asc");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 50),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(hintText: "Enter any data"),
                ),

                ElevatedButton(onPressed: ()async{
                  await collectionReference.add({'name': _textEditingController.text}).then((value) => _textEditingController.clear());
                },
                    child: Text("Add Data")
                ),
                Expanded(
                  child: StreamBuilder(stream: collectionReference.snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                        if(snapshot.hasData){
                          return ListView(
                            children: snapshot.data.docs.map((e) => ListTile(title: Text(e['name']),)).toList(),
                          );
                        }
                        return Center(child: CircularProgressIndicator(),);
                      }
                  )
                  ),

              ],
            ),

          ),
        ),
      ),
    );
  }
}
