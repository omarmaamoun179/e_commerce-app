import 'cart_item.dart';

class DataCartEntity {
  final List<CartItem>? cartItems;
  final dynamic subTotal;
  final int? total;

  const DataCartEntity({this.cartItems, this.subTotal, this.total});

  factory DataCartEntity.fromJson(Map<String, dynamic> json) => DataCartEntity(
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        subTotal: json['sub_total'],
        total: json['total'] as int?,
      );
}
