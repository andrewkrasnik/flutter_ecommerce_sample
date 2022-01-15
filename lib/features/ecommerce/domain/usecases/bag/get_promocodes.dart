import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class GetPromocodes {
  final BagRepository repository;

  GetPromocodes(this.repository);

  Future<List<Promocode>> call() async {
    return await repository.getPromocodes();
  }
}
