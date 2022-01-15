import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/bag_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_sizes.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/emums/product_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class BagRepositoryImpl implements BagRepository {
  final BagDataSource dataSource;

  BagRepositoryImpl(this.dataSource);

  @override
  Future<void> addToBag(
      {required Product product,
      required ProductSize size,
      required ProductColor color}) {
    return dataSource.addToBag(product: product, size: size, color: color);
  }

  @override
  Future<Bag> applyPromocode(Promocode promocode) {
    return dataSource.applyPromocode(promocode);
  }

  @override
  Future<Bag> changeItemCount({required BagItem item, required double count}) {
    return dataSource.changeItemCount(item: item, count: count);
  }

  @override
  Future<Bag> deleteFromBag(BagItem item) {
    return dataSource.deleteFromBag(item);
  }

  @override
  Future<Bag> getBag() {
    return dataSource.getBag();
  }

  @override
  Future<List<DeliveryMethod>> getDeliveryMethods() {
    return dataSource.getDeliveryMethods();
  }

  @override
  Future<List<Promocode>> getPromocodes() {
    return dataSource.getPromocodes();
  }
}
