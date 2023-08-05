import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController problem=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        right: true,
        left: true,
        bottom: true,
        top: true,
        child: ListView(
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
                 padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                 child: Text("Always there to help you,no matter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
                 child: Text("the time zone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
               ),
                   SizedBox(
                     width: 350,
                     height: 430,
                     child: Card(
                       child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 1,top: 15,right: 260),
                           child: Text("Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: SizedBox(
                             width: 300,
                             height: 70,
                             child: TextFormField(
                               controller: name,
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'Please enter your Name';
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                 prefixIcon: Icon(Icons.person),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                       width: 3, color: Colors.green),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 5,top: 5,right: 210),
                           child: Text("Your Number",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: SizedBox(
                             width: 300,
                             height: 70,
                             child: TextFormField(
                               controller: number,
                               keyboardType: TextInputType.number,
                               validator: (value) {
                                 if (value!.length == 0) {
                                   return 'Enter a valid number';
                                 }else if(value.length<10){
                                   return 'Enter a valid number';
                                 }else
                                   return null;
                               },
                               decoration: InputDecoration(
                                 prefixIcon: Icon(Icons.phone),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                       width: 3, color: Colors.green),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left: 5,top: 5,right: 160),
                           child: Text("Problem Description",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: SizedBox(
                             width: 300,
                             height: 70,
                             child: TextFormField(
                               controller: problem,
                               validator: (value) {
                                 if (value == null || value.isEmpty) {
                                   return 'Please Enter Problem';
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                 suffixIcon: GestureDetector(
                                     onTap: (){
                                       print("${problem}");
                                       problem.clear();
                                       number.clear();
                                       name.clear();
                                       ScaffoldMessenger.of(context).showSnackBar(
                                         SnackBar(content: Text('Your Problem Is Recorded')),

                                       );
                                     },
                                     child: Icon(Icons.send)),
                                 prefixIcon: Icon(Icons.pending_actions_outlined),
                                 enabledBorder: OutlineInputBorder(
                                   borderSide: BorderSide(
                                       width: 3, color: Colors.green),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Row(
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 30),
                               child: SizedBox(
                                 height: 50,
                                 width: 120,
                                 child: ElevatedButton(onPressed: (){
                                   launchUrl("tel:+919778153657");

                                 }, child: Text("Call"),style: ElevatedButton.styleFrom(
    primary: Colors.green,),),
                               )
                             ),
                             Padding(
                                 padding: const EdgeInsets.only(left: 30),
                                 child: SizedBox(
                                   height: 50,
                                   width: 120,
                                   child: ElevatedButton(onPressed: (){
                                     launchUrl("sms:+919778153657");

                                   }, child: Text("Text"),style: ElevatedButton.styleFrom(
                                     primary: Colors.green,),),
                                 )
                             ),
                           ],
                         )
                       ],
                 ),
                     ),
                   ),
             ],
           ),
         ],
        ),
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