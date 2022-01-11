part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {
  final List<Product> newProductsList;

  HomePageState(this.newProductsList);
}

class HomePageInitial extends HomePageState {
  HomePageInitial({required List<Product> newProductsList})
      : super(newProductsList);
}

class HomePageSales extends HomePageState {
  final List<Product> saleProductsList;

  HomePageSales(
      {required List<Product> newProductsList, required this.saleProductsList})
      : super(newProductsList);
}
