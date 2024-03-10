class ProductDetailsModel {
  int? id;
  String? name;
  String? type;
  String? description;
  int? brandId;
  Count? count;
  Null sizeChart;
  SubCategory? subCategory;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;

  ProductDetailsModel(
      {this.id,
      this.name,
      this.type,
      this.description,
      this.brandId,
      this.count,
      this.sizeChart,
      this.subCategory,
      this.variations,
      this.avaiableProperties,
      this.brandName,
      this.brandImage});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    description = json['description'];
    brandId = json['brand_id'];
    count = json['_count'] != null ? Count.fromJson(json['_count']) : null;
    sizeChart = json['SizeChart'];
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(Variations.fromJson(v));
      });
    }
    if (json['avaiableProperties'] != null) {
      avaiableProperties = <AvaiableProperties>[];
      json['avaiableProperties'].forEach((v) {
        avaiableProperties!.add(AvaiableProperties.fromJson(v));
      });
    }
    brandName = json['brandName'];
    brandImage = json['brandImage'];
  }
}

class Count {
  int? productVariations;

  Count({this.productVariations});

  Count.fromJson(Map<String, dynamic> json) {
    productVariations = json['ProductVariations'];
  }
}

class SubCategory {
  int? id;
  String? name;

  SubCategory({this.id, this.name});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Variations {
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImages>? productVarientImages;
  List<ProductPropertiesValues>? productPropertiesValues;
  String? productStatus;
  bool? isDefault;
  int? productVariationStatusId;

  Variations(
      {this.id,
      this.price,
      this.quantity,
      this.inStock,
      this.productVarientImages,
      this.productPropertiesValues,
      this.productStatus,
      this.isDefault,
      this.productVariationStatusId});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    quantity = json['quantity'];
    inStock = json['inStock'];
    if (json['ProductVarientImages'] != null) {
      productVarientImages = <ProductVarientImages>[];
      json['ProductVarientImages'].forEach((v) {
        productVarientImages!.add(ProductVarientImages.fromJson(v));
      });
    }
    if (json['productPropertiesValues'] != null) {
      productPropertiesValues = <ProductPropertiesValues>[];
      json['productPropertiesValues'].forEach((v) {
        productPropertiesValues!.add(ProductPropertiesValues.fromJson(v));
      });
    }
    productStatus = json['productStatus'];
    isDefault = json['isDefault'];
    productVariationStatusId = json['product_variation_status_id'];
  }
}

class ProductVarientImages {
  int? id;
  String? imagePath;
  int? productVarientId;

  ProductVarientImages({this.id, this.imagePath, this.productVarientId});

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productVarientId = json['product_varient_id'];
  }
}

class ProductPropertiesValues {
  String? value;
  String? property;

  ProductPropertiesValues({this.value, this.property});

  ProductPropertiesValues.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    property = json['property'];
  }
}

class AvaiableProperties {
  String? property;
  List<Values>? values;

  AvaiableProperties({this.property, this.values});

  AvaiableProperties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }
}

class Values {
  String? value;
  int? id;

  Values({this.value, this.id});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    id = json['id'];
  }
}
