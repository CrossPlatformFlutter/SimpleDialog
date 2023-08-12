import 'package:flutter/material.dart';
import 'package:simpledialog/SecondSecreen.dart';

void main(){
  runApp(
    const HomeScreen()
  );
}

class HomeScreen  extends StatelessWidget{

  const HomeScreen({super.key});
   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SelectionButton(),
      /*routes: <String,WidgetBuilder>{
        "Route1":(context)=>SecondScreen(),
      },*/
    );
  }
}

class SelectionButton extends StatefulWidget{
  const SelectionButton({super.key});
      @override
  State<StatefulWidget> createState() =>_SelectionButton();
  
}

class _SelectionButton extends State<SelectionButton>{
 
  Future<void> navigation()async{
    String ? result=await Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> const SecondScreen()));
    if(result!=null){
      setState(() {
         //SnackBar snack=SnackBar(content: Text(result),duration: Duration(seconds: 2),);
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
      });
    }
  }
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("test"),),
      body: Center(child: ElevatedButton(onPressed: navigation,child:const Icon(Icons.send_and_archive))),
    );
  }
}