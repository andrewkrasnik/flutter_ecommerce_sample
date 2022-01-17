part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {
  final List<Product> newProductsList;

  HomePageState(this.newProductsList);

  HomePageState copyWith();
}

class HomePageInitial extends HomePageState {
  HomePageInitial({required List<Product> newProductsList})
      : super(newProductsList);
  @override
  HomePageInitial copyWith({
    List<Product>? newProductsList,
  }) {
    return HomePageInitial(
      newProductsList: newProductsList ?? this.newProductsList,
    );
  }
}

class HomePageSales extends HomePageState {
  final List<Product> saleProductsList;

  HomePageSales(
      {required List<Product> newProductsList, required this.saleProductsList})
      : super(newProductsList);

  @override
  HomePageSales copyWith({
    List<Product>? newProductsList,
    List<Product>? saleProductsList,
  }) {
    return HomePageSales(
      newProductsList: newProductsList ?? this.newProductsList,
      saleProductsList: saleProductsList ?? this.saleProductsList,
    );
  }
}
