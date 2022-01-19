import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/bloc/bag/bag_bloc.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class SuccessPageWithGirl extends StatelessWidget {
  const SuccessPageWithGirl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagBloc, BagState>(
      builder: (context, state) {
        return CupertinoPageScaffold(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bag/success.png"),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 77,
                ),
                const Text(
                  "Success!",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Your order will be delivered soon.\nThank you for choosing our app!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RedButton(
                  text: "Continue shopping",
                  width: 160,
                  height: 36,
                  onTap: () {
                    BlocProvider.of<BagBloc>(context).add(BagInitListEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
