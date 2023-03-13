part of 'wishlist_bloc_bloc.dart';

abstract class WishlistBlocState extends Equatable {
  const WishlistBlocState();

  @override
  List<Object> get props => [];
}

class WishlistBlocLoading extends WishlistBlocState {}

class WishlistBlocLoaded extends WishlistBlocState {
  final WishList wishList;
  const WishlistBlocLoaded({this.wishList = const WishList()});
  @override
  List<Object> get props => [wishList];
}

class WishlistBlocError extends WishlistBlocState {}
