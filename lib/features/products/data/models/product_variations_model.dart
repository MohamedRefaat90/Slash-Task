import 'product_varient_images_model.dart';

class ProductVariationsModel {
  int? id;
  int? productId;
  int? price;
  int? quantity;
  bool? isDefault;
  List<ProductVarientImages>? productVarientImages;

  ProductVariationsModel(
      {this.id,
      this.productId,
      this.price,
      this.quantity,
      this.isDefault,
      this.productVarientImages});

  ProductVariationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    price = json['price'];
    quantity = json['quantity'];
    isDefault = json['is_default'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
  }
}
