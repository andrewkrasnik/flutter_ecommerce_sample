import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';

abstract class PromocodeRepository {
  Future<List<Promocode>> getPromocodes();
  Future<Promocode?> searchPromocode(String code);
}
