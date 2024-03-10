class BrandModel {
  int? id;
  String? brandType;
  String? brandName;
  String? brandFacebookPageLink;
  String? brandInstagramPageLink;
  String? brandWebsiteLink;
  String? brandMobileNumber;
  String? brandEmailAddress;
  String? taxIdNumber;
  String? brandDescription;
  String? brandLogoImagePath;

  BrandModel(
      {this.id,
      this.brandType,
      this.brandName,
      this.brandFacebookPageLink,
      this.brandInstagramPageLink,
      this.brandWebsiteLink,
      this.brandMobileNumber,
      this.brandEmailAddress,
      this.taxIdNumber,
      this.brandDescription,
      this.brandLogoImagePath});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandType = json['brand_type'];
    brandName = json['brand_name'];
    brandFacebookPageLink = json['brand_facebook_page_link'];
    brandInstagramPageLink = json['brand_instagram_page_link'];
    brandWebsiteLink = json['brand_website_link'];
    brandMobileNumber = json['brand_mobile_number'];
    brandEmailAddress = json['brand_email_address'];
    taxIdNumber = json['tax_id_number'];
    brandDescription = json['brand_description'];
    brandLogoImagePath = json['brand_logo_image_path'];
  }
}
