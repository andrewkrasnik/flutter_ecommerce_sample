import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/profile_statistic.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/profile/profile_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/profile_item_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';

//GetIt.instance.get<GetProfileStatistic>()

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        ProfileStatistic statistic = (state as ProfilePageState).statistic;
        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              backgroundColor: AppColors.mainColor,
              border: null,
              trailing: SearchBarButton(),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 64,
                    alignment: Alignment.bottomLeft,
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, bottom: 24),
                    child: const Text(
                      "My profile",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, bottom: 28),
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
                          children: const [
                            Text(
                              "Matilda Brown",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
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
                    subtitle: statistic.ordersCountString,
                    onTap: () {
                      Navigator.of(context).pushNamed("/orders");
                    },
                  ),
                  ProfileItemWidget(
                    title: "Shipping addresses",
                    subtitle: statistic.deliveryAddressesCountString,
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed("/adresses").then((value) {
                        BlocProvider.of<ProfileCubit>(context)
                            .updateStatistic();
                      });
                    },
                  ),
                  ProfileItemWidget(
                    title: "Payment methods",
                    subtitle: statistic.paymentMethod,
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed("/payments").then((value) {
                        BlocProvider.of<ProfileCubit>(context)
                            .updateStatistic();
                      });
                    },
                  ),
                  ProfileItemWidget(
                    title: "Promocodes",
                    subtitle: statistic.havePromocodesString,
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed("/promocodes");
                    },
                  ),
                  ProfileItemWidget(
                    title: "My reviews",
                    subtitle: statistic.reviewCountString,
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed("/reviews");
                    },
                  ),
                  ProfileItemWidget(
                    title: "Settings",
                    subtitle: "Notifications, password",
                    withBorder: false,
                    onTap: () {
                      Navigator.of(
                        context,
                        rootNavigator: true,
                      ).pushNamed("/settings");
                    },
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
