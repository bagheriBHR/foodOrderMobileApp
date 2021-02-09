import 'package:flutter/material.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/screens/category/components/category_item.dart';

import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {

  final String name;
  final bool hidden;

  const CategoryScreen({Key key, this.name = '',this.hidden = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);

    return  GridView.builder(
      scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        childAspectRatio: 2/3),
        padding: EdgeInsets.only(top: 8),
        itemCount: store.products.length,
        itemBuilder: (BuildContext context, index) {
          Product product = store.products[index];
          return CategoryItem(product: product);
        }
      );
  }
}
