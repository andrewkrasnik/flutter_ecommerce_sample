import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_address.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/delivery_addresses/delivery_addresses_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/profile/shipping_address_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/checkbox_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/black_add_button.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/maybe_detector.dart';

import 'package:get_it/get_it.dart';

class ShippingAdressesPage extends StatelessWidget {
  const ShippingAdressesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool forChoice;
    if (ModalRoute.of(context)?.settings.arguments != null) {
      forChoice = ModalRoute.of(context)?.settings.arguments as bool;
    } else {
      forChoice = false;
    }

    return BlocProvider(
      create: (context) =>
          GetIt.instance.get<DeliveryAddressesCubit>(param1: 0, param2: 0)
            ..loadList(),
      child: ShippingAddressesPageController(
        forChoice: forChoice,
      ),
    );
  }
}

class ShippingAddressesPageController extends StatelessWidget {
  final bool forChoice;
  const ShippingAddressesPageController({
    Key? key,
    this.forChoice = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryAddressesCubit, DeliveryAddressesState>(
      buildWhen: (previous, current) => current is DeliveryAddressesListState,
      builder: (context, state) {
        (state as DeliveryAddressesListState);
        return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text(
                "Shipping Addresses",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ...List.generate(state.addresses.length, (index) {
                        DeliveryAddress address = state.addresses[index];
                        return MaybeDetector(
                          isDetector: forChoice,
                          onTap: () {
                            Navigator.of(context).pop(address);
                          },
                          child: Container(
                            height: 140,
                            width: double.maxFinite,
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            padding: const EdgeInsets.only(
                                left: 28, right: 23, top: 18),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(address.fullName),
                                    GestureDetector(
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(color: AppColors.red),
                                      ),
                                      onTap: () async {
                                        Navigator.of(context).push(
                                            CupertinoPageRoute(
                                                builder: (currentContext) =>
                                                    ShippingAddressPage(
                                                        address: address,
                                                        saveAddress: (address) {
                                                          BlocProvider.of<
                                                                      DeliveryAddressesCubit>(
                                                                  context)
                                                              .loadList();
                                                        })));
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
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    CheckboxWidget(
                                      value: address.defaultAddress,
                                      onChanged: (value) {
                                        BlocProvider.of<DeliveryAddressesCubit>(
                                                context)
                                            .setDefaultDeliveryAdress(address);
                                      },
                                      activeColor: AppColors.black,
                                      color: AppColors.white,
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    const Text("Use as the shipping address"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 28,
                      ),
                      BlackAddButton(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (currentContext) =>
                                  ShippingAddressPage(saveAddress: (address) {
                                    BlocProvider.of<DeliveryAddressesCubit>(
                                            context)
                                        .addAddress(address);
                                  })));
                        },
                      ),
                    ]),
              ),
            ));
      },
    );
  }
}
