import 'package:aspire/Homepage.dart';
import 'package:aspire/profile.dart';
import 'package:flutter/material.dart';
class Listing extends StatefulWidget {
  const Listing({Key? key}) : super(key: key);

  @override
  State<Listing> createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  var _searchEdit =  TextEditingController();
  late List images=[
    "assets/nurse/1.jpg",
    "assets/nurse/2.jpg",
    "assets/nurse/3.jpg",
    "assets/nurse/4.jpg",
    "assets/nurse/5.jpg",
    "assets/nurse/6.jpg",
    "assets/nurse/7.jpg",
    "assets/nurse/8.jpg",
    "assets/nurse/9.jpg",
    "assets/nurse/10.jpg",
    "assets/nurse/11.jpg",
    "assets/nurse/12.jpg",
    "assets/nurse/13.jpg"
  ];

  bool _isSearch = true;
  String _searchText = "";

  late  List<String> _socialListItems=[];
  late List<String> _searchListItems;


  _ListingState(){
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
        setState(() {
          _isSearch = true;
          _searchText = "";

          print(_searchEdit.text.toString());

        });
      } else {
        setState(() {
          _isSearch = false;
          _searchText = _searchEdit.text.toString();
          print(_searchText);
        });
      }
    });
  }

  // TextEditingController dateinput = TextEditingController();
  // TextEditingController dateinput2 = TextEditingController();
  String? selectedValue;
  @override
  void initState() {
    // dateinput.text = "";
    // dateinput2.text = "";
    super.initState();


    _socialListItems = [
      "Suvidha",
      "Maria",
      "Ann",
      "Santhi",
      "Annaben",
      "Samantha",
      "Kajal",
      "Anna de Armas",
      "Scaralett",
      "Elizhabeth",
      "Cindrella",
      "Gwen",
      "Mary Jane"
    ];
    setState(() {
      _socialListItems.sort();
    });


  }
  Widget _searchBox() {
    return  Container(
      decoration: BoxDecoration(border: Border.all(width: 1.0)),
      child:  TextField(
        controller: _searchEdit,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: "Search",
          hintStyle:  TextStyle(color: Colors.grey[300]),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _listView() {
    return  Flexible(
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: _socialListItems.length,
            itemBuilder: (BuildContext context, int index) {
              return
                Card(
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("${images[index]}"),
                      ),
                      isThreeLine: true,
                      subtitle: Column(
                        children: [
                          Align(
                              alignment:Alignment.topLeft,child: Text("${_socialListItems[index]}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text("Licensed Practical Nurse")),
                        ],
                      ),
                      trailing:Padding(
                        padding: const EdgeInsets.only(top:20),
                        child: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      }


                  ),
                );
            }),
      ),
    );
  }

  Widget _searchListView() {

    _searchListItems = [];
    _searchListItems.clear();
    print("DAta:$_searchText");
    for (int i = 0; i < _socialListItems.length; i++) {
      var item = _socialListItems[i];

      if (item.toLowerCase().startsWith(_searchText.toLowerCase())) {
        _searchListItems.add(item);
      }
    }
    for (int i = 0; i < _searchListItems.length; i++) {
      var item = _searchListItems[i];

    print(item);
    }

    return _searchAddList(_searchListItems);
  }

  Widget _searchAddList(List<String> searchListItems) {
    searchListItems.sort();
    return  Flexible(
      child:  ListView.builder(
          itemCount: searchListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return     Card(
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("${images[index]}"),
                  ),
                  isThreeLine: true,
                  subtitle: Column(
                    children: [
                      Align(
                          alignment:Alignment.topLeft,child: Text("${searchListItems[index]}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Licensed Practical Nurse")),
                    ],
                  ),
                  trailing:Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  }


              ),
            );
          }),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
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
      }, icon: Icon(Icons.arrow_back_outlined,)),
    ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Container(
                height:800,
                width: 300,
                child: Column(
                  children: [

Row(
  children: [
        Expanded(child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: _searchBox(),
        )),


  ],
),
                    _isSearch ? _listView() : _searchListView(),
                  ],
                )
              )
            )
    ]
      )


    );
  }



}

