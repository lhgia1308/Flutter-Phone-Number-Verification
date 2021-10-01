import 'package:flutter/material.dart';
import 'package:phone_vertification/numeric_pad.dart';
class VerifyPhone extends StatefulWidget{
  final String phoneNumber;
  VerifyPhone({this.phoneNumber});
  @override
  State<StatefulWidget> createState() => _VerifyPhoneState();
}
class _VerifyPhoneState extends State<VerifyPhone>{
  String code="";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Verfiy Phone",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black45,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Code is sent to " + widget.phoneNumber,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF818181)
                      ),
                    )
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildCodeNumberBox(code.length > 0 ? code.substring(0,1) : ""),
                  buildCodeNumberBox(code.length > 1 ? code.substring(1,2) : ""),
                  buildCodeNumberBox(code.length > 2 ? code.substring(2,3) : ""),
                  buildCodeNumberBox(code.length > 3 ? code.substring(3,4) : ""),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Did't receive code?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF818181)
                    ),
                  ),

                  SizedBox(
                    width: 8,
                  ),

                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      "Request again",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.11,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(25)
              //   )
              // ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 64),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          print("Verify and Create Account");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25)
                            )
                          ),
                          child: Center(
                            child: Text(
                              "Verify and Create Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            NumericPad(
            onNumberSelected: (value){
              setState(() {
                if(value!=-1){
                  if(code.length < 4)
                    code = code + value.toString();
                }else if(code.length > 0){
                  code = code.substring(0,code.length-1);
                }
                print(code);
              });
            }
            )
          ],
        ),
      ),
    );
  }
}
Widget buildCodeNumberBox(String codeNumber){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: SizedBox(
      height: 60,
      width: 60,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F5FA),
          borderRadius: BorderRadius.all(
            Radius.circular(15)
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 25.0,
              spreadRadius: 1,
              offset: Offset(0.0, 0.75),
            )
          ]
        ),
        child: Center(
          child: Text(
            codeNumber,
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF1F1F1F),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    ),
  );
}