import 'package:flutter_ecommerce_sample/features/ecommerce/data/datasources/delivery_methods_data_source.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/delivery_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/repositories/delivery_methods_repository.dart';

class DeliveryMethodsRepositoryImpl implements DeliveryMethodsRepository {
  final DeliveryMethodsDataSource dataSource;

  DeliveryMethodsRepositoryImpl(this.dataSource);

  @override
  Future<List<DeliveryMethod>> getDeliveryMethods() async {
    return await dataSource.getDeliveryMethods();
  }
}
