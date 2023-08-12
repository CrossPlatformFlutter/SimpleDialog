import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{

  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("CHose Option")),
      body: 
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){Navigator.pop(context,"Yes");}, child: const Text("Yes")),
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            ElevatedButton(onPressed: (){Navigator.pop(context,"No");}, child:const  Text("No"))
          ],
        ),
       ),
    );
  }
}