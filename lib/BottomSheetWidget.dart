import 'package:flutter/material.dart';
import 'choiceList.dart';

class boottomWidget extends StatelessWidget{

   boottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            Text("what's ...",textAlign: TextAlign.center),
            const Divider(color: Colors.teal,thickness: 3),
           SimpleDialogOption(
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.flight),
                Text("plane")
              ],
            ),
            onPressed: (){Navigator.pop(context,ChoiceList.plane);},
          ),
              const Divider(color: Colors.teal,thickness: 3),
          SimpleDialogOption(
            child: const Row(
                 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.directions_car),
                Text("Car")
              ],
            ),
            onPressed: (){Navigator.pop(context,ChoiceList.car);},
          ),
              const Divider(color: Colors.teal,thickness: 3),
          SimpleDialogOption(
            child: const Row(
                 mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.directions_boat),
                Text("Boat")
              ],
            ),
            onPressed: (){Navigator.pop(context,ChoiceList.boat);},
          )
        ],
        ),
      ),
    );
  }
}