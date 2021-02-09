import 'package:flutter/material.dart';
import 'package:food_order2/constants.dart';
import 'package:food_order2/model/product.dart';
import 'package:food_order2/screens/category/category_screen.dart';
import 'package:food_order2/screens/category/components/category_item.dart';
import 'package:food_order2/screens/home/components/food_list.dart';
import 'package:food_order2/screens/home/components/header_search.dart';
import 'package:food_order2/screens/home/components/title.dart';
import 'package:food_order2/screens/home/components/top_services.dart';
import 'package:food_order2/store/product_provider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedCategory = null;
  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getFavorites();
  }

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var store = Provider.of<ProductProvider>(context);
    store.getFavouriteProducts();

    return Scaffold(
      body:CustomScrollView(
        controller: _trackingScrollController,
        slivers: [
          SliverAppBar(
            expandedHeight:180,
            backgroundColor: foreGroundColor,
            pinned: true,
            floating: true,
            title: HeaderSearch(),
            bottom:  PreferredSize(
              preferredSize: const Size.fromHeight(105.0),
              child: Container(
                height:105,
                child: TopServices(serviceClicked : (index) {
                  setState(() {
                    index == 0
                        ? _selectedCategory = null
                        :_selectedCategory = index;
                  });
                }),
              ),
            ),
          ),
          _selectedCategory == null
            ?SliverToBoxAdapter(
              child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 60),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/images/off.png',fit: BoxFit.cover,),
                          ),
                        ),

                        CustomTitle(title: 'پیشنهاد سرآشپز',type:'food'),
                        FoodList(),

                        CustomTitle(title: 'جدیدترین ها',type:'drink'),
                        FoodList(),

                        CustomTitle(title: 'محبوب ترین ها',type:'drink'),
                        FoodList(),
                      ],
                    ),
                  )
              ),
            )
            :SliverPadding(
            padding: const EdgeInsets.only(bottom: 60),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2/3),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    Product product = store.products[index];
                    return CategoryItem(product: product);
                  },
                  childCount: store.products.length,
                ),
              ),
            ),
        ],
      )
    );
  }
}
