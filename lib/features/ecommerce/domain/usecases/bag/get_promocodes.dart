import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/promocode_repository.dart';

class GetPromocodes {
  final PromocodeRepository repository;

  GetPromocodes(this.repository);

  Future<List<Promocode>> call() async {
    return await repository.getPromocodes();
  }
}
