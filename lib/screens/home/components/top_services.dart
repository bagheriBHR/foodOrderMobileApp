import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order2/constants.dart';
import 'package:food_order2/model/category.dart';

class TopServices extends StatefulWidget {

  final serviceClicked;

  const TopServices({Key key, this.serviceClicked}) : super(key: key);

  @override
  _TopServicesState createState() => _TopServicesState();
}

class _TopServicesState extends State<TopServices> {

  int _currentSelectedService = 0;

  final List<Category> _categories = [
    Category(icon:Icons.home,name:'منو اصلی'),
    Category(icon:Icons.restaurant,name:'غذا'),
    Category(icon:Icons.wine_bar,name:'نوشیدنی'),
    Category(icon:Icons.cake_rounded,name:'دسر'),
    Category(icon:Icons.more_horiz,name:'مخلفات'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        // top: 10
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (BuildContext context,int index){
            return _serviceItem(index );
          }
      )
    );
  }

  Widget _serviceItem(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _currentSelectedService = index;
          widget.serviceClicked(index);
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical:10),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: secondColor,
                shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                 blurRadius: 10,
                 offset: Offset(0,0),
                 color: _currentSelectedService == index
                          ?  Colors.black.withOpacity(0.2)
                          : Colors.transparent
                )
              ]
            ),
            child: Opacity(
              opacity: 1,
              child: Container(
                width: 45,
                height: 45,
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle
                ),
                child: Icon(_categories[index].icon,color:Colors.black)
              ),
            ),
          ),
          Text(
            _categories[index].name,
            style: TextStyle(color:Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}
