import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ViewPageHome extends StatefulWidget {
  var controller;
  ViewPageHome(  {required this.controller});

  @override
  State<ViewPageHome> createState() => _ViewPageHomeState();
}

class _ViewPageHomeState extends State<ViewPageHome> {
  var images=[
  'images/a1.png',
  "images/a2.png",
  "images/a3.png",
  "images/a4.png",
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      controller: widget.controller,
      children: [
        myPages(images[0]),
        myPages(images[1]),
        myPages(images[2]),
        myPages(images[3])
      ],
    );

  }
}
Widget myPages(String image){

  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    child: Image(image: AssetImage(image),fit: BoxFit.fill,),
  );
}