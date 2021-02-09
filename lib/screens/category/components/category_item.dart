import 'package:flutter/material.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/screens/home/components/custom_dialog.dart';
import 'package:food_order2/screens/home/components/rounded_icon_button.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class CategoryItem extends StatelessWidget {

  final Product product;
  final bool hidden;

  const CategoryItem({Key key,@required this.product,this.hidden = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                color: Colors.black12,
                offset: Offset(0,0)
            )
          ]
      ),
      child: Column(
        children: [
          _image(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hidden == false
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar.builder(
                      initialRating:product.score.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 13,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    RoundedIconButton(
                      productId:product.id,
                    )
                  ],
                )
                    :SizedBox.shrink(),
                SizedBox(height: 5,),
                Container(
                  alignment: Alignment.topRight,
                    child: Text(product.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text('${product.price} تومان',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Text('00:30',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(width: 5,),
                          Icon(Icons.timer,color: Colors.grey,size: 18,),
                        ],
                      ),
                  ]
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: (){
                        store.setActiveProduct(product);
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return CustomDialog(product:product,qty:store.activeProduct.qty);
                          },
                        );
                      },
                      child: Text('سفارش')
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _image() {
    return SizedBox(
        height:120,
        width: double.infinity,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(product.imageUrl,fit: BoxFit.cover,)
        )
    );
  }
}
