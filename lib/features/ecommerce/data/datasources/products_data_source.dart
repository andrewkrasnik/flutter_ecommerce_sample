import 'package:flutter_ecommerce_sample/features/ecommerce/data/models/product_model.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/brand.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getCategoryByCatalogItem(CatalogItem catalogItem);
  Future<List<ProductModel>> getSaleProducts();
  Future<List<ProductModel>> getNewProducts();
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
          isFavorite: true));

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

      resultList.add(ProductModel(
          id: 5,
          name: "T-Shirt SPANISH",
          description: "T-Shirt SPANISH",
          brand: mango,
          rating: 4,
          price: 9,
          salePrice: 0,
          sale: 0,
          reviewCount: 3,
          images: ["assets/images/products/t-shitt_spanish.png"],
          isFavorite: false));

      resultList.add(ProductModel(
          id: 6,
          name: "Blouse",
          description: "Blouse",
          brand: dorothyPerkins,
          rating: 5,
          price: 21,
          salePrice: 14,
          sale: 20,
          reviewCount: 10,
          images: ["assets/images/products/blouse_sale.png"],
          isFavorite: false));

      resultList.add(ProductModel(
          id: 7,
          name: "Shirt",
          description: "Shirt",
          brand: mango,
          rating: 0,
          price: 19,
          salePrice: 0,
          sale: 0,
          reviewCount: 0,
          images: ["assets/images/products/t-shitt_spanish.png"],
          isFavorite: false));

      resultList.add(ProductModel(
          id: 8,
          name: "Light blouse",
          description: "Light blouse",
          brand: dorothyPerkins,
          rating: 5,
          price: 25,
          salePrice: 20,
          sale: 20,
          reviewCount: 10,
          images: ["assets/images/products/blouse_sale.png"],
          isFavorite: false));
    }
    return Future.value(resultList);
  }

  @override
  Future<List<ProductModel>> getNewProducts() {
    Brand ovs = Brand(id: 5, name: "OVS");
    Brand mangoBoy = Brand(id: 6, name: "Mango Boy");
    Brand cool = Brand(id: 7, name: "Cool");

    List<ProductModel> resultList = [];
    resultList.add(ProductModel(
        id: 9,
        name: "Blouse",
        description: "Blouse",
        brand: ovs,
        rating: 0,
        price: 30,
        salePrice: 0,
        sale: 0,
        reviewCount: 0,
        images: ["assets/images/products/new_blouse.png"],
        isFavorite: false));

    resultList.add(ProductModel(
        id: 10,
        name: "T-Shirt Sailling",
        description: "T-Shirt Sailling",
        brand: mangoBoy,
        rating: 0,
        price: 10,
        salePrice: 0,
        sale: 0,
        reviewCount: 0,
        images: ["assets/images/products/new_shirt.png"],
        isFavorite: false));

    resultList.add(ProductModel(
        id: 11,
        name: "Jeans",
        description: "T-shirt",
        brand: cool,
        rating: 0,
        price: 45,
        salePrice: 0,
        sale: 0,
        reviewCount: 0,
        images: ["assets/images/products/new_shirt.png"],
        isFavorite: true));

    return Future.value(resultList);
  }

  @override
  Future<List<ProductModel>> getSaleProducts() {
    Brand dorothyPerkins = Brand(id: 1, name: "Dorothy Perkins");
    Brand sitlly = Brand(id: 8, name: "Sitlly");
    Brand lost = Brand(id: 3, name: "LOST Inc");
    Brand topshop = Brand(id: 4, name: "Topshop");

    List<ProductModel> resultList = [];

    resultList.add(ProductModel(
        id: 12,
        name: "Evening dress",
        description: "Evening dress",
        brand: dorothyPerkins,
        rating: 5,
        price: 15,
        salePrice: 12,
        sale: 20,
        reviewCount: 10,
        images: ["assets/images/products/evening_dress.png"],
        isFavorite: false));

    resultList.add(ProductModel(
        id: 13,
        name: "Sport dress",
        description: "Sport dress",
        brand: sitlly,
        rating: 5,
        price: 22,
        salePrice: 19,
        sale: 15,
        reviewCount: 10,
        images: ["assets/images/products/sport_dress.png"],
        isFavorite: false));

    resultList.add(ProductModel(
        id: 14,
        name: "Sport dress",
        description: "Sport dress",
        brand: dorothyPerkins,
        rating: 5,
        price: 14,
        salePrice: 12,
        sale: 20,
        reviewCount: 10,
        images: ["assets/images/products/sport_dress_2.png"],
        isFavorite: false));

    return Future.value(resultList);
  }
}
