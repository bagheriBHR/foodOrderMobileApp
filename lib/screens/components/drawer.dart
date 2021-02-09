import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order2/constants.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        child: Container(
          color:secondColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 160,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                            width: 100,
                            child: Image.asset('assets/images/logo.jpg',fit: BoxFit.cover,)
                        ),
                        SizedBox(height:10,),
                        Text(
                          'نام رستوران',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DrawerItem(icon: Icons.restaurant,title:'غذاها',ontap: (){},),
              DrawerItem(icon: Icons.wine_bar,title:'نوشیدنی ها',ontap: (){},),
              DrawerItem(icon: Icons.cake_rounded,title:'دسرها',ontap: (){},),
              DrawerItem(icon: Icons.info,title:'درباره ما',ontap: (){},),
              DrawerItem(icon: Icons.login,title:'ورود',ontap: (){},),
            ],
          ),
        ),
      ),
    );
  }
}
