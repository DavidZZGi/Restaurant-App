import 'package:restaurant_app/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocLoading());

  @override
  Stream<WishlistBlocState> mapEventToState(WishlistBlocEvent event) async* {
    if (event is StartWishList) {
      yield* _mapstartWishListToState();
    } else if (event is AddWishListProduct) {
      yield* _mapAddWishListProductToState(event, state);
    } else if (event is RemoveWishListProduct) {
      yield* _mapRemoveWishListProductToState(event, state);
    }
  }

  Stream<WishlistBlocState> _mapstartWishListToState() async* {
    yield WishlistBlocLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WishlistBlocLoaded();
    } catch (_) {}
  }

  Stream<WishlistBlocState> _mapAddWishListProductToState(
      AddWishListProduct event, WishlistBlocState state) async* {
    if (state is WishlistBlocLoaded) {
      try {
        yield WishlistBlocLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WishlistBlocState> _mapRemoveWishListProductToState(
      RemoveWishListProduct event, WishlistBlocState state) async* {
    if (state is WishlistBlocLoaded) {
      try {
        yield WishlistBlocLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
