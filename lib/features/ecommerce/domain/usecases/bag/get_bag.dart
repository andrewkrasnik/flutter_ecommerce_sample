import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class GetBag {
  final BagRepository repository;

  GetBag(this.repository);

  Future<Bag> call() async {
    return await repository.getBag();
  }
}
