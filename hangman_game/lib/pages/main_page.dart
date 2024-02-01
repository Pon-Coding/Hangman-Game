import 'package:flutter/material.dart';

import '../pages/high_score_page.dart';
import '../pages/start_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF40149d),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Column(
      children: [
      const  SizedBox(height: 20),
        SafeArea(
          child: Container(
            alignment: Alignment.center,
            child:const Text(
              "HANGMAN",
              style: TextStyle(
                fontFamily: 'PatrickHand',
                fontSize: 55,
                color: Colors.white,
                
              ),
            ),
          ),
        ),
        SizedBox(
          width: 380,
          height: 380,
          // color: Colors.white,
          child: Image.asset("assets/images/gallow.png",fit: BoxFit.cover,),
        ),
      const  SizedBox(height: 50),
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const StartPage()));
          },
          child: Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: const[
                BoxShadow(
                  offset: Offset(.1,.1),
                  blurRadius: .1,
                  color: Colors.black54,
                  spreadRadius: .1,
                )
              ],
              color:const Color(0xFF1F8AFC),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child:const Text("START",style: TextStyle(
                fontFamily: 'PatrickHand',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
                
              ),),
          ),
        ),
      const  SizedBox(height: 20,),
        //BTN HIGH SCORE
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HighScorePage()));
          },
          child: Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: const[
                BoxShadow(
                  offset: Offset(.1,.1),
                  blurRadius: .1,
                  color: Colors.black54,
                  spreadRadius: .1,
                )
              ],
              color:const Color(0xFF1F8AFC),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child:const Text("HIGH SCORE",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'PatrickHand',
                fontSize: 25,
                color: Colors.white,
                
              ),),
          ),
        ),
      ],
    );
  }
}
