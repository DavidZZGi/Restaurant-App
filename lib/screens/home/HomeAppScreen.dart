// ignore: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/model/models.dart';

import '../../widgets/widgets.dart';

class HomeAppScreen extends StatelessWidget {
  static const String routeName = '/';
  const HomeAppScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return const HomeAppScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'BettyBoom',
      ),
      bottomNavigationBar: const BottomNavBar(),
      // ignore: avoid_unnecessary_containers
      body: Column(
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: Category.listCategories
                  .map((e) => CardCarusel(category: e))
                  .toList(),
            ),
          ),
          const SectionTitle(
            title: 'Popular',
          ),
          Expanded(
            child: ProductCarusel(
                products: Product.products
                    .where((element) => element.isPopular)
                    .toList()),
          ),
          const SectionTitle(
            title: 'Recommended',
          ),
          Expanded(
            child: ProductCarusel(
                products: Product.products
                    .where((element) => element.isRecommended)
                    .toList()),
          ),
        ],
      ),
    );
  }
}
