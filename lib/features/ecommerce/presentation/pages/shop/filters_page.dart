import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/shop/brands_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bordered_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/filter_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/filter_color_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  Map<String, bool> sizes = {
    "XS": false,
    "S": false,
    "M": false,
    "L": false,
    "XL": false
  };

  Map<String, bool> categories = {
    "All": false,
    "Women": false,
    "Men": false,
    "Boys": false,
    "Girls": false
  };

  Map<Color, bool> colors = {
    const Color(0xFF020202): false,
    const Color(0xFFF6F6F6): false,
    const Color(0xFFB82222): false,
    const Color(0xFFBEA9A9): false,
    const Color(0xFFE2BB8D): false,
    const Color(0xFF151867): false,
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text(
        "Filters",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
      child: Column(children: [
        Expanded(
          child: ListView(children: [
            Container(
                padding: const EdgeInsets.only(left: 16),
                height: 42,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Price range",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              height: 72,
              alignment: Alignment.centerLeft,
              child: CupertinoSlider(
                max: 143,
                min: 78,
                onChanged: (double value) {},
                value: 100,
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 16),
                height: 42,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Colors",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              height: 72,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: colors.keys
                    .map((color) => FilterColorButton(
                          color: color,
                          selected: colors[color]!,
                          onTap: () {
                            setState(() {
                              colors[color] = !colors[color]!;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 16),
                height: 42,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Sizes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              height: 72,
              alignment: Alignment.centerLeft,
              child: Row(
                children: sizes.keys
                    .map((size) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterButton(
                            text: size,
                            selected: sizes[size]!,
                            onTap: () {
                              setState(() {
                                sizes[size] = !sizes[size]!;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 16),
                height: 42,
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Category",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.only(left: 13),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              height: 124,
              alignment: Alignment.centerLeft,
              child: Column(children: [
                Row(
                  children: categories.keys
                      .toList()
                      .sublist(0, 3)
                      .map((category) => Padding(
                            padding: const EdgeInsets.only(
                                left: 11, right: 11.0, top: 16),
                            child: FilterButton(
                              text: category,
                              selected: categories[category]!,
                              width: 100,
                              onTap: () {
                                setState(() {
                                  categories[category] = !categories[category]!;
                                });
                              },
                            ),
                          ))
                      .toList(),
                ),
                Row(
                  children: categories.keys
                      .toList()
                      .sublist(3, 5)
                      .map((category) => Padding(
                            padding: const EdgeInsets.only(
                                left: 11, right: 11.0, top: 12),
                            child: FilterButton(
                              text: category,
                              selected: categories[category]!,
                              width: 100,
                              onTap: () {
                                setState(() {
                                  categories[category] = !categories[category]!;
                                });
                              },
                            ),
                          ))
                      .toList(),
                ),
              ]),
            ),
            Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                height: 84,
                alignment: Alignment.centerLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Brand",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text("adidas Originals, Jack & Jones, s.Oliver",
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.grayText,
                              ))
                        ],
                      ),
                      CupertinoButton(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            //Navigator.of(context).pushNamed("/shop/brands");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BrandsPage()));
                          })
                    ])),
          ]),
        ),
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: const Offset(0, -1),
              )
            ],
          ),
          height: 84,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BorderedButton(
                text: "Disarg",
                height: 36,
                width: MediaQuery.of(context).size.width / 2.4,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              RedButton(
                text: "Apply",
                height: 36,
                width: MediaQuery.of(context).size.width / 2.4,
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ]),
    );
  }
}
