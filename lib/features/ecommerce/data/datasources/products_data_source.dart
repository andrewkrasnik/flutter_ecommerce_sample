import 'package:flutter_ecommerce_sample/features/ecommerce/data/models/product_model.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/brand.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getCategoryByCatalogItem(CatalogItem catalogItem);
}

class ProductsDataSourceImpl implements ProductsDataSource {
  List<ProductModel> _generateProducts() {
    List<ProductModel> resultList = [];
    return resultList;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return Future.value(_generateProducts());
  }

  @override
  Future<List<ProductModel>> getCategoryByCatalogItem(CatalogItem catalogItem) {
    Brand dorothyPerkins = Brand(id: 1, name: "Dorothy Perkins");
    Brand mango = Brand(id: 2, name: "Mango");
    Brand lost = Brand(id: 3, name: "LOST Inc");
    Brand topshop = Brand(id: 4, name: "Topshop");

    List<ProductModel> resultList = [];
    if (catalogItem.name == "Tops") {
      resultList.add(ProductModel(
          id: 1,
          name: "Pullover",
          description: "Pullover",
          brand: mango,
          rating: 4,
          price: 51,
          salePrice: 0,
          sale: 0,
          reviewCount: 3,
          images: ["assets/images/products/pullover.png"],
          isFavorite: false));

      resultList.add(ProductModel(
          id: 2,
          name: "Blouse",
          description: "Blouse",
          brand: dorothyPerkins,
          rating: 0,
          price: 34,
          salePrice: 0,
          sale: 0,
          reviewCount: 0,
          images: ["assets/images/products/blouse.png"],
          isFavorite: false));

      resultList.add(ProductModel(
          id: 3,
          name: "T-shirt",
          description: "T-shirt",
          brand: lost,
          rating: 5,
          price: 12,
          salePrice: 0,
          sale: 0,
          reviewCount: 10,
          images: ["assets/images/products/t-shirt.png"],
          isFavorite: false));

      resultList.add(ProductModel(
          id: 4,
          name: "Shirt",
          description: "Shirt",
          brand: topshop,
          rating: 4,
          price: 51,
          salePrice: 0,
          sale: 0,
          reviewCount: 3,
          images: ["assets/images/products/shirt.png"],
          isFavorite: false));
    }
    return Future.value(resultList);
  }
}
