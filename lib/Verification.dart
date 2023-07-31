import 'package:aspire/Homepage.dart';
import 'package:aspire/main.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10,left: 10,right: 330),
            child: IconButton(onPressed: (
                ){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
              );
            }, icon: Icon(Icons.arrow_back_outlined)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30,left: 155,right: 154),
            child: SizedBox(
              height: 130,
              width: 81,
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60,left: 10),
            child: Text("Verification",
              style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18) ,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1,left: 10),
            child: Text("Verification code has been sent to",
              style:TextStyle(fontWeight: FontWeight.w400,fontSize: 14) ,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:1,left: 10),
            child: Text("test@hotmail.com",
              style:TextStyle(fontWeight: FontWeight.w500,fontSize: 14) ,),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 47,left: 10),
            child: OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 54,
              style: TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,left: 20,right: 20),
            child: SizedBox(
              height: 50,
              width: 500,
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
                  child: Text("Verify&Continue"),style: ElevatedButton.styleFrom(
    primary: Colors.green,)
              ),
            ),
          ),
          TextButton(onPressed: (){},
              child: Text("Resend code",style: TextStyle(
                fontWeight: FontWeight.w400,fontSize: 14
              ),))

        ],
      )
    );
  }
}

