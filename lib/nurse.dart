import 'package:aspire/Homepage.dart';
import 'package:aspire/main.dart';
import 'package:flutter/material.dart';

class Nurse extends StatefulWidget {
  const Nurse({super.key});

  @override
  State<Nurse> createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
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
    MaterialPageRoute(builder: (context) => Homepage()),
    );
    }, icon: Icon(Icons.arrow_back_outlined)),
    ),
      CircleAvatar(
        radius: 88,
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          radius: 86.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            child:

            Padding(
              padding: const EdgeInsets.only(top: 130,left: 130,right: 0,bottom: 10),
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 12.0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.camera_alt,
                    size: 15.0,
                    color: Color(0xFF404040),
                  ),
                ),
              ),
            ),
            radius: 84.0,
            backgroundImage: AssetImage(
                'assets/images/new.png'),
          ),
        ),
      ),
      Column(
        children: [
          Text("Anna",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: Colors.blueGrey),),
    Text("Annaben@gmail.com",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blueGrey),
    ) ,

        Padding(
          padding: const EdgeInsets.only(top:100),
          child: ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Aspire()),
            );
          }, child: Text("Logout"),style: ElevatedButton.styleFrom(
            primary: Colors.green
          ),),
        )



        ]
      )
        ]
      )
    );
  }
}
