import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class DeleteFromBag {
  final BagRepository repository;

  DeleteFromBag(this.repository);

  Future<Bag> call(BagItem item) async {
    return await repository.deleteFromBag(item);
  }
}
