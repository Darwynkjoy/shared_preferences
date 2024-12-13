
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoringString extends StatefulWidget{
  @override
  State<StoringString> createState()=> _StoringStringState();
}

class _StoringStringState extends State<StoringString>{
      String name="";

    void initState(){
      super.initState();
      loadname();
    }

    loadname()async{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      setState(() {
        name=prefs.getString("name")??"No name saved";
      });
    }

    Savedname(String name)async{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      setState(() {
        prefs.setString("name", name);
      });
      loadname();
    }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("Storing int",style: TextStyle(fontSize: 25,color: Colors.black),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Text("Saved name:$name",style: TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                onChanged: (value) {
                  name=value;
                  Savedname(name);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                  labelText:"Enter name"),
              )),
          ],
        ),
      ),
    );
  }
}