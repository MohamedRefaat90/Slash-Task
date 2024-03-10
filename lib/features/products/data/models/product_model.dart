import 'brand_model.dart';
import 'product_variations_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? type;
  String? description;
  int? brandId;
  BrandModel? brands;
  List<ProductVariationsModel>? productVariations;

  ProductModel(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.brandId,
      this.brands,
      this.productVariations});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    brandId = json['brand_id'];
    brands =
        json['Brands'] != null ? BrandModel.fromJson(json['Brands']) : null;
    if (json['ProductVariations'] != null) {
      productVariations = <ProductVariationsModel>[];
      json['ProductVariations'].forEach((v) {
        productVariations!.add(ProductVariationsModel.fromJson(v));
      });
    }
  }
}
