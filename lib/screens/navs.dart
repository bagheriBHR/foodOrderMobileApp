import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_order2/screens/components/drawer.dart';
import 'package:food_order2/screens/favorite_product/favourit_product_screen.dart';
import 'package:food_order2/screens/home/home_screen.dart';
import 'package:food_order2/screens/order_screen/order_screen.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';


class Navs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => NavsState();
}

class NavsState extends State<Navs> with SingleTickerProviderStateMixin{

  TabController _tabController;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();


  final List<IconData> _icons = const [
    Icons.home_outlined,
    Icons.shopping_basket_outlined,
    Icons.person_outline_rounded,
    Icons.bookmark_border_outlined,
    Icons.menu_outlined
  ];

  final _pages = [
    HomePage(),
    OrderScreen(),
    Container(),
    favouritProductScreen(),
    Container(),
  ];

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if(_tabController.index==4){
        _tabController.index =_tabController.previousIndex;
        _drawerKey.currentState.openDrawer();
      }
    });
 }

  @override
  Widget build(BuildContext context)
  {

    var store = Provider.of<ProductProvider>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _drawerKey,
        drawer: CustomDrawer(),
        body: Stack(
          children: [
            TabBarView(
              controller: _tabController,
              children: _pages,
            ),
            Positioned(
              bottom:0,
              right:0,
              left:0,
              child: buildDefaultTabController(store.getBasketQty())
            )
          ],
        ),
      ),
    );
  }

  DefaultTabController buildDefaultTabController(basketQty) {
    return DefaultTabController(
      length: _icons.length,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0,0)
              )
            ]
        ),
        child: TabBar(
            controller: _tabController,
            labelColor: Colors.black54,
            unselectedLabelColor: Colors.black26,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
            ),
            tabs: _icons.asMap().entries.map((MapEntry e) => Tab(
              icon:e.key == 1
                ? Stack(
                    children: [
                      Icon(e.value,),
                      basketQty !=0
                          ?CircleAvatar(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            radius: 7,
                            child: Text(basketQty.toString(),style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                          )
                          : SizedBox.shrink()
                    ],
                  )
                :Icon(e.value),
            )).toList(),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Align(child: Text('خروج از برنامه'),alignment: Alignment.centerRight,),
            content:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('آیا از خروج خود مطمئن هستید؟'),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('خیر',style: TextStyle(color: Colors.red,fontSize: 18),),
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text('بله',style: TextStyle(color: Colors.green,fontSize: 18)),
              )
            ],
          );
        }
    );
  }
}

