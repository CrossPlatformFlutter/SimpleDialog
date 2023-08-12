import 'package:flutter/material.dart';

void main(){
  runApp( const HomePage());
}

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(title:"Hello"),
    );
  }
}

class HomeApp extends StatefulWidget{
  const HomeApp({super.key,required this.title});

  final String title;

  @override
  State<HomeApp> createState()=>_HomeApp();
}

class _HomeApp extends State<HomeApp>{

   Future<void> choiceSomethin() async {
      String ? result=await showDialog(barrierDismissible: false,context: context, builder: (context){
            return SimpleDialog(
              title: const Text("choice something"),
              children: [
                SimpleDialogOption(
                  onPressed: (){Navigator.pop(context,"heart");},
                  child: const Row(children: [
                    Icon(Icons.favorite),
                     Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Heart")
                    ]),
                ),
                  SimpleDialogOption(
                      onPressed: (){Navigator.pop(context,"Alarm");},
                  child: const Row(children: [
                    Icon(Icons.access_alarms),
                     Padding(padding: EdgeInsets.only(left: 10)),
                    Text("Alarm")
                    ]),
                ),
                  SimpleDialogOption(
                   onPressed: (){Navigator.pop(context,"home");},
                  child:const Row(children: [
                    Icon(Icons.home),
                     Padding(padding: EdgeInsets.only(left: 10)),
                    Text("home")
                    ]),
                )
              ],
            );
      });
      switch(result){
        case 'home':
        setState(() {
           choice="home";
        });
         break;
           case "Alarm":
         setState(() {
             choice="Alarm";
         });
       break;
         case "heart":
         setState(() {
            choice="heart";
         });
         break;
      }
   }

  String choice="no yet";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: Text("Hello"),),
    body: Center(child: 
      Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
         ElevatedButton(onPressed: choiceSomethin, child: 
           Text("Choice Plan",style: TextStyle(fontSize:18),),style: ElevatedButton.styleFrom(backgroundColor: Colors.indigoAccent),),
          const Padding(padding:EdgeInsets.only(bottom: 20)),
          Text("${choice}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
      ],
      ),
      ),
   );
  }
}