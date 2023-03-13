import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String imageUrl;
  final String category;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  Product(
      {required this.category,
      required this.imageUrl,
      required this.isPopular,
      required this.isRecommended,
      required this.name,
      required this.price});

  @override
  List<Object?> get props =>
      [name, imageUrl, price, isPopular, isRecommended, category];

  static List<Product> products = [
    Product(
        category: 'BurgerKing',
        imageUrl: 'assets/images/food4.jpg',
        isPopular: true,
        isRecommended: false,
        name: 'Mixed Burger',
        price: 3.99),
    Product(
        category: 'BurgerKing',
        imageUrl: 'assets/images/food5.jpg',
        isPopular: false,
        isRecommended: true,
        name: 'French fries with burguer',
        price: 2.99),
    Product(
        category: 'HotDogs',
        imageUrl: 'assets/images/food6.jpg',
        isPopular: true,
        isRecommended: false,
        name: 'Hotdog',
        price: 1.95),
    Product(
        category: 'Hamburger',
        imageUrl: 'assets/images/food7.jpg',
        isPopular: true,
        isRecommended: false,
        name: 'Coca Cola',
        price: 1.99),
    Product(
        category: 'CrazyBurger',
        imageUrl: 'assets/images/food8.jpg',
        isPopular: true,
        isRecommended: false,
        name: 'SuperBurger',
        price: 5.95),
    Product(
        category: 'CrazyBurger',
        imageUrl: 'assets/images/food8.jpg',
        isPopular: false,
        isRecommended: true,
        name: 'SuperBurger',
        price: 5.95),
  ];
}
