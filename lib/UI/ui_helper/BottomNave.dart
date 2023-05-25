import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomNave extends StatelessWidget {
  PageController controller;
  BottomNave({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return  BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      color: Colors.amber,
      child:SizedBox(
        height: 63,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(

          width: MediaQuery.of(context).size.width/2-20,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(onPressed: () {
              controller.animateToPage(0, duration:Duration(milliseconds: 300), curve: Curves.easeIn);
            }, icon: Icon(Icons.home),
            ),
            IconButton(onPressed: () {
              controller.animateToPage(1, duration:Duration(milliseconds: 300), curve: Curves.easeIn);
            }, icon: Icon(Icons.bar_chart),
            ),
          ]
          ),
          ),
          SizedBox(
          width: MediaQuery.of(context).size.width/2-20,
          height: 50,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            IconButton(onPressed: () {
              controller.animateToPage(2, duration:Duration(milliseconds: 300), curve: Curves.easeIn);
              }, icon: Icon(Icons.bookmark),
            ),
            IconButton(onPressed: () {
              controller.animateToPage(3, duration:Duration(milliseconds: 300), curve: Curves.easeIn);
              }, icon: Icon(Icons.person),
            ),
          ]
          ),
          ),
        ],
      ),

      ),
    );
  }
}