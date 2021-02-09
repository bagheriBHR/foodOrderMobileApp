import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order2/services/product_favourite_services.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';

class RoundedIconButton extends StatefulWidget {

  final int productId;

  const RoundedIconButton({Key key,this.productId}) : super(key: key);

  @override
  _RoundedIconButtonState createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {

  var store;
  var _bgColor;
  var _iconColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<ProductProvider>(context);
    _bgColor = store.favouriteProducts.contains(widget.productId)
        ? Colors.red
        : Colors.white;
    _iconColor = store.favouriteProducts.contains(widget.productId)
        ? Colors.white
        : Colors.grey;

    Map<String,dynamic> attributeMap = new Map<String,dynamic>();
    attributeMap["id"] = widget.productId;

    return GestureDetector(
      onTap: () async{
        await ProductFavouriteService().saveProductIntoSqlite(attributeMap);
        await store.getFavouriteProducts();
        setState(() {
          _bgColor = store.favouriteProducts.contains(widget.productId)
              ? Colors.red
              :Colors.white;
          _iconColor = store.favouriteProducts.contains(widget.productId)
              ? Colors.white
              : Colors.grey;
        });
        print('from on tap${store.favouriteProducts}');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: _bgColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0,3)
              )
            ],
            shape: BoxShape.circle
        ),
        child: Icon(FontAwesomeIcons.bookmark,color:_iconColor,size: 15,),
      ),
    );
  }
}


