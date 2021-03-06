import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/search_bar_button.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    "My Reviews",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
