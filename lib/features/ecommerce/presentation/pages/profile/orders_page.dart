import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/core/utils/formating.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/order.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/order/order_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/order_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/bordered_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/caption_field_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance.get<OrderCubit>(param1: 0, param2: 0)..loadList(null),
      child: OrdersListPage(),
    );
  }
}

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderPageState) {
          return const OrderPage();
        }
        (state as OrderListPageState);

        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
                backgroundColor: AppColors.mainColor,
                border: null,
                trailing: SearchBarButton()),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 64,
                      alignment: Alignment.bottomLeft,
                      child: const Text(
                        "My Orders",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          List.generate(OrderStatuses.values.length, (index) {
                        OrderStatus status = OrderStatuses.values[index];
                        final bool selected = status == state.status;
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<OrderCubit>(context)
                                .loadList(status);
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.only(right: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: selected ? AppColors.black : null,
                            ),
                            child: Text(
                              status.name,
                              style: TextStyle(
                                  color: selected
                                      ? AppColors.white
                                      : AppColors.black),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ...List.generate(state.list.length, (index) {
                      Order order = state.list[index];
                      return Container(
                        height: 164,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        padding: const EdgeInsets.all(19),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order №${order.number}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat(
                                    "dd-MM-yyyy",
                                  ).format(order.date),
                                  style: const TextStyle(
                                      color: AppColors.grayText),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CaptionFieldWidget(
                              caption: "Tracking number:  ",
                              text: order.trackingNumber.toString(),
                              fontSize: 16,
                              captionfontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CaptionFieldWidget(
                                  caption: "Quantyty:  ",
                                  text: order.quantyty.toStringAsFixed(0),
                                  fontSize: 16,
                                  captionfontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                CaptionFieldWidget(
                                  caption: "Total Amount:  ",
                                  text: "${priceToString(order.totalAmount)}\$",
                                  fontSize: 16,
                                  captionfontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BorderedButton(
                                  width: 98,
                                  height: 36,
                                  text: "Details",
                                  color: AppColors.black,
                                  onTap: () {
                                    BlocProvider.of<OrderCubit>(context)
                                        .toOrderPage(order);
                                  },
                                ),
                                Text(
                                  order.status.name,
                                  style: TextStyle(color: order.status.color),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ));
      },
    );
  }
}
