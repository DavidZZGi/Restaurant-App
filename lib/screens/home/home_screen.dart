// ignore: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/models.dart';
import 'package:restaurant_app/screens/cart/cart_screen.dart';

import '../../widgets/widgets.dart';

class HomeAppScreen extends StatefulWidget {
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
  State<HomeAppScreen> createState() => _HomeAppScreenState();
}

class _HomeAppScreenState extends State<HomeAppScreen> {
  var _courentTab = 0;
  final List<Widget> tabs = [
    const HomeContent(),
    const CartScreen(),
    const Center(
      child: Text('Cuenta'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _courentTab == 0
          ? const CustomAppBar(
              title: 'BettyBoom',
            )
          : null,
      // bottomNavigationBar: const BottomNavBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _courentTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle),
            label: 'Cuenta',
          ),
        ],
        onTap: (index) {
          setState(() {
            _courentTab = index;
          });
        },
      ),
      // ignore: avoid_unnecessary_containers
      body: IndexedStack(
        index: _courentTab,
        children: tabs,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: true,
            autoPlay: true,
          ),
          items: Category.listCategories
              .map((e) => CardCarousel(category: e))
              .toList(),
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
    );
  }
}
