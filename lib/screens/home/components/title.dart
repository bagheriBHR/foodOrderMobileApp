import 'package:flutter/material.dart';
import 'package:food_order2/screens/category/category_screen.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key key,
    @required this.title,
    @required this.type,
  }) : super(key: key);

  final title;
  final type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20,bottom: 10,left:10,right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.black87),),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(name : title)));
            },
            child: Text('مشاهده همه',style: TextStyle(color: Colors.indigo,fontSize: 14),),
          )
        ],
      ),
    );
  }
}