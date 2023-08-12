import 'package:flutter/material.dart';
import 'choiceList.dart';


class SimpleDialogWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        title: const Text("What Is Your Favorite mean of transport"),
        children: [
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
      );
  }
}