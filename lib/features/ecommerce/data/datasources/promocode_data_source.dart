import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';

abstract class PromocodeDataSource {
  Future<List<Promocode>> getPromocodes();
  Future<Promocode?> searchPromocode(String code);
}

class PromocodeDataSourceImpl implements PromocodeDataSource {
  late List<Promocode> _promocodeList;
  PromocodeDataSourceImpl() {
    _promocodeList = [
      Promocode(
        code: "mypromocode2020",
        title: "Personal offer",
        sale: 10,
        remaining: 6,
        color: AppColors.red,
      ),
      Promocode(
          code: "summer2020",
          title: "Summer Sale",
          sale: 15,
          remaining: 23,
          image: "assets/images/bag/promocode_2.png"),
      Promocode(
        code: "mypromocode2021",
        title: "Personal offer",
        sale: 22,
        remaining: 6,
        color: AppColors.black,
      ),
    ];
  }
  @override
  Future<List<Promocode>> getPromocodes() async {
    return Future.value(_promocodeList);
  }

  @override
  Future<Promocode?> searchPromocode(String code) async {
    try {
      return Future.value(
          _promocodeList.firstWhere((element) => element.code == code));
    } catch (e) {
      return Future.value(null);
    }
  }
}
