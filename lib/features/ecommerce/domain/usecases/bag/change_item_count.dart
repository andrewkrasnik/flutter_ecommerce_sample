import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/bag_repository.dart';

class ChangeItemCount {
  final BagRepository repository;

  ChangeItemCount(this.repository);

  Future<Bag> call({required BagItem item, required double count}) async {
    return await repository.changeItemCount(item: item, count: count);
  }
}
