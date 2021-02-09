import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:food_order2/screens/home/components/food_item.dart';

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        Container(
          height: 280,
          child: Swiper(
              itemCount: store.products.length,
              viewportFraction: 0.6,
              scale: 0.9,
              fade: 0.4,
              itemBuilder: (BuildContext context,int index){
                Product _product = store.products[index];
                return FoodItem(product: _product);
              }
          ),
        ),
      ],
    );
  }
}
