import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class ApplyPromocode {
  final BagRepository repository;

  ApplyPromocode(this.repository);

  Future<Bag> call(Promocode? promocode) async {
    return await repository.applyPromocode(promocode);
  }
}
