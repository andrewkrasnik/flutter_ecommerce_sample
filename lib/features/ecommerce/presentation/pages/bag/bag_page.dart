import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/bag_list_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/checkout_page.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/pages/bag/success_page_with_girl.dart';

class BagPage extends StatelessWidget {
  const BagPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagBloc, BagState>(
      builder: (context, state) {
        if (state is BagInitial) {
          BlocProvider.of<BagBloc>(context, listen: false)
              .add(BagInitListEvent());
        } else if (state is BagPageState) {
          return const BagListPage();
        } else if (state is BagCheckoutState) {
          return const CheckoutPage();
        } else if (state is BagSuccessState) {
          return const SuccessPageWithGirl();
        }
        return Container();
      },
    );
  }
}
