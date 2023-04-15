// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));
//
// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopItems {
  ShopItems({
    this.id,
    this.name,
    this.tagLine,
    this.description,
    this.price,
    this.commissionPercentage,
    this.offerPrice,
    this.image,
    this.isActive,
    this.inActive,
    this.shopId,
    // this.shop,
    this.itemCategoryId,
    this.itemsCategory,
    this.itemImages,
    this.offerId,
    this.offer,
    this.preference,
    this.quantity,
    this.deliveryCharge,
  });

  String? id;
  String? name;
  String? tagLine;
  String? description;
  String? price;
  String? commissionPercentage;
  String? offerPrice;
  String? image;
  bool? isActive;
  bool? inActive;
  String? shopId;
  // Shop? shop;
  String? itemCategoryId;
  ItemsCategory? itemsCategory;
  String? itemImages;
  String? offerId;
  Offer? offer;
  String? preference;
  String? quantity;
  String? deliveryCharge;

  factory ShopItems.fromJson(Map<String, dynamic> json) => ShopItems(
    id: json["Id"].toString(),
    name: json["Name"].toString(),
    tagLine: json["TagLine"].toString(),
    description: json["Description"].toString(),
    price: json["Price"].toString(),
    commissionPercentage: json["CommissionPercentage"].toString(),
    offerPrice: json["OfferPrice"].toString(),
    image: json["Image"].toString(),
    isActive: json["IsActive"],
    inActive: json["InActive"],
    shopId: json["ShopId"].toString(),
    // shop: json["Shop"] == null ? null : Shop.fromJson(json["Shop"]),
    itemCategoryId: json["ItemCategoryId"].toString(),
    itemsCategory: json["ItemsCategory"] == null ? null : ItemsCategory.fromJson(json["ItemsCategory"]),
    itemImages: json["ItemImages"].toString(),
    offerId: json["OfferId"].toString(),
    offer: json["Offer"] == null ? null : Offer.fromJson(json["Offer"]),
    preference: json["Preference"].toString(),
    quantity: json["Quantity"].toString(),
    deliveryCharge: json["DeliveryCharge"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "TagLine": tagLine,
    "Description": description,
    "Price": price,
    "CommissionPercentage": commissionPercentage,
    "OfferPrice": offerPrice,
    "Image": image,
    "IsActive": isActive,
    "InActive": inActive,
    "ShopId": shopId,
    // "Shop": shop?.toJson(),
    "ItemCategoryId": itemCategoryId,
    "ItemsCategory": itemsCategory?.toJson(),
    "ItemImages": itemImages,
    "OfferId": offerId,
    "Offer": offer?.toJson(),
    "Preference": preference,
    "Quantity": quantity,
    "DeliveryCharge": deliveryCharge,
  };
}

class ItemsCategory {
  ItemsCategory({
    this.id,
    this.name,
    this.image,
    this.isActive,
    this.isChecked,
    this.itemCategoryId,
    this.priority,
    // this.items,
  });

  String? id;
  String? name;
  String? image;
  bool? isActive;
  bool? isChecked;
  String? itemCategoryId;
  String? priority;
  // dynamic items;

  factory ItemsCategory.fromJson(Map<String, dynamic> json) => ItemsCategory(
    id: json["Id"].toString(),
    name: json["Name"].toString(),
    image: json["Image"].toString(),
    isActive: json["IsActive"],
    isChecked: json["IsChecked"],
    itemCategoryId: json["ItemCategoryId"].toString(),
    priority: json["Priority"].toString(),
    // items: json["Items"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Image": image,
    "IsActive": isActive,
    "IsChecked": isChecked,
    "ItemCategoryId": itemCategoryId,
    "Priority": priority,
    // "Items": items,
  };
}

class Offer {
  Offer({
    this.id,
    this.percentage,
    this.image,
    this.tittle,
    this.isActive,
    this.isPercentage,
    // this.shopId,
    // this.shop,
  });

