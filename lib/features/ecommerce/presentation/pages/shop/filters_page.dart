import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/shop/shop_app_bar.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: shopAppBar(context: context, title: "Filters"),
      child: Column(children: [
        SingleChildScrollView(
          child: Column(children: [
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
              height: 84,
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
                  "Colors ",
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
              height: 84,
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
              height: 84,
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
                  "Category",
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
              height: 84,
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
                  "Brand ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
          ]),
        ),
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
          height: 84,
          alignment: Alignment.centerLeft,
          child: CupertinoSlider(
            max: 143,
            min: 78,
            onChanged: (double value) {},
            value: 100,
          ),
        ),
      ]),
    );
  }
}
