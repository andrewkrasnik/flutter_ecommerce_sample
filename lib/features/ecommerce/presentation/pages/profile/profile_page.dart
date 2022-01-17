import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/profile_item_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.mainColor,
          border: null,
          trailing: const SearchBarButton(),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 64,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 17, right: 17, bottom: 24),
                child: const Text(
                  "My profile",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, bottom: 28),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      maxRadius: 32,
                      backgroundImage:
                          AssetImage("assets/images/profile/avatar.png"),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Matilda Brown",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "matildabrown@mail.com",
                          style: TextStyle(
                              color: AppColors.grayText, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ProfileItemWidget(
                title: "My orders",
                subtitle: "Already have 12 orders",
                onTap: () {
                  Navigator.of(context).pushNamed("/orders");
                },
              ),
              ProfileItemWidget(
                title: "Shipping addresses",
                subtitle: "3 ddresses",
                onTap: () {
                  Navigator.of(context).pushNamed("/adresses");
                },
              ),
              ProfileItemWidget(
                title: "Payment methods",
                subtitle: "Visa **34",
                onTap: () {
                  Navigator.of(context).pushNamed("/payments");
                },
              ),
              ProfileItemWidget(
                title: "Promocodes",
                subtitle: "You have special promocodes",
                onTap: () {
                  Navigator.of(context).pushNamed("/promocodes");
                },
              ),
              ProfileItemWidget(
                title: "My reviews",
                subtitle: "Reviews for 4 items",
                onTap: () {
                  Navigator.of(context).pushNamed("/reviews");
                },
              ),
              ProfileItemWidget(
                title: "Settings",
                subtitle: "Notifications, password",
                withBorder: false,
                onTap: () {
                  Navigator.of(context).pushNamed("/settings");
                },
              ),
              const SizedBox(
                height: 42,
              ),
            ],
          ),
        ));
  }
}
