class AddToCartProductEntity {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  AddToCartProductEntity(
      {this.id, this.price, this.oldPrice, this.discount, this.image});

  factory AddToCartProductEntity.fromJson(Map<String, dynamic> json) =>
      AddToCartProductEntity(
        id: json['id'] as int?,
        price: json['price'] as int?,
        oldPrice: json['old_price'] as int?,
        discount: json['discount'] as int?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'old_price': oldPrice,
        'discount': discount,
        'image': image,
      };
}
