
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferenceexample extends StatefulWidget{
  @override
  State<Sharedpreferenceexample> createState()=> _SharedpreferenceState();
}

class _SharedpreferenceState extends State<Sharedpreferenceexample>{
  int Count=0;

  void initState(){
    super.initState();
    loadCounter();
  }

  loadCounter()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      prefs.getInt("count")?? 0;
    });
  }

  incrementCounter()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    setState(() {
      Count++;
    });
    preferences.setInt("count", Count);
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
            Text("Count value:$Count",style: TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(onPressed: (){
                incrementCounter();
              },
              child: Text("increment counter:",style: TextStyle(fontSize: 20,color: Colors.black),))),
          ],
        ),
      ),
    );
  }
}