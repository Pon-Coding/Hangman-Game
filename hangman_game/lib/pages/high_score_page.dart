

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/high_score_model.dart';

class HighScorePage extends StatefulWidget {
  const HighScorePage({Key? key}) : super(key: key);

  @override
  State<HighScorePage> createState() => _HighScorePageState();
}

var now = DateTime.now();
  var formatter = DateFormat('dd-MMM-yy');
  String formattedDate = formatter.format(now);
  

List<HighScoreModel> myList = [
  HighScoreModel(
    rank: 1,
    date: formattedDate,
    score: 200,
  ),
  HighScoreModel(
    rank: 2,
    date: formattedDate,
    score: 110,
  ),
  HighScoreModel(
    rank: 3,
    date: formattedDate,
    score: 100,
  ),
  HighScoreModel(
    rank: 4,
    date: formattedDate,
    score: 90,
  ),
  HighScoreModel(
    rank: 5,
    date: formattedDate,
    score: 50,
  ),
  HighScoreModel(
    rank: 6,
    date: formattedDate,
    score: 30,
  ),
];

class _HighScorePageState extends State<HighScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF421E99),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      const  SizedBox(height: 20),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.white,
                ),
              ),
             const SizedBox(width: 25),
             const Text(
                "Hight Scores",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: "PatrickHand",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        //Rank Date Score
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              Text(
                "Rank",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "PatrickHand",
                  color: Colors.white,
                ),
              ),
              Text(
                "Date",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "PatrickHand",
                  color: Colors.white,
                ),
              ),
              Text(
                "Score",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "PatrickHand",
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
       const SizedBox(height: 15),
        _buildLoop(),
      ],
    );
  }

  Widget _buildLoop() {
    return MediaQuery.removePadding(
      context: context,
        removeTop: true,
      child: ListView.builder(
        //Disable To Scroll
        physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myList.length,
        itemBuilder: ((context, index) {
          return _buildRow(myList[index]);
        }),
      ),
    );
  }

  Widget _buildRow(HighScoreModel myList) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${myList.rank}",
            style:const TextStyle(
              fontSize: 30,
              fontFamily: "PatrickHand",
              color: Colors.white,
            ),
          ),
          Text(
            myList.date,
            style:const TextStyle(
              fontSize: 30,
              fontFamily: "PatrickHand",
              color: Colors.white,
            ),
          ),
          Text(
            "${myList.score}",
            style:const TextStyle(
              fontSize: 30,
              fontFamily: "PatrickHand",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
