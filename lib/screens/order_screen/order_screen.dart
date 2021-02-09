import 'package:flutter/material.dart';
import 'package:food_order2/constants.dart';
import 'package:food_order2/screens/order_screen/components/order_item.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('لیست سفارشات',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),),
        elevation: 0,
        backgroundColor: foreGroundColor,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          _items(context),
          _price(context,store.getBasketTotal()),
        ],
      ),
    );
  }

  Widget _shoppingButton(BuildContext context) {
    return RaisedButton(
      onPressed: (){},
      textColor: Colors.black87,
      color: secondColor,
      child: Text('تکمیل خرید'),
    );
  }

  Container _price(BuildContext context,total) {
    return Container(
      margin: EdgeInsets.only(right: 40,bottom: 70,),
      padding: EdgeInsets.only(top: 20,left: 40,right: 10),
      decoration: BoxDecoration(
        color: foreGroundColor,
        border: Border(
          top: BorderSide(color: Colors.black12)
        ),
      ),
      child:Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('مبلغ تخفیف :',style: TextStyle(fontSize: 16),),
          //     Text('20000 تومان',style: TextStyle(fontSize: 16),)
          //   ],
          // ),
          // SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('مبلغ کل :',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              Text('${total} تومان',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.timer,color: Colors.deepOrangeAccent,size: 20,),
                  SizedBox(width: 10,),
                  Text('120 دقیقه')
                ],
              ),
              _shoppingButton(context)
            ],
          )
        ],
      ) ,
    );
  }

  Expanded _items(BuildContext context) {
    var store = Provider.of<ProductProvider>(context);
    return Expanded(
          child: ListView.builder(
            itemCount: store.baskets.length,
              itemBuilder: (BuildContext context,int index){
                return OrderItem(product:store.baskets[index]);
              }
          )
        );
  }
}
