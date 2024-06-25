
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/widgets/home_widgets/CustomCarouel.dart';
import 'package:women_safety_app/widgets/home_widgets/custom_appBar.dart';
import 'package:women_safety_app/widgets/home_widgets/emergency.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen ({super.key});
int qIndex = 0;

getRandomQuote(){
  Random random = Random();

  setState(() {
    qIndex = random.nextInt(13);
  });
}
@override
void initState(){
  getRandomQuote();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
         CustomAppBar(
           quoteIndex: qIndex,
           onTap: () {
             getRandomQuote();
           } ),
          Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomCarouel(),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text("Emergency",
                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold ),),
                 ),
                Emergency() ,
            ],
              ),
          ),
        ],
      ),
    ),
    ),
  );
  }
}