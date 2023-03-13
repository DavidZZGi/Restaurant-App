import 'package:flutter/material.dart';
import 'package:Ecommerce/model/models.dart';
import '../../widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  final Category category;
  const CatalogScreen({required this.category, Key? key}) : super(key: key);
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return CatalogScreen(category: category);
        });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products
        .where((element) => element.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const BottomNavBar(),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.15),
          itemCount: products.length,
          itemBuilder: (contex, index) {
            return Center(
              child: ProductCard(product: products[index]),
            );
          }),
    );
  }
}
