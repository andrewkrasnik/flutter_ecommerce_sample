import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/catalog_item.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/star_rating_widget.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> productList;
  final CatalogItem catalogItem;
  String sortBy;
  bool itemView;

  ProductListPage(
      {Key? key,
      required this.productList,
      required this.catalogItem,
      this.sortBy = "Price: lowest to high",
      this.itemView = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: shopAppBar(context: context, noBorder: true),
        child: Column(
          children: [
            Material(
              elevation: 1,
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                width: double.maxFinite,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 76,
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          catalogItem.fullName,
                          style: const TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ListView(
                      //   scrollDirection: Axis.horizontal,
                      //   children: [
                      //     Container(
                      //       color: Colors.black,
                      //       child: Text(
                      //         "T-shirt",
                      //         style: TextStyle(color: Colors.white),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Container(
                        margin: const EdgeInsets.only(top: 18, bottom: 10),
                        height: 24,
                        color: const Color(0xFFF9F9F9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: const [
                                  ImageIcon(
                                    AssetImage("assets/icons/filter.png"),
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Filters",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage("assets/icons/sort.png"),
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    sortBy,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: itemView
                                  ? const ImageIcon(
                                      AssetImage("assets/icons/tiles.png"),
                                      color: Colors.black,
                                    )
                                  : const ImageIcon(
                                      AssetImage("assets/icons/items.png"),
                                      color: Colors.black,
                                    ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Product product = productList[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 104,
                          width: double.maxFinite,
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                product.images[0],
                                fit: BoxFit.fill,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 10),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          product.brand.name,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF9B9B9B)),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            StarRatingWidget(product.rating),
                                            Text(
                                              "(${product.reviewCount.toString()})",
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xFF9B9B9B)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${product.price.toString()}\$",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      ;
                    }))
          ],
        ));
  }
}
