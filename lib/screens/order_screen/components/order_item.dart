import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order2/constants.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {

  final Product product;

  const OrderItem({Key key,@required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _size = MediaQuery.of(context).size;
    var store = Provider.of<ProductProvider>(context);

    return Container(
      margin: EdgeInsets.only(bottom:30,left: 30,right: 30),
      width: double.infinity,
      height: 100,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          _bgCard(_size),
          _bgGradient(_size),
          _image(),
          Container(
              padding: EdgeInsets.only(left: 20,right: 50),
              width: _size.width*0.7,
              height: double.infinity,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(product.name,maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  SizedBox(height:5),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _button(FontAwesomeIcons.minus,(){
                            store.removeOneFromBasket(product);
                          },),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10),
                            child: Text(store.getProductQty(product).toString(),style: TextStyle(),),
                          ),
                          _button(FontAwesomeIcons.plus,(){
                            store.addOneToBasket(product);
                          },)
                        ],
                      ),
                      SizedBox(width: 10,),
                      Text('X',style: TextStyle(fontSize: 14),),
                      SizedBox(width:5),
                      Text('${product.price} تومان',style: TextStyle(fontSize: 14),),
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );
  }

  GestureDetector _button(icon,onTap) {
    return GestureDetector(
      onTap:(){ onTap();},
      child: CircleAvatar(
        child: Icon(icon,size: 12,),
        backgroundColor: Colors.black12.withOpacity(0.07),
        foregroundColor: Colors.black54,
        radius: 10,
      ),
    );
  }

  Positioned _image() {
    return Positioned(
        top: 15,
        bottom: 15,
        right: 5,
        child: Container(
          width:90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage(
                      product.imageUrl
                  ),
                  fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,0),
                    blurRadius: 6,
                    color: Colors.black12
                )
              ]
          ),
        )
    );
  }

  Container _bgGradient(Size _size) {
    return Container(
      width: _size.width*0.8,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.topRight,
            colors: [foreGroundColor.withOpacity(0),foreGroundColor.withOpacity(1)],
          )
      ),
    );
  }

  Container _bgCard(Size _size) {
    return Container(
      width: _size.width*0.8,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 14,
                offset: Offset(0,5),
                color: Colors.black.withOpacity(0.04)
            ),
          ],
          borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
