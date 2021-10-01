import 'package:flutter/material.dart';
class NumericPad extends StatelessWidget{
  final Function(int) onNumberSelected;
  NumericPad({@required this.onNumberSelected});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xFFF5F4F9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(1),
                buildNumber(2),
                buildNumber(3),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(4),
                buildNumber(5),
                buildNumber(6),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildNumber(7),
                buildNumber(8),
                buildNumber(9),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildEmptySpace(),
                buildNumber(0),
                buildBackSpace(),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildNumber(int number){
    return Expanded(
        child: GestureDetector(
          onTap: (){
            onNumberSelected(number);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(15)
                  )
              ),
              child: Center(
                child: Text(
                  number.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1F1F)
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
  Widget buildBackSpace(){
    return Expanded(
        child: GestureDetector(
          onTap: (){
            onNumberSelected(-1);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(15)
                  )
              ),
              child: Center(
                child: Icon(
                  Icons.backspace,
                  size: 28,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
          ),
        )
    );
  }
  Widget buildEmptySpace(){
    return Expanded(child: Container());
  }
}
