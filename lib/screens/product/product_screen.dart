import 'package:restaurant_app/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:restaurant_app/blocs/wishlist_bloc/wishlist_bloc_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/model/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  const ProductScreen({required this.product, Key? key}) : super(key: key);
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return ProductScreen(product: product);
        });
  }

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
                BlocBuilder<WishlistBlocBloc, WishlistBlocState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBlocBloc>()
                              .add(AddWishListProduct(product));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Product added to your wishlist'),
                            duration: Duration(seconds: 2),
                          ));
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 229, 220, 220)),
                        onPressed: () {
                          context.read<CartBloc>().add(CartAddProduct(product));
                          Navigator.pushNamed(context, '/cart');
                        },
                        child: const Text(
                          'Add to the cart',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ));
                  },
                )
              ],
            ),
          )),
      body: ListView(children: [
        CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items: [
              CardCarousel(
                product: product,
              )
            ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                alignment: Alignment.bottomCenter,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: const Text(
              'Product description',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text(
                    'The ${product.name} is one of th most testy food in our country, so we highly recommended to book this product, you wont regret it ,promese you all'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ExpansionTile(
            initiallyExpanded: true,
            title: const Text(
              'Delivery information',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                title: Text(
                    'The ${product.name} is one of th most testy food in our country, so we highly recommended to book this product, you wont regret it ,promese you all'),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
