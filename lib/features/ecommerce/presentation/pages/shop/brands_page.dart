import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bordered_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class BrandsPage extends StatefulWidget {
  const BrandsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends State<BrandsPage> {
  Map<String, bool> brands = {
    "adidas": false,
    "adidas Originals": false,
    "Blend": false,
    "Boutique Moschino": false,
    "Champion": false,
    "Diesel": false,
    "Jack & Jones": false,
    "Naf Naf": false,
    "Red Valentino": false,
    "s.Oliver": false,
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
            middle: Text(
          "Brand",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        child: Column(
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: const CupertinoTextField(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          color: Color(0xFF9B9B9B))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                prefix: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Color(0xFF9B9B9B),
                  ),
                ),
                suffixMode: OverlayVisibilityMode.notEditing,
                // padding: EdgeInsets.all(20),
                placeholder: "Search",
                placeholderStyle:
                    TextStyle(fontSize: 16, color: Color(0xFF9B9B9B)),
              ),
            ),
            Expanded(
              child: ListView(
                children: brands.keys.map((brand) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          brand,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: brands[brand]!
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: brands[brand]!
                                  ? const Color.fromRGBO(219, 48, 34, 1)
                                  : Colors.black),
                        ),
                        Material(
                          child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              activeColor: const Color.fromRGBO(219, 48, 34, 1),
                              value: brands[brand],
                              onChanged: (value) {
                                setState(() {
                                  brands[brand] = value!;
                                });
                              }),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
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
          ],
        ));
  }
}
