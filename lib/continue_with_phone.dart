import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_vertification/numeric_pad.dart';
import 'package:phone_vertification/verify_phone.dart';
import 'package:toast/toast.dart';

class ContinueWithPhone extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ContinueWithPhoneState();
}
class _ContinueWithPhoneState extends State<ContinueWithPhone>{
  String phoneNumber = "091";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.close,
          size: 25,
          color: Colors.red,
        ),
        title: Text(
          "Continue With Phone",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black45
          ),
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1,0.9],
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFF7F7F7)
                      ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(
                        height: 180,
                        child: Image.asset(
                          'assets/images/6532.jpg'
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 34),
                        child: Text(
                          "You'll receive a 4 digit code to vertify next",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFF818181)
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),

            Container(
              height: MediaQuery.of(context).size.height*0.11,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Enter your number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),

                          Text(
                            phoneNumber,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          if(phoneNumber.length > 0){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> VerifyPhone(phoneNumber: phoneNumber,))
                            );
                          }else{
                            Toast.show("Enter the number, please!", context, duration: 2, gravity:  Toast.BOTTOM);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20)
                            )
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
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
                  if(value != -1 && phoneNumber.length < 12){
                      phoneNumber = phoneNumber + value.toString();
                  }else if(value == -1 && phoneNumber.length > 0){
                    phoneNumber = phoneNumber.substring(0,phoneNumber.length-1);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}