import 'package:aspire/listing.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database.dart';

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final List<String> items = [
    'Home Nurse',

  ];
  var abc = TextEditingController();
  var def = TextEditingController();
  var hij = TextEditingController();
  var klm = TextEditingController();
  var nop = TextEditingController();
  final DBStudentManager dbStudentManager = DBStudentManager();
  String? selectedValue;
  final _formkey = GlobalKey<FormState>();
  Nurse? nurse;
  late int updateindex;

  late List<Nurse> studlist;
  TextEditingController _name=TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateoutput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _formkey,
        child: ListView(
            children: [
          Padding(
            padding: const EdgeInsets.only(top:40),
            child: SizedBox(
              width: 350,
              height: 180,
              child: Image.asset("assets/images/img.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Make a Booking",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: SizedBox(
              width: 350,
              height: 60,
              child: DropdownButton2(
                hint: Text(
                  'Select Services',
                  style: TextStyle(
                    fontSize: 14,
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 185,
                  child: TextField(
                    controller: dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(), //icon of text field
                        labelText: "Start Date" //label text of field
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);

                        setState(() {
                          dateinput.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 185,
                  child: TextField(
                    controller: dateoutput, //editing controller of this TextField
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(), //icon of text field
                        labelText: "End Date" //label text of field
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);

                        setState(() {
                          dateoutput.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: abc,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  enabledBorder: OutlineInputBorder(),
                  labelText: "Contact Number"),
              validator: (value) {
                if (value!.length == 0) {
                  return 'Enter a valid number';
                }else if(value.length<10){
                  return 'Enter a valid number';
                }else
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _name,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(), labelText: "Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid Name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: hij,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  labelText: "House/Flat/Building Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter House/Flat/Building Name';
                }
                return null;
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 185,
                  child: TextFormField(
                    controller: klm,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                        labelText: "House Number"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter House Number';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 185,
                  child: TextFormField(
                    controller: nop,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(), labelText: "Pin Code"),
                    validator: (value){
                      return value!.length < 6 ? 'Enter a valid Pin Code' : null;
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 185,
                  child: ElevatedButton(
                    onPressed: () {
                      abc.clear();
                      def.clear();
                      hij.clear();
                      klm.clear();
                      nop.clear();
                      dateinput.clear();
                      dateoutput.clear();
                      _name.clear();
                    },
                    child: Text(
                      "Reset",
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 185,
                  child: ElevatedButton(
                    onPressed: () {
    if (_formkey.currentState!.validate()) {
      submitStudent(context);
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Processing Data')),

    );}

                    },
                    child: Text(
                      "Check Availability",
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ),
              ),
            ],
          ),


        ]),
      ),
    );
  }
void submitStudent(BuildContext context) {
  if (_formkey.currentState!.validate()) {
    if (nurse == null) {
      Nurse st =  Nurse(
          name: _name.text, start: dateinput.text,end: dateoutput.text);
      dbStudentManager.insertNurse(st).then((value) => {
        _name.clear(),
        dateinput.clear(),
        dateoutput.clear(),
        print("nurse Data Add to database $value"),
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Listing()),
      )
      });
    }
    else {
      nurse?.name = _name.text;
      nurse?.start = dateinput.text;
      nurse?.end=dateoutput.text;

      dbStudentManager.updateNurse(nurse!).then((value) {
        setState(() {
          studlist[updateindex].name = _name.text;
          studlist[updateindex].start = dateinput.text;
          studlist[updateindex].end=dateoutput.text;
        });
        _name.clear();
        dateinput.clear();
        dateoutput.clear();
        nurse=null;
      });
    }
  }
}
}
