import 'package:flutter/material.dart';
import 'package:food_order2/constants.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/screens/category/components/category_item.dart';

import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';

class favouritProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);

    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: foreGroundColor,
          title: Row(
            children: [
              Text('لیست علاقه مندی ها'),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 60),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3/4.2),
              padding: EdgeInsets.only(top: 8),
              itemCount: store.favouriteProducts.length,
              itemBuilder: (BuildContext context, index) {
                var item = store.favouriteProducts[index];
                Product product = store.getProudct(item);
                return CategoryItem(product: product,hidden:true);
              }
          ),
        ),
      ),
    );
  }
}
