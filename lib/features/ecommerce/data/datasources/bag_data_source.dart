import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';

abstract class BagDataSource {
  Future<Bag> getBag();
  Future<void> addToBag(
      {required Product product,
      required ProductSize size,
      required ProductColor color});
  Future<Bag> deleteFromBag(BagItem item);
  Future<Bag> applyPromocode(Promocode? promocode);
  Future<Bag> changeItemCount({required BagItem item, required double count});
}

class BagDataSourceImpl implements BagDataSource {
  late Bag _bag;
  BagDataSourceImpl() {
    _bag = Bag();
  }

  @override
  Future<void> addToBag(
      {required Product product,
      required ProductSize size,
      required ProductColor color}) async {
    _bag.addItem(BagItem(product: product, size: size, color: color));

    return Future.value();
  }

  @override
  Future<Bag> applyPromocode(Promocode? promocode) {
    _bag.applyPromocode(promocode);
    return Future.value(_bag);
  }

  @override
  Future<Bag> changeItemCount({required BagItem item, required double count}) {
    item.count += count;

    return Future.value(_bag);
  }

  @override
  Future<Bag> deleteFromBag(BagItem item) {
    _bag.deleteItem(item);
    return Future.value(_bag);
  }

  @override
  Future<Bag> getBag() {
    return Future.value(_bag);
  }
}
