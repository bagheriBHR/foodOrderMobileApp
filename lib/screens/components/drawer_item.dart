import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.ontap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          ListTile(
            leading: Icon(icon,size: 22,color: Colors.black54,),
            title: Text(title,style: TextStyle(fontSize: 16,fontFamily: 'Vazir',color: Colors.black54),),
          ),
          Divider(
            thickness: 2,
            color: Colors.black.withOpacity(0.2),
          )
        ],
      ),
    );
  }
}