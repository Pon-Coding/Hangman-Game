import 'dart:convert';

import 'dart:io';

class WriteToJson {
  static void write(int scoreOfGame) {
    Map<String, dynamic> score = {
      "score": scoreOfGame,
    };

    String jsonString = jsonEncode(score);

    File file = File(
        "/Users/apple/Internship Projects/Hangman_game/hangman_game_project/lib/Widgets/saveScoreToJson.json");
    file.writeAsString(jsonString);
  }

  static List<dynamic> read() {
    String path = "/Users/apple/Internship Projects/Hangman_game/hangman_game_project/lib/Widgets/saveScoreToJson.json";

    File file = File(path);

    file.open(mode: FileMode.read);

    String data = file.readAsStringSync();

    Map<String, dynamic> jsonObject = jsonDecode(data);

    return [jsonObject];
  }
}
