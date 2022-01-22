import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/payment_methods/payment_methods_cubit.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/checkbox_widget.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/profile/maybe_detector.dart';
import 'package:get_it/get_it.dart';

class PaymentsMethodsPage extends StatelessWidget {
  const PaymentsMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance.get<PaymentMethodsCubit>(param1: 0, param2: 0)
            ..loadList(),
      child: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
        builder: (context, state) {
          List<PaymentMethod> methods =
              (state as PaymentMethodsListState).methods;
          final double imageWidth = MediaQuery.of(context).size.width;
          final bool forChoice;
          if (ModalRoute.of(context)?.settings.arguments != null) {
            forChoice = ModalRoute.of(context)?.settings.arguments as bool;
          } else {
            forChoice = false;
          }
          return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text(
                  "Payments methods",
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
                        height: 25,
                      ),
                      const Text(
                        "You payment cards",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      ...List.generate(methods.length, (index) {
                        PaymentMethod method = methods[index];
                        final bool isVisa = method.cardType == CardType.visa;
                        return Center(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 29,
                              ),
                              MaybeDetector(
                                onTap: () {
                                  Navigator.of(context).pop(method);
                                },
                                isDetector: forChoice,
                                child: Stack(children: [
                                  Image(
                                      width: imageWidth,
                                      fit: BoxFit.cover,
                                      image: AssetImage(method.cardImage)),
                                  Positioned(
                                    left: imageWidth / 10 * 6,
                                    top: isVisa
                                        ? imageWidth / 4.6
                                        : imageWidth / 4.3,
                                    child: Text(
                                      method.endCardNumber,
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 24),
                                    ),
                                  ),
                                  Positioned(
                                    left: imageWidth / 16,
                                    top: isVisa
                                        ? imageWidth / 2.15
                                        : imageWidth / 2.13,
                                    child: Text(
                                      method.nameOnCard,
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 14),
                                    ),
                                  ),
                                  Positioned(
                                    left: isVisa
                                        ? imageWidth / 10 * 7.1
                                        : imageWidth / 10 * 4.8,
                                    top: isVisa
                                        ? imageWidth / 2.15
                                        : imageWidth / 2.13,
                                    child: Text(
                                      method.expireDate,
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 14),
                                    ),
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(children: [
                                CheckboxWidget(
                                  value: method.defaultMethod,
                                  onChanged: (value) {
                                    BlocProvider.of<PaymentMethodsCubit>(
                                            context)
                                        .setDefaultMethod(method);
                                  },
                                  activeColor: AppColors.black,
                                  color: AppColors.white,
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                const Text("Use as default payment method"),
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
