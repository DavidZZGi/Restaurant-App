import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  double get getSubtotal =>
      products.fold(0, (total, currentPrice) => total + currentPrice.price);

  String get getSubtotalString => getSubtotal.toStringAsFixed(2);
  double deleveryFee(getSubtotal) {
    if (getSubtotal > 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDeliveryMessage() {
    if (getSubtotal > 30) {
      return 'You have free delevery';
    } else {
      double messing = 30 - getSubtotal;
      return 'Add \$${messing.round()} for free delivery';
    }
  }

  String get deliveryFeeString => deleveryFee(getSubtotal).toStringAsFixed(2);
  double total(getSubtotal) {
    double delivery = deleveryFee(getSubtotal);
    double total = delivery + getSubtotal;
    return total;
  }

  String get totalString => total(getSubtotal).toStringAsFixed(2);

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}
