import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pro_besi_curen/UI/HomePge.dart';
import 'package:pro_besi_curen/UI/MarketViewPage.dart';
import 'package:pro_besi_curen/UI/ProfileViewPage.dart';
import 'package:pro_besi_curen/UI/WatchListPage.dart';
import 'package:pro_besi_curen/UI/ui_helper/BottomNave.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {

  final PageController _myPage=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed:() {
      },
      child: Icon(Icons.compare_arrows_outlined),
      ) ,
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNave(controller: _myPage,),
      body: PageView(
        controller:_myPage ,
        children: [
          HomePage(),
          MarketPage(),
          ProfilePage(),
          watchListPage()
        ],
      ),
    );
  }
}