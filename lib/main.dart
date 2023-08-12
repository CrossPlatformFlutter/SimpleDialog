import 'package:flutter/material.dart';
import 'package:simpledialog/choiceList.dart';
import 'simpleDialog.dart';
import 'SecondSecreen.dart';
import 'BottomSheetWidget.dart';
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
  String source="";

  void setChoice(String val){
    setState(() {
      choice=val;
    });
  }

   void setSource(String val){
    setState(() {
      source="with ${val}";
    });
  }
  
Future<void> _navigateAndDisplaySelection(BuildContext context) async {
  String? result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (BuildContext context) => SecondScreen()),
  );

  if (result != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );
  }
}

  Future<void> pinkChoice() async{
    setSource("simpleDialog");
    ChoiceList ?resultat=await showDialog<ChoiceList>(
      barrierDismissible: false,
      context: context,
       builder:(BuildContext context){
          return SimpleDialogWidget();
        });

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
      default:
      setChoice("No Choice");
      break;
    }
    }
  }

  Future<void> pinkChoiceBottomSheet()async{
    setSource("BottomSheet");
    ChoiceList ? result=await showModalBottomSheet(
      isDismissible: false,
      context: context, 
      builder:(BuildContext context){
        return  boottomWidget();
    });

     if (result!=null){
     switch (result) {
      case ChoiceList.boat:
        setChoice("boat");
        break;
      case ChoiceList.plane:
        setChoice("plane");
        break;
      case ChoiceList.car:
        setChoice("car");
        break;
      default:
      setChoice("No Choice");
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
            ElevatedButton(onPressed:pinkChoiceBottomSheet,
            child: 
            Text("open BottomShit",
            style: TextStyle(color: Colors.white,fontSize: 20),),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
           ElevatedButton(onPressed:pinkChoice,
            child: 
            Text("open Simple Dialog",
            style: TextStyle(color: Colors.white,fontSize: 20),),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
           const Text("this You Choice "),
           Text("${choice}",style: const TextStyle(fontSize: 25)),
           Text(source,style: TextStyle(fontWeight: FontWeight.bold),),
           IconButton(onPressed:()async { await _navigateAndDisplaySelection(context); } ,
            icon: Icon(Icons.replay))
        ]),
      ),
    );
  }
}
