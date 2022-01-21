import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/core/utils/formating.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/order/order_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/product_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bordered_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/caption_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/circle_bordered_image.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/order_information_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Order order =
        (BlocProvider.of<OrderCubit>(context).state as OrderPageState).order;
    Widget buttonsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const BorderedButton(
          width: 160,
          height: 36,
          text: "Reorder",
          color: AppColors.black,
        ),
        RedButton(
          text: "Leave feedback",
          height: 36,
          width: 160,
        ),
      ],
    );
    if (order.status == OrderStatuses.processing) {
      buttonsRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BorderedButton(
            width: 160,
            height: 36,
            text: "Cancell",
            color: AppColors.black,
            onTap: () {
              BlocProvider.of<OrderCubit>(context).cancell(order);
            },
          ),
          RedButton(
            text: "Order delivered",
            height: 36,
            width: 160,
            onTap: () {
              BlocProvider.of<OrderCubit>(context).deliver(order);
            },
          ),
        ],
      );
    }
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
              padding: const EdgeInsets.only(bottom: 4),
              onPressed: () {
                BlocProvider.of<OrderCubit>(context).goBack(order.status);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
          middle: const Text(
            "Order Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order №${order.number}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat(
                        "dd-MM-yyyy",
                      ).format(order.date),
                      style: const TextStyle(color: AppColors.grayText),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CaptionFieldWidget(
                        caption: "Tracking number:  ",
                        text: order.trackingNumber.toString(),
                        fontSize: 14,
                        captionfontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Text(
                        order.status.name,
                        style: TextStyle(color: order.status.color),
                      ),
                    ]),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  order.items.length == 1
                      ? "1 item"
                      : "${order.items.length} items",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
                ...List.generate(order.items.length, (index) {
                  OrderItem item = order.items[index];
                  return Container(
                    margin: const EdgeInsets.only(
                      top: 12,
                    ),
                    height: 104,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            color: AppColors.shadow.withOpacity(0.3),
                            spreadRadius: 0.2,
                            offset: const Offset(2, -1),
                          )
                        ],
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        ProductPage(product: item.product)));
                          },
                          child: CircleBorderedImage(
                              height: 104,
                              width: 100,
                              image: item.product.images[0],
                              topLeft: const Radius.circular(10),
                              bottomLeft: const Radius.circular(10)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 14,
                              top: 11,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.product.name,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              item.product.brand.name,
                                              style: const TextStyle(
                                                  color: AppColors.grayText,
                                                  fontSize: 10),
                                            ),
                                            const SizedBox(
                                              height: 9,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 80,
                                                  child: CaptionFieldWidget(
                                                      caption: "Color:",
                                                      text: item.color.name),
                                                ),
                                                CaptionFieldWidget(
                                                    caption: "Size:",
                                                    text: item.size.name),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            CaptionFieldWidget(
                                                caption: "Units:",
                                                text: item.count
                                                    .toStringAsFixed(0)),
                                          ],
                                        ),
                                      ]),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 16,
                            right: 16,
                          ),
                          child: Text(
                            "${priceToString(item.sum)}\$",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 22,
                ),
                const Text(
                  "Order information",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                OrderInformationWidget(
                  title: "Shipping Address:",
                  text: order.deliveryAddress,
                ),
                const SizedBox(
                  height: 24,
                ),
                OrderInformationWidget(
                  title: "Payment method:",
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(
                          PaymentMethod.cardLogo(order.cardType),
                        ),
                        width: 32,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(order.cardNumber),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                OrderInformationWidget(
                  title: "Delivery method:",
                  text: order.deliveryMethod,
                ),
                const SizedBox(
                  height: 24,
                ),
                OrderInformationWidget(
                  title: "Discount:",
                  text: order.discount,
                ),
                const SizedBox(
                  height: 24,
                ),
                OrderInformationWidget(
                    title: "Total Amount:",
                    child: Text(
                      "${priceToString(order.totalAmount)}\$",
                    )),
                const SizedBox(
                  height: 34,
                ),
                buttonsRow,
                const SizedBox(
                  height: 34,
                ),
              ],
            ),
          ),
        ));
  }
}
