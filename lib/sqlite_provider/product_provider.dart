import 'package:food_order2/model/product_favourite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:food_order2/sqlite_provider/provider.dart';

class ProductProvider extends Provider {
  String _tableName = 'products';

  Future insert(ProductFavourite product, { conflictAlgorithm : ConflictAlgorithm.ignore }) async {
    await db.insert(_tableName, product.toMap(), conflictAlgorithm: conflictAlgorithm);
  }


  Future<List> getAllProducts() async {
    List<Map> maps = await db.query(_tableName ,
        columns: ['id'],
    );

    if(maps.length > 0) {
      List products = [];
      maps.forEach((product) {
        if(product != null) {
          products.add(product['id']);
        }
      });
      return products;
    }
    return null;
  }


  Future<ProductFavourite> getProduct(int id) async {

    List<Map> maps = await db.query(
        _tableName,
        columns: ['id'],
        where: 'id = ?',
        whereArgs: [id]
    );

    if(maps.length > 0) {
      return ProductFavourite.fromJson(maps.first);
    }

    return null;

  }

  Future<int> deleteProduct(int id) async {
    return await db.delete(_tableName , where: 'id = ?' , whereArgs: [id]);
  }

}