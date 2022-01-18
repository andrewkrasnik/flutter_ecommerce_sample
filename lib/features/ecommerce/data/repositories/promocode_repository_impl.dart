import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/promocode_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/promocode.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/promocode_repository.dart';

class PromocodeRepositoryImpl implements PromocodeRepository {
  final PromocodeDataSource dataSource;
  PromocodeRepositoryImpl(
    this.dataSource,
  );
  @override
  Future<List<Promocode>> getPromocodes() async {
    return dataSource.getPromocodes();
  }

  @override
  Future<Promocode?> searchPromocode(String code) async {
    return dataSource.searchPromocode(code);
  }
}
