import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 50),
           child: Container(
             height: 250.0,
             width: 300.0,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage("assets/images/help2.png")
                   ),
                     borderRadius: BorderRadius.all(Radius.circular(10.0))),

           ),
         ),
         Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 60,left: 20,right: 20),
               child: Text("Always there to help you,no matter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
               child: Text("the time zone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
             ),
             Padding(
               padding: const EdgeInsets.only(top: 40,left: 90,right: 50),
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 55),
                     child: IconButton(onPressed: (){
                       launchUrl("tel:+919778153657");

                     }, icon: Icon(Icons.phone,size: 50,color: Colors.green,)),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15,right: 55),
                     child: IconButton(onPressed: (){
                       launchUrl("sms:+919778153657");
                       }, icon: Icon(Icons.message_rounded,size: 50,color: Colors.green,)),
                   ),


                 ],
               ),
             )
           ],
         )
       ],
      ),

    );
  }
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }
}
