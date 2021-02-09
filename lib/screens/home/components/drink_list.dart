import 'package:flutter/material.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_order2/screens/home/components/drink_item.dart';

class DrinkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);

    return Container(
      height: 280,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: store.drinks.length,
          itemBuilder: (BuildContext context,int index){
            Product _product = store.drinks[index];
            return DrinkItem(product: _product);
          }
      ),
    );
  }
}
