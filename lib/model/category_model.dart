import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.imageUrl, required this.name});

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> listCategories = [
    const Category(name: 'BurgerKing', imageUrl: 'assets/images/food1.jpg'),
    const Category(name: 'CrazyBurger', imageUrl: 'assets/images/food2.jpg'),
    const Category(name: 'HotDogs', imageUrl: 'assets/images/food3.jpg'),
  ];
}