  String? id;
  String? percentage;
  String? image;
  String? tittle;
  bool? isActive;
  bool? isPercentage;
  // dynamic shopId;
  // dynamic shop;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["Id"].toString(),
    percentage: json["Percentage"].toString(),
    image: json["Image"].toString(),
    tittle: json["Tittle"].toString(),
    isActive: json["IsActive"],
    isPercentage: json["IsPercentage"],
    // shopId: json["ShopId"],
    // shop: json["Shop"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Percentage": percentage,
    "Image": image,
    "Tittle": tittle,
    "IsActive": isActive,
    "IsPercentage": isPercentage,
    // "ShopId": shopId,
    // "Shop": shop,
  };
}

class Shop {
  Shop({
    this.id,
    this.name,
    this.tagLine,
    this.address,
    this.description,
    this.openingHours,
    this.cuisines,
    this.image,
    this.averageRating,
    this.shopCategoryId,
    this.deliveryTime,
    this.preference,
    this.deliveryCharge,
    this.commissionPercentage,
    this.mobileNo,
    this.mobileNo2,
    this.mobileNo3,
    this.startTime,
    this.endTime,
    this.lat,
    this.lng,
    this.deliveryRange,
    this.averageCost,
    this.order,
    this.locationId,
    this.location,
    this.isActive,
    this.shopCategory,
    this.shopImages,
    this.shopInfos,
    this.shopMenus,
    this.items,
    this.itemCategories,
  });

  int? id;
  String? name;
  dynamic tagLine;
  dynamic address;
  dynamic description;
  dynamic openingHours;
  dynamic cuisines;
  dynamic image;
  dynamic averageRating;
  int? shopCategoryId;
  dynamic deliveryTime;
  dynamic preference;
  int? deliveryCharge;
  int? commissionPercentage;
  dynamic mobileNo;
  dynamic mobileNo2;
  dynamic mobileNo3;
  int? startTime;
  int? endTime;
  dynamic lat;
  dynamic lng;
  int? deliveryRange;
  int? averageCost;
  int? order;
  dynamic locationId;
  dynamic location;
  bool? isActive;
  dynamic shopCategory;
  dynamic shopImages;
  dynamic shopInfos;
  dynamic shopMenus;
  dynamic items;
  dynamic itemCategories;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["Id"],
    name: json["Name"],
    tagLine: json["TagLine"],
    address: json["Address"],
    description: json["Description"],
    openingHours: json["OpeningHours"],
    cuisines: json["Cuisines"],
    image: json["Image"],
    averageRating: json["AverageRating"],
    shopCategoryId: json["ShopCategoryId"],
    deliveryTime: json["DeliveryTime"],
    preference: json["Preference"],
    deliveryCharge: json["DeliveryCharge"],
    commissionPercentage: json["CommissionPercentage"],
    mobileNo: json["MobileNo"],
    mobileNo2: json["MobileNo2"],
    mobileNo3: json["MobileNo3"],
    startTime: json["StartTime"],
    endTime: json["EndTime"],
    lat: json["Lat"],
    lng: json["Lng"],
    deliveryRange: json["DeliveryRange"],
    averageCost: json["AverageCost"],
    order: json["Order"],
    locationId: json["LocationId"],
    location: json["Location"],
    isActive: json["IsActive"],
    shopCategory: json["ShopCategory"],
    shopImages: json["ShopImages"],
    shopInfos: json["ShopInfos"],
    shopMenus: json["ShopMenus"],
    items: json["Items"],
    itemCategories: json["ItemCategories"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "TagLine": tagLine,
    "Address": address,
    "Description": description,
    "OpeningHours": openingHours,
    "Cuisines": cuisines,
    "Image": image,
    "AverageRating": averageRating,
    "ShopCategoryId": shopCategoryId,
    "DeliveryTime": deliveryTime,
    "Preference": preference,
    "DeliveryCharge": deliveryCharge,
    "CommissionPercentage": commissionPercentage,
    "MobileNo": mobileNo,
    "MobileNo2": mobileNo2,
    "MobileNo3": mobileNo3,
    "StartTime": startTime,
    "EndTime": endTime,
    "Lat": lat,
    "Lng": lng,
    "DeliveryRange": deliveryRange,
    "AverageCost": averageCost,
    "Order": order,
    "LocationId": locationId,
    "Location": location,
    "IsActive": isActive,
    "ShopCategory": shopCategory,
    "ShopImages": shopImages,
    "ShopInfos": shopInfos,
    "ShopMenus": shopMenus,
    "Items": items,
    "ItemCategories": itemCategories,
  };
}
