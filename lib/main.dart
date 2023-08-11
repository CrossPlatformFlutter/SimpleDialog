import 'package:flutter/material.dart';
import 'package:simpledialog/choiceList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DialogExempleAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DialogExempleAPP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String choice="no choice yet";

  void setChoice(String val){
    setState(() {
      this.choice=val;
    });
  }
  
  Future<void> pinkChoice() async{
    ChoiceList ?resultat=await showDialog<ChoiceList>(barrierDismissible: false,context: context, builder:(BuildContext context){
      return SimpleDialog(
        title: Text("What Is Your Favorite mean of transport"),
        children: [
          SimpleDialogOption(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.flight),
                Text("plane")
              ],
            ),
            onPressed: (){Navigator.pop(context,ChoiceList.plane);},
          ),
          SimpleDialogOption(
            child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.directions_car),
                Text("Car")
              ],
            ),
            onPressed: (){Navigator.pop(context,ChoiceList.car);},
          ),
          SimpleDialogOption(
            child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.directions_boat),
                Text("Boat")
              ],
            ),
            onPressed: (){Navigator.pop(context,ChoiceList.boat);},
          )
        ],
      );});

    if (resultat!=null){
     switch (resultat) {
      case ChoiceList.boat:
        setChoice("boat");
        break;
      case ChoiceList.plane:
        setChoice("plane");
        break;
      case ChoiceList.car:
        setChoice("car");
        break;
    }
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ), 
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           ElevatedButton(onPressed:pinkChoice, child: Text("open Simple Dialog",style: TextStyle(color: Colors.white,fontSize: 20),),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
           Text("this You Choice "),
           Text("${choice}",style: TextStyle(fontSize: 25)),
        ]),
      ),
    );
  }
}
