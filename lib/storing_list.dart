import 'package:flutter/material.dart';

class StoringList extends StatefulWidget{
  @override
  State<StoringList> createState()=> _StoringlistState();
}

class _StoringlistState extends State<StoringList>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Storing list"),
        centerTitle: true,
      ),
      body: Column(


        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText:"enter text", 
            ),
          ),
          ListTile(
          title: Text("data"),),
        ]
        ),
    );
  }
  }
