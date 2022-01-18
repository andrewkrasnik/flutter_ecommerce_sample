import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/promocode_repository.dart';

class SearchPromocode {
  final PromocodeRepository repository;
  final BagRepository bagRepository;

  SearchPromocode(this.repository, this.bagRepository);

  Future<Bag> call(String code) async {
    Promocode? promocode = await repository.searchPromocode(code);
    return await bagRepository.applyPromocode(promocode);
  }
}
