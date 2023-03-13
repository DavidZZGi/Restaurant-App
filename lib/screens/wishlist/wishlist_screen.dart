// ignore_for_file: unnecessary_const

import 'package:Ecommerce/blocs/wishlist_bloc/wishlist_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/models.dart';
import '../../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  const WishlistScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          return const WishlistScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wishlist'),
      bottomNavigationBar: BottomNavBar(),
      body: BlocBuilder<WishlistBlocBloc, WishlistBlocState>(
        builder: (context, state) {
          if (state is WishlistBlocLoading) {
            return const Center(child: const CircularProgressIndicator());
          } else if (state is WishlistBlocLoaded) {
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.2),
                itemCount: state.wishList.products.length,
                itemBuilder: (contex, index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishList.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishlist: true,
                    ),
                  );
                });
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
