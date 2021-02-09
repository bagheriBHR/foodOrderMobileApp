import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HeaderSearch extends StatefulWidget {
  @override
  _HeaderSearchState createState() => _HeaderSearchState();
}

class _HeaderSearchState extends State<HeaderSearch> {

  String _cutrrentView = 'mainBar';
  Map<String,Widget> _topBar;

  String _searchText = "";
  TextEditingController _searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });

    Widget mainBar = Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height:60,
                    child: Image.asset('assets/images/logo1.png',fit: BoxFit.fitHeight,)
                ),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('نام رستوران',
                      style: TextStyle(color: Colors.black87,fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                    Text('آدرس : خیابان مطهری جنب بانک ملی',
                      style: TextStyle(color: Colors.black54,fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),

            GestureDetector(
              onTap: (){
                setState(() {
                  _cutrrentView = 'searchBar';
                });
              },
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: Icon(Icons.search,color:Colors.grey)
              ),
            ),
          ],
        )
    );
    Widget searchBar = Container(
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.arrow_back,color:Colors.grey,size: 16,),
            onTap: (){
              setState(() {
                _cutrrentView = 'mainBar';
              });
            },
          ),
          SizedBox(width:10),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                  suffixIcon: GestureDetector(
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: Icon(Icons.search,color:Colors.grey)
                    ),
                  ),
                  hintText: 'غذا،دسر،کیک،نوشیدنی...'
              ),
            ),
          ),
        ],
      ),
    );

    _topBar = {
      "mainBar" : mainBar,
      "searchBar" : searchBar,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:10),
        child: _topBar[_cutrrentView]);
  }
}
