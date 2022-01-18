import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/presentation/widgets/red_button.dart';

class PromocodeTileWidget extends StatelessWidget {
  final Promocode promocode;
  final VoidCallback? onTap;
  const PromocodeTileWidget({Key? key, required this.promocode, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color saleTextColor =
        promocode.image == null ? AppColors.white : AppColors.black;
    List<Widget> buttonList = onTap == null
        ? []
        : [
            SizedBox(
              height: 10,
            ),
            RedButton(
              text: "Apply",
              width: 93,
              height: 36,
              onTap: onTap,
            ),
          ];

    return Container(
      height: 80,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.white),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
                color: promocode.color,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: promocode.image == null
                    ? null
                    : DecorationImage(image: AssetImage(promocode.image!))),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promocode.sale.toStringAsFixed(0),
                    style: TextStyle(
                        fontSize: 34,
                        color: saleTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "%\noff",
                    style: TextStyle(
                        color: saleTextColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promocode.title,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  promocode.code,
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  promocode.remaining == 1
                      ? "One day remaining"
                      : "${promocode.remaining} days remaining",
                  style: TextStyle(color: AppColors.grayText, fontSize: 11)),
              ...buttonList
            ],
          ),
          const SizedBox(
            width: 14,
          ),
        ],
      ),
    );
  }
}
