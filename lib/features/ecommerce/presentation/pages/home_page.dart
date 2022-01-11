import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/home/home_page_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/new_products_list.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/sale_products_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        List<Widget> headWigets = [];
        if (state is HomePageInitial) {
          headWigets = [
            Container(
              width: double.maxFinite,
              height: 536,
              child: Stack(fit: StackFit.expand, children: [
                const Image(
                  image: AssetImage("assets/images/main_page/big_banner.png"),
                  fit: BoxFit.fill,
                ),
                const Positioned(
                    left: 16,
                    bottom: 100,
                    child: Text(
                      "Fashion\nsale",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900),
                    )),
                Positioned(
                    left: 16,
                    bottom: 40,
                    child: RedButton(
                      onTap: () {
                        BlocProvider.of<HomePageCubit>(context).checkSales();
                      },
                      text: "Check",
                      width: 160,
                      height: 36,
                    )),
              ]),
            ),
          ];
        } else if (state is HomePageSales) {
          headWigets = [
            SizedBox(
              width: double.maxFinite,
              height: 220,
              child: Stack(fit: StackFit.expand, children: const [
                Image(
                  image: AssetImage("assets/images/main_page/small_banner.png"),
                  fit: BoxFit.fill,
                ),
                Positioned(
                    left: 16,
                    bottom: 26,
                    child: Text(
                      "Street clothes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
            ),
            const SizedBox(
              height: 17,
            ),
            SaleProductsList(
              productList: state.saleProductsList,
            ),
          ];
        }
        return CupertinoPageScaffold(
            child: SingleChildScrollView(
          child: Column(children: [
            ...headWigets,
            NewProductsList(
              productList: state.newProductsList,
            ),
            Container(
              width: double.maxFinite,
              height: 366,
              child: Stack(fit: StackFit.expand, children: const [
                Image(
                  image:
                      AssetImage("assets/images/main_page/new_collection.png"),
                  fit: BoxFit.fill,
                ),
                Positioned(
                    right: 18,
                    bottom: 27,
                    child: Text(
                      "New collection",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
            ),
            Container(
              width: double.maxFinite,
              height: 400,
              child: Stack(fit: StackFit.expand, children: [
                const Positioned(
                    top: 59,
                    left: 15,
                    child: Text(
                      "Summer\nsale",
                      style: TextStyle(
                          color: Color(0xFFDB3022),
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  left: MediaQuery.of(context).size.width / 2,
                  child: Image(
                    width: MediaQuery.of(context).size.width / 2,
                    image:
                        const AssetImage("assets/images/main_page/hoodies.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 200,
                  child: Image(
                    width: MediaQuery.of(context).size.width / 2,
                    image:
                        const AssetImage("assets/images/main_page/black.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                    left: 13,
                    bottom: 37,
                    child: Text(
                      "Black",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
            ),
          ]),
        ));
      },
    );
  }
}
