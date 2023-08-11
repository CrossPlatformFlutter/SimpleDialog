import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("CHose Option")),
      body: 
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Navigator.pop(context,"Yes");}, child: Text("Yes")),
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            ElevatedButton(onPressed: (){Navigator.pop(context,"No");}, child: Text("No"))
          ],
        ),
       ),
    );
  }
}