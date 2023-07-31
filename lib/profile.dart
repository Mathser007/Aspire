import 'package:aspire/Homepage.dart';
import 'package:aspire/listing.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var how =TextEditingController();
  List<int> mylist=[];
  bool checkinlist(int index)  {
    bool yes=false;
    for(int i=0;i<mylist.length;i++) {
      if(mylist[i]==index){
        yes=true;
        return yes;
      }
    }
    return yes;
  }
  TextEditingController dateinput = TextEditingController();
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  void initState() {
    dateinput.text = "";
    super.initState();
  }
  var currentindex = 0;

  void buttonClicked() {
    setState(() {
      if(currentindex==11){
        currentindex=0;
      }else {
        currentindex = currentindex + 1;
      }
    });
  }
  void clicked() {
    setState(() {
      if (currentindex == 0) {
        currentindex = 11;
      }
      else {
        currentindex = currentindex - 1;
      }
    });
  }
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var questions = [
      // list of text which the text get form here
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return  Scaffold(
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.only(top:10,left: 10,right: 330),
          child: IconButton(onPressed: (
              ){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Listing()),
            );
          }, icon: Icon(Icons.arrow_back_outlined)),
        ),
          Container(
            height: 500,
            width: 300,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 82,
                  backgroundColor: Colors.teal,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/nurse.png"),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Amala Joy",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Surgical Assistant Nurse",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("*4.0"),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 20),
                      child: Text("Biography",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15,left: 20),
                      child:SizedBox(
                        width: 350,
                        child: Text(
                          "Nursing is an altruistic profession that requires"
                          "advanced training and knowledge When nurses"
                        "apply for jobs or switch roles, they may need to"
                        "provide a professional biography",
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                        ),
                      ),
                    ),


                      ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:30,left: 52),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("certificate",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("4",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left: 50),
                      child: Container(
                          height: 52,
                          width: 1,
                          color: Colors.black

                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 45),
                    child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("experience",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("5 years",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                                )
                              ],
                            ),
                  ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: DropdownButton2(
                      hint: Text(
                        'Education',
                        style: TextStyle(
                          fontSize: 14,fontWeight: FontWeight.w600,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      buttonStyleData: const ButtonStyleData(
                        height: 40,
                        width: 500,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Container(
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 15),
                          child: Text("Scheduled",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 165),
                          child: Row(
                            children: [
                              IconButton(onPressed: clicked, icon: Icon(Icons.arrow_back_ios_new,size: 12,)),
                              Text(questions[currentindex],style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
                              IconButton(onPressed:buttonClicked, icon:Icon(Icons.arrow_forward_ios,size: 12,))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 25),
                child: SizedBox(
                  height: 50,
                  width: 170,
                  child: TextField(
                    controller: dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(),//icon of text field
                        labelText: "Start Date" //label text of field
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      if(pickedDate != null ){
                        print(pickedDate);
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);

                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 15),
                child: SizedBox(
                  height: 50,
                  width: 170,
                  child: TextField(
                    controller: dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(),//icon of text field
                        labelText: "End Date" //label text of field
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      if(pickedDate != null ){
                        print(pickedDate);
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);

                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 78,
            child: ListView.builder(
                itemCount:10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {

                  return GestureDetector(
                    onLongPress: (){
                      setState(() {
                        mylist.clear();
                      });
                    },
                    onTap: () {
                      setState(() {
                        mylist.add(index);


                      });



                    },
                    child:
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color:  checkinlist(index) ? Colors.green : Colors.grey,
                            //                   <--- border color
                            width: 1.0,
                          ),
                        ),
                        height: 70,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 17.0),
                                  child: Text("MON", style: TextStyle(fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: checkinlist(index) ? Colors.green : Colors
                                          .grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("8", style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: checkinlist(index) ? Colors.green : Colors
                                          .grey),),
                                )


                          ],
                        ),
                      ),
                    ),


                  );
                }),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 20,right: 20),
                child: SizedBox(
                  height: 40,
                  width: 165,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      border: OutlineInputBorder(),
                      hintText: 'Start Time',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 15,right: 20),
                child: SizedBox(
                  height: 40,
                  width: 165,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      border: OutlineInputBorder(),
                      hintText: 'End Time',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 20),
            child: Text("Time Scheduled",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          ),
          Container(
            height: 100,
            child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {

                  return GestureDetector(
                    onDoubleTap: ()
                    {
                      setState(() {
                        mylist.clear();
                      });
                    },
                    onTap: () {
                      setState(() {
                        mylist.add(index);
                      });
                    },
                    child:
                    Padding(
                      padding: const EdgeInsets.only(top:1,left: 20,bottom: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:  checkinlist(index) ? Colors.green : Colors.grey,
                                    //                   <--- border color
                                    width: 1.0,
                                  ),
                                ),
                                height: 45,
                                width: 105,
                                child:Center(child: Text("Day"))
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:  checkinlist(index) ? Colors.green : Colors.grey,
                                    //                   <--- border color
                                    width: 1.0,
                                  ),
                                ),
                                height: 45,
                                width: 105,
                                child:Center(child: Text("Night"))
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color:  checkinlist(index) ? Colors.green : Colors.grey,
                                    //                   <--- border color
                                    width: 1.0,
                                  ),
                                ),
                                height: 45,
                                width: 105,
                                child:Center(child: Text("Full Day"))
                            ),
                          ),
                        ],
                      ),
                    ),


                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,left: 20,bottom:10,right: 20),
            child: Text("Quote Your Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4,left: 20,bottom: 20,right: 20),
                child: SizedBox(
                  height: 50,
                  width: 165,
                  child: TextField(
                    controller: how,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Quote ur Price',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4,left: 20,bottom:20,right: 20),
                child: SizedBox(
                  height: 50,
                  width: 165,
                  child: ElevatedButton(onPressed: (){
                    print(how.text);
                    how.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Quoted Price Sended Successfully')),

                    );



                  }, child:Text("Quote",
                  ),style: ElevatedButton.styleFrom(
                      primary: Colors.green
                  ),),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5,left: 20,right: 20),
            child: Container(
              height: 300,
              width: 300,
              child: ListView(
                children:[ Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 95),
                          child: Text("Nurse price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10,right: 95),
                          child: Text("Shift price",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 40,right: 88),
                          child: Text("Booking Charge",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 5,right: 95),
                          child: Text("Discount",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 20,right: 95),
                          child: Text("Grand Total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(":",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(":",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(":",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(":",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(":",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 40),
                          child: Text("Rs 800/-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 40),
                          child: Text("Rs 500/-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 40,),
                          child: Text("Rs 100/-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 50,right: 20),
                          child: Text("Rs 50/-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 50),
                          child: Text("Rs 1350/-",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
                        ),

                      ],
                    )

                  ],
                ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(onPressed: (){
                              _showDialog(context);
                            },
                                child: Text("Schedule"),style: ElevatedButton.styleFrom(
    primary: Colors.green
    ),)
                        )
                      ],
                    ),
                  )
      ]
              ),
            ),
          )


    ]
      ),
    );
  }
}
void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content:Container(
          height: 200,
          width: 150,
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage("assets/images/tick2.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 38,left: 20,right: 20,bottom: 10),
                child: Text("You successfully completed your nurse"
                    "bookings. Go back and check other"
                    "Schedules ",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top:10,left: 50,right:80,bottom: 10),
            child: ElevatedButton(
              child:Text("continue"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },style: ElevatedButton.styleFrom(
                primary: Colors.green
            ),
            ),
          ),
        ],
      );
    },
  );
}