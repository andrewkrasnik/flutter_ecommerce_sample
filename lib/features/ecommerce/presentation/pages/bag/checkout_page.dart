import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/success_page_with_girl.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bag/sum_row_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagBloc, BagState>(
      buildWhen: (previous, current) => current is BagCheckoutState,
      builder: (context, state) {
        (state as BagCheckoutState);
        DeliveryAddress address = state.bag.deliveryAddress!;
        return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                  padding: const EdgeInsets.only(bottom: 4),
                  onPressed: () {
                    BlocProvider.of<BagBloc>(context)
                        .add(BagBackFromChechOut());
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              middle: const Text(
                "Checkout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 32,
                  // ),
                  Flexible(child: Container()),
                  const Text(
                    "Shipping address",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Container(
                    height: 108,
                    padding:
                        const EdgeInsets.only(left: 28, right: 23, top: 18),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(address.fullName),
                            GestureDetector(
                              child: const Text(
                                "Change",
                                style: TextStyle(color: AppColors.red),
                              ),
                              onTap: () async {
                                var newAdress = await Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pushNamed(
                                  "/adresses",
                                  arguments: true,
                                );
                                if (newAdress is DeliveryAddress) {
                                  BlocProvider.of<BagBloc>(context).add(
                                      BagShippingAdressChangeEvent(
                                          address: newAdress));
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          address.address,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${address.city}, ${address.region} ${address.zipCode},"
                          " ${address.country}",
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Flexible(flex: 2, child: Container()),
                  // const SizedBox(
                  //   height: 56,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Payment",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                    width: 64,
                                    height: 38,
                                    image: AssetImage(PaymentMethod.cardLogo(
                                        state.bag.paymentMethod!.cardType))),
                                const SizedBox(
                                  width: 17,
                                ),
                                Text(state
                                    .bag.paymentMethod!.cardNumberPresentation),
                              ],
                            )
                          ],
                        ),
                        GestureDetector(
                          child: const Text(
                            "Change",
                            style: TextStyle(color: AppColors.red),
                          ),
                          onTap: () async {
                            var newMethod =
                                await Navigator.of(context, rootNavigator: true)
                                    .pushNamed("/payments", arguments: true);
                            if (newMethod is PaymentMethod) {
                              BlocProvider.of<BagBloc>(context).add(
                                  BagPaymentMethodChangeEvent(
                                      method: newMethod));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 56,
                  // ),
                  Flexible(flex: 2, child: Container()),
                  const Text(
                    "Delivery method",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Center(
                    child: SizedBox(
                        width: double.maxFinite,
                        height: 72,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(state.deliveryMethods.length,
                              (index) {
                            DeliveryMethod deliveryMethod =
                                state.deliveryMethods[index];
                            return Container(
                              width: 100,
                              height: 72,
                              margin: index == 0
                                  ? null
                                  : const EdgeInsets.only(left: 22),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage(deliveryMethod.logo)),
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  Text(
                                    deliveryMethod.deliveryPeriod,
                                    style: const TextStyle(
                                        fontSize: 11,
                                        color: AppColors.grayText),
                                  )
                                ],
                              ),
                            );
                          }),
                        )),
                  ),
                  // const SizedBox(
                  //   height: 52,
                  // ),
                  Flexible(flex: 2, child: Container()),
                  SumRowWidget(
                    title: "Order:",
                    sum: state.bag.itemsSum,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SumRowWidget(
                    title: "Delivery:",
                    sum: state.bag.deliverySum,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SumRowWidget(
                    title: "Summary:",
                    sum: state.bag.totalSum,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  RedButton(
                    text: "SUBMIT ORDER",
                    onTap: () {
                      BlocProvider.of<BagBloc>(context)
                          .add(BagSubmitOrderTapEvent());
                      Navigator.of(context, rootNavigator: true)
                        ..pop()
                        ..push(CupertinoPageRoute(
                            builder: (context) => const SuccessPageWithGirl()));
                    },
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
