import 'package:food_order2/model/product_favourite.dart';
import 'package:food_order2/sqlite_provider/product_provider.dart';

class ProductFavouriteService{

  Future saveProductIntoSqlite(Map productData) async {
    var db = new ProductProvider();
    try{
      await db.open();
      dynamic result = await db.getProduct(productData['id']);
      if(result == null){
        await db.insert(ProductFavourite.fromJson(productData));
        print('inserted');
      }else{
        await db.deleteProduct(productData['id']);
        print('deleted');
      }
      await db.close();
    }catch(e){
      print (e);
    }
  }

  Future<List> getAllProductsFromSqlite() async {
    var db = new ProductProvider();
    await db.open();

    List products = await db.getAllProducts();
    await db.close();

    return products;
  }
}