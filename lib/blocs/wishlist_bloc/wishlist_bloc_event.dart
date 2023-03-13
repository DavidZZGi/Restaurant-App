part of 'wishlist_bloc_bloc.dart';

abstract class WishlistBlocEvent extends Equatable {
  const WishlistBlocEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishlistBlocEvent {}

class AddWishListProduct extends WishlistBlocEvent {
  final Product product;
  const AddWishListProduct(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveWishListProduct extends WishlistBlocEvent {
  final Product product;
  const RemoveWishListProduct(this.product);
  @override
  List<Object> get props => [product];
}
