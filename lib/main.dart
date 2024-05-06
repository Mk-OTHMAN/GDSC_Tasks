import 'dart:math';

List<int> randomScoreList = [];

//* _____________Function to generate random score list_____________
List<int> generatedScoreList({required List<int> randomScoreList}) {
  for (int i = 0; i < 3; i++) {
    int num = Random().nextInt(40);
    randomScoreList.add(num);
  }
  return randomScoreList;
}

//*_________________Function check on player score ____________________
List checkOnPlayerScore({required List<int> playerScoreList}) {
  List result = []; //! this is final list for evaluation score
  int sum = 0; //! this is sumation of all player score
  //? first thing we will do is sumation of all player score
  //? for to be able to know diffrence between two cases
  //? 1st case is when all score are 0
  //? 2nd case is when all score are greater than 0
  //? and this will be done in this for loop
  for (int i = 0; i < playerScoreList.length; i++) {
    sum += playerScoreList[i];
  }
  //? case score equal to 0
  if (sum == 0) {
    print('your score is 0');
  }
  //? case score greater than 0
  else if (sum > 0) {
    //? we have three throw try for each player and every throw have score between 0 to 40
    //? so we will check if score is in range of throw or not by using list so we need to
    //? check throws in this for loop
    for (int i = 0; i < playerScoreList.length; i++) {
      //? check if throw is in range 1 to 10 :
      if (playerScoreList[i] > 0 && playerScoreList[i] < 11) {
        result.add(1);
      } //? check if throw is in range 11 to 20 :
      else if (playerScoreList[i] > 10 && playerScoreList[i] < 21) {
        result.add(2);
      } //? check if throw is in range 21 to 30 :
      else if (playerScoreList[i] > 20 && playerScoreList[i] < 31) {
        result.add(3);
      } //? check if throw is in range 31 to 40 :
      else if (playerScoreList[i] > 30 && playerScoreList[i] < 41) {
        result.add(4);
      }
    }
  }
  return result;
}

//*_________________Function to return best throw for player ________________
int getEvaluationNumber({required List result}) {
  int evaluation = 0;
  for (int i = 0; i < result.length; i++) {
    for (int j = 1; j < i; j++) {
      if (result[i] > result[j]) {
        evaluation = result[i];
      }
      if (result[i] < result[j]) {
        evaluation = result[j];
      }
      if (result[i] == result[j]) {
        evaluation = result[i];
      }
    }
  }
  return evaluation;
}

//*_________________Function for print description of evaluation to player____________________
String descripEvaluatioToPlayer({required int evaluation}) {
  String result = '';
  switch (evaluation) {
    case 1:
      result = 'Outer Circle throws present';
    case 2:
      result = 'Middle Circle throws present';
    case 3:
      result = 'Inner Circle throws present';
    case 4:
      result = 'Bullseye throws present';
  }
  return result;
}

//! ------------------- main Function -------------------
void main() {
  //!list of random score :
  List<int> playerScoreList =
      generatedScoreList(randomScoreList: randomScoreList);
  // print(playerScoreList);
  //! check on player score in list of random score
  // print(checkOnPlayerScore(playerScoreList: playerScoreList));
  //! list to get best throw for player
  List bestThrowForPlayer =
      checkOnPlayerScore(playerScoreList: playerScoreList);
  // print(getEvaluationNumber(result: bestThrowForPlayer));
  //! description of evaluation
  print(descripEvaluatioToPlayer(
      evaluation: getEvaluationNumber(result: bestThrowForPlayer)));
}
