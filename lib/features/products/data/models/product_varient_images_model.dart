class ProductVarientImages {
  int? id;
  String? imagePath;
  int? productVarientId;

  ProductVarientImages({
    this.id,
    this.imagePath,
    this.productVarientId,
  });

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
  }
}
