

import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../models/high_score_model.dart';
import '../models/word_list.dart';
import '../widgets/write_to_json.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

int imageIndex = 0;
List<String> imageList = [
  "assets/images/0.png",
  "assets/images/1.png",
  "assets/images/2.png",
  "assets/images/3.png",
  "assets/images/4.png",
  "assets/images/5.png",
  "assets/images/6.png",
];

int scoreOfGame = 0;

int indexCurrectString = 0;
String correctWord = "";

String gameWord = "";
var ran = Random();
int wordIndex = 0;

List<String> character = [];


//set maximum life
int gameLife = 5;
bool _lightBtn = true;


//Timer
const int _duration = 20;
final CountDownController _controller = CountDownController();

String randomcharacter(String myWord) {
  List<String> characters = myWord.split('').map((e) => e.toString()).toList();

  int randomIndex = Random().nextInt(characters.length);

  String randomcharacter = characters[randomIndex];

  return randomcharacter;
}

void generateDashToList() {
  _lightBtn = true;
  correctWord = "";
  wordIndex = 0;
  indexCurrectString = 0;
  imageIndex = 0;
  character = [];
  gameWord = "";
  wordIndex = ran.nextInt(myWord.length);
  gameWord = myWord[wordIndex].toUpperCase();

  // debugPrint("$gameWord");
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    generateDashToList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF421E99),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Column(
      children: [
       const SizedBox(height: 30),
        _buildUpperRow,
      const  SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          width: 250,
          height: 250,
          child: Image.asset(
            imageList[imageIndex],
            fit: BoxFit.cover,
          ),
        ),
       const SizedBox(height: 20),
        buildDash(),
       const SizedBox(height: 20),
        _buildKeyboard,
      ],
    );
  }

  Widget get _buildUpperRow {
    return SafeArea(
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const  Icon(
                  Icons.favorite_outlined,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: _buildTimer(),
                ),
                InkWell(
                  onTap: _lightBtn
                      ? () {
                          setState(() {
                            character.add(randomcharacter(gameWord));
                            indexCurrectString++;
                            _lightBtn = false;
                            if (indexCurrectString == gameWord.length) {
                              _controller.pause();
                              showMyDialog(context);
                            }
                          });
                        }
                      : () {},
                  child: Icon(
                    Icons.lightbulb,
                    color: _lightBtn ? Colors.white : Colors.grey,
                    size: 40,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 6,
              left: 16,
              child: Text(
                "$gameLife",
                style:const TextStyle(
                  fontFamily: "PatrickHand",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildKeyboard {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: alphabet.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return _buildItem(alphabet[index]);
          }),
    );
  }

  Widget _buildItem(String item) {
    return InkWell(
      onTap: character.contains(item)
          ? () {}
          : () {
              setState(() {
                character.add(item);
                if (!gameWord.split('').contains(item)) {
                  imageIndex++;

                  if (imageIndex >= 7) {
                    _controller.pause();
                    showDialogRetry(context);
                    imageIndex = 0;
                  }
                  if (gameLife == 0 && imageIndex == 6) {
                    showMyDialogGameOver(context);
                  }
                } else {
                  correctWord += item;
                  indexCurrectString++;
                  if (indexCurrectString == gameWord.length) {
                    _controller.pause();
                    showMyDialog(context);
                  }
                }
              });
            },
      child: Container(
        width: 10,
        height: 10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: character.contains(item) ? Colors.grey :const Color(0xFF1F8AFC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          item,
          style:const TextStyle(
            color: Colors.white,
            fontFamily: "PatrickHand",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //getText
  Widget getDash(String character, bool isVisible) {
    return Container(
      width: 40,
      height: 40,
      decoration:const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      margin:const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      child: Visibility(
        visible: isVisible,
        child: Text(
          character,
          style:const TextStyle(
            fontSize: 30,
            fontFamily: "PatrickHand",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  //random
  Widget buildDash() {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: gameWord
                  .split('')
                  .map((e) =>
                      getDash(e.toString(), character.contains(e.toString())))
                  .toList())),
    );
  }

  //Dialog
  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor:const Color(0xFF421E99),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin:const EdgeInsets.only(top: 20),
                  height: 200,
                  width: double.maxFinite,
                  child: Lottie.asset("assets/lottie/correctAnswer.json"),
                ),
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    gameWord,
                    style:const TextStyle(
                        fontSize: 40,
                        color: Color(0xFF04f905),
                        fontWeight: FontWeight.bold,
                        fontFamily: "PatrickHand"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      generateDashToList();
                      _controller.restart();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      scoreOfGame++;
                    });
                  },
                  child: SizedBox(
                    height: 40,
                    child: Center(
                      child: Lottie.asset("assets/lottie/continue.json",
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //GameOver Dialog Alert

  Future<void> showDialogRetry(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor:const Color(0xFF421E99),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.only(top: 20),
                  height: 200,
                  width: double.maxFinite,
                  child: Lottie.asset("assets/lottie/wrongAnswer.json"),
                ),
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    gameWord,
                    style:const TextStyle(
                        fontSize: 40,
                        color: Color(0xFFba0405),
                        fontWeight: FontWeight.bold,
                        fontFamily: "PatrickHand"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          WriteToJson.write(scoreOfGame);
                          scoreOfGame = 0;
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child:const Text("EXIT"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gameLife--;
                          generateDashToList();
                          _controller.restart();
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child:const Text("RETRY"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Restart And Exit
  Future<void> showMyDialogGameOver(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor:const Color(0xFF421E99),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.only(bottom: 20),
                  height: 200,
                  width: double.maxFinite,
                  child: Lottie.asset("assets/lottie/gameOver.json"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          WriteToJson.write(scoreOfGame);
                          scoreOfGame = 0;
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child:const Text("EXIT"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (gameLife == 0) {
                            gameLife = 5;
                            _controller.restart();
                            WriteToJson.write(scoreOfGame);
                            debugPrint("scoreOfGame : $scoreOfGame");
                          }
                          generateDashToList();
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child:const Text("RESTART"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Time up Dialog

  Future<void> showMyDialogTimeUp(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor:const Color(0xFF421E99),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.only(bottom: 20),
                  height: 200,
                  width: double.maxFinite,
                  child: Lottie.asset("assets/lottie/time_up.json"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          WriteToJson.write(scoreOfGame);
                          scoreOfGame = 0;
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child:const Text("EXIT"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          gameLife--;
                          generateDashToList();
                          _controller.restart();
                          WriteToJson.write(scoreOfGame);
                          scoreOfGame = 0;
                        });
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child:const Text("RETRY"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //BuildTimer
  Widget _buildTimer() {
    return CircularCountDownTimer(
      duration: _duration,
      initialDuration: 0,
      controller: _controller,
      width: 20,
      height: 20,
      ringColor:const Color(0xFF421E99),
      ringGradient: null,
      fillColor: Colors.white,
      fillGradient: null,
      backgroundColor:const Color(0xFF421E99),
      backgroundGradient: null,
      strokeWidth: 4,
      strokeCap: StrokeCap.round,
      textStyle:const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "PatrickHand"),
      textFormat: CountdownTextFormat.S,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,

      //Importance
      autoStart: true,

      onStart: () {
        //
      },

      onComplete: () {
        if (gameLife > 0) {
          _controller.pause();
          showMyDialogTimeUp(context);
          debugPrint('Countdown Ended');
        } else if (gameLife == 0) {
          showMyDialogGameOver(context);
        }
      },
    );
  }
}
