// To parse this JSON data, do
//
//     final shopBookingDetails = shopBookingDetailsFromJson(jsonString);

import 'dart:convert';



// List<ShopBookingDetails> shopBookingDetailsFromJson(String str) => List<ShopBookingDetails>.from(json.decode(str).map((x) => ShopBookingDetails.fromJson(x)));
//
// String shopBookingDetailsToJson(List<ShopBookingDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopBookingDetails {
  ShopBookingDetails({
    required this.id,
    required this.isActive,
    required this.isView,
    required this.isPaid,
    required this.isBlackList,
    this.description,
    this.remarks,
    this.time,
    required this.date,
    this.pickUpDate,
    this.assignedDate,
    this.statusDate,
    required this.count,
    required this.total,
    required this.promoOfferPrice,
    required this.totalDeliveryCharge,
    required this.subTotal,
    required this.walletCash,
    required this.commission,
    required this.actualTotal,
    required this.balance,
    required this.name,
    required this.mobileNo,
    required this.emailId,
    this.address,
    required this.refNo,
    required this.statusName,
    this.cancelRemarks,
    this.lat,
    this.lng,
    required this.addressId,
    required this.statusId,
    this.status,
    this.customerId,
    this.customer,
    required this.shopId,
    required this.shop,
    this.locationId,
    required this.location,
    required this.isOrderLater,
    required this.orderDate,
    this.promoOfferId,
    required this.promoOffer,
    this.employeeId,
    required this.employee,
    required this.bookingDetails,
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.minutes,
    required this.dBooked,
    required this.dApproved,
    required this.dPicked,
    required this.dReady,
    required this.dCancelled,
    required this.dDelivered,
    required this.tAssigned,
    required this.tDelivered,
  });

  int id;
  bool isActive;
  bool isView;
  bool isPaid;
  bool isBlackList;
  String? description;
  String? remarks;
  String? time;
  DateTime date;
  DateTime? pickUpDate;
  DateTime? assignedDate;
  DateTime? statusDate;
  int count;
  double total;
  double promoOfferPrice;
  int totalDeliveryCharge;
  double subTotal;
  int walletCash;
  double commission;
  int actualTotal;
  int balance;
  String name;
  String mobileNo;
  String emailId;
  String? address;
  String refNo;
  Name statusName;
  dynamic cancelRemarks;
  String? lat;
  String? lng;
  int addressId;
  int statusId;
  dynamic status;
  dynamic customerId;
  dynamic customer;
  int shopId;
  Shop shop;
  int? locationId;
  Location location;
  bool isOrderLater;
  DateTime orderDate;
  dynamic promoOfferId;
  PromoOffer promoOffer;
  int? employeeId;
  Employee employee;
  List<BookingDetail> bookingDetails;
  int day;
  int month;
  int year;
  int hour;
  int minutes;
  int dBooked;
  int dApproved;
  int dPicked;
  int dReady;
  int dCancelled;
  int dDelivered;
  int tAssigned;
  int tDelivered;

  factory ShopBookingDetails.fromJson(Map<String, dynamic> json) => ShopBookingDetails(
    id: json["Id"],
    isActive: json["IsActive"],
    isView: json["IsView"],
    isPaid: json["IsPaid"],
    isBlackList: json["IsBlackList"],
    description: json["Description"],
    remarks: json["Remarks"],
    time: json["Time"],
    date: DateTime.parse(json["Date"]),
    pickUpDate: json["PickUpDate"] == null ? null : DateTime.parse(json["PickUpDate"]),
    assignedDate: json["AssignedDate"] == null ? null : DateTime.parse(json["AssignedDate"]),
    statusDate: json["StatusDate"] == null ? null : DateTime.parse(json["StatusDate"]),
    count: json["Count"],
    total: json["Total"]?.toDouble(),
    promoOfferPrice: json["PromoOfferPrice"]?.toDouble(),
    totalDeliveryCharge: json["TotalDeliveryCharge"],
    subTotal: json["SubTotal"]?.toDouble(),
    walletCash: json["WalletCash"],
    commission: json["Commission"]?.toDouble(),
    actualTotal: json["ActualTotal"],
    balance: json["Balance"],
    name: json["Name"],
    mobileNo: json["MobileNo"],
    emailId: json["EmailId"],
    address: json["Address"],
    refNo: json["RefNo"],
    statusName: nameValues.map[json["StatusName"]]!,
    cancelRemarks: json["CancelRemarks"],
    lat: json["Lat"],
    lng: json["Lng"],
    addressId: json["AddressId"],
    statusId: json["StatusId"],
    status: json["Status"],
    customerId: json["CustomerId"],
    customer: json["Customer"],
    shopId: json["ShopId"],
    shop: Shop.fromJson(json["Shop"]),
    locationId: json["LocationId"],
    location: Location.fromJson(json["Location"]),
    isOrderLater: json["IsOrderLater"],
    orderDate: DateTime.parse(json["OrderDate"]),
    promoOfferId: json["PromoOfferId"],
    promoOffer: PromoOffer.fromJson(json["PromoOffer"]),
    employeeId: json["EmployeeId"],
    employee: Employee.fromJson(json["Employee"]),
    bookingDetails: List<BookingDetail>.from(json["BookingDetails"].map((x) => BookingDetail.fromJson(x))),
    day: json["Day"],
    month: json["Month"],
    year: json["Year"],
    hour: json["Hour"],
    minutes: json["Minutes"],
    dBooked: json["DBooked"],
    dApproved: json["DApproved"],
    dPicked: json["DPicked"],
    dReady: json["DReady"],
    dCancelled: json["DCancelled"],
    dDelivered: json["DDelivered"],
    tAssigned: json["TAssigned"],
    tDelivered: json["TDelivered"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "IsActive": isActive,
    "IsView": isView,
    "IsPaid": isPaid,
    "IsBlackList": isBlackList,
    "Description": description,
    "Remarks": remarks,
    "Time": time,
    "Date": date.toIso8601String(),
    "PickUpDate": pickUpDate?.toIso8601String(),
    "AssignedDate": assignedDate?.toIso8601String(),
    "StatusDate": statusDate?.toIso8601String(),
    "Count": count,
    "Total": total,
    "PromoOfferPrice": promoOfferPrice,
    "TotalDeliveryCharge": totalDeliveryCharge,
    "SubTotal": subTotal,
    "WalletCash": walletCash,
    "Commission": commission,
    "ActualTotal": actualTotal,
    "Balance": balance,
    "Name": name,
    "MobileNo": mobileNo,
    "EmailId": emailId,
    "Address": address,
    "RefNo": refNo,
    "StatusName": nameValues.reverse[statusName],
    "CancelRemarks": cancelRemarks,
    "Lat": lat,
    "Lng": lng,
    "AddressId": addressId,
    "StatusId": statusId,
    "Status": status,
    "CustomerId": customerId,
    "Customer": customer,
    "ShopId": shopId,
    "Shop": shop.toJson(),
    "LocationId": locationId,
    "Location": location.toJson(),
    "IsOrderLater": isOrderLater,
    "OrderDate": orderDate.toIso8601String(),
    "PromoOfferId": promoOfferId,
    "PromoOffer": promoOffer.toJson(),
    "EmployeeId": employeeId,
    "Employee": employee.toJson(),
    "BookingDetails": List<dynamic>.from(bookingDetails.map((x) => x.toJson())),
    "Day": day,
    "Month": month,
    "Year": year,
    "Hour": hour,
    "Minutes": minutes,
    "DBooked": dBooked,
    "DApproved": dApproved,
    "DPicked": dPicked,
    "DReady": dReady,
    "DCancelled": dCancelled,
    "DDelivered": dDelivered,
    "TAssigned": tAssigned,
    "TDelivered": tDelivered,
  };
}

class BookingDetail {
  BookingDetail({
    required this.id,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.isActive,
    this.remarks,
    required this.bookingId,
    this.booking,
    required this.itemId,
    required this.item,
    required this.shopId,
    this.shop,
    required this.statusId,
    required this.status,
    required this.discountPrice,
    required this.delCharge,
  });

  int id;
  int quantity;
  int price;
  int totalPrice;
  bool isActive;
  dynamic remarks;
  int bookingId;
  dynamic booking;
  int itemId;
  Item item;
  int shopId;
  dynamic shop;
  int statusId;
  Status status;
  int discountPrice;
  int delCharge;

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
    id: json["Id"],
    quantity: json["Quantity"],
    price: json["Price"],
    totalPrice: json["TotalPrice"],
    isActive: json["IsActive"],
    remarks: json["Remarks"],
    bookingId: json["BookingId"],
    booking: json["Booking"],
    itemId: json["ItemId"],
    item: Item.fromJson(json["Item"]),
    shopId: json["ShopId"],
    shop: json["Shop"],
    statusId: json["StatusId"],
    status: Status.fromJson(json["Status"]),
    discountPrice: json["DiscountPrice"],
    delCharge: json["DelCharge"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Quantity": quantity,
    "Price": price,
    "TotalPrice": totalPrice,
    "IsActive": isActive,
    "Remarks": remarks,
    "BookingId": bookingId,
    "Booking": booking,
    "ItemId": itemId,
    "Item": item.toJson(),
    "ShopId": shopId,
    "Shop": shop,
    "StatusId": statusId,
    "Status": status.toJson(),
    "DiscountPrice": discountPrice,
    "DelCharge": delCharge,
  };
}

class Item {
  Item({
    required this.id,
    required this.name,
    this.tagLine,
    this.description,
    required this.price,
    required this.commissionPercentage,
    required this.offerPrice,
    this.image,
    required this.isActive,
    required this.inActive,
    required this.shopId,
    this.shop,
    required this.itemCategoryId,
    this.itemsCategory,
    this.itemImages,
    this.offerId,
    this.offer,
    this.preference,
    required this.quantity,
    required this.deliveryCharge,
  });

  int id;
  String name;
  dynamic tagLine;
  dynamic description;
  int price;
  int commissionPercentage;
  int offerPrice;
  dynamic image;
  bool isActive;
  bool inActive;
  int shopId;
  dynamic shop;
  int itemCategoryId;
  dynamic itemsCategory;
  dynamic itemImages;
  dynamic offerId;
  dynamic offer;
  dynamic preference;
  int quantity;
  int deliveryCharge;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["Id"],
    name: json["Name"],
    tagLine: json["TagLine"],
    description: json["Description"],
    price: json["Price"],
    commissionPercentage: json["CommissionPercentage"],
    offerPrice: json["OfferPrice"],
    image: json["Image"],
    isActive: json["IsActive"],
    inActive: json["InActive"],
    shopId: json["ShopId"],
    shop: json["Shop"],
    itemCategoryId: json["ItemCategoryId"],
    itemsCategory: json["ItemsCategory"],
    itemImages: json["ItemImages"],
    offerId: json["OfferId"],
    offer: json["Offer"],
    preference: json["Preference"],
    quantity: json["Quantity"],
    deliveryCharge: json["DeliveryCharge"],
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
    "Shop": shop,
    "ItemCategoryId": itemCategoryId,
    "ItemsCategory": itemsCategory,
    "ItemImages": itemImages,
    "OfferId": offerId,
    "Offer": offer,
    "Preference": preference,
    "Quantity": quantity,
    "DeliveryCharge": deliveryCharge,
  };
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.isActive,
  });

  int id;
  Name name;
  bool isActive;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    id: json["Id"],
    name: nameValues.map[json["Name"]]!,
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": nameValues.reverse[name],
    "IsActive": isActive,
  };
}

enum Name { CANCELLED, BOOKED }

final nameValues = EnumValues({
  "Booked": Name.BOOKED,
  "Cancelled": Name.CANCELLED
});

class Employee {
  Employee({
    required this.id,
    required this.name,
    this.designation,
    this.email,
    this.mobileNo,
    this.telephoneNo,
    this.address,
    this.bankName,
    this.bankAccount,
    required this.isActive,
    required this.joiningDate,
    required this.isTemp,
    required this.isInActive,
    required this.isOwnEmployee,
    required this.normalWorkingHours,
    this.locationId,
    this.location,
  });

  int id;
  EmployeeName name;
  dynamic designation;
  dynamic email;
  dynamic mobileNo;
  dynamic telephoneNo;
  dynamic address;
  dynamic bankName;
  dynamic bankAccount;
  bool isActive;
  DateTime joiningDate;
  bool isTemp;
  bool isInActive;
  bool isOwnEmployee;
  int normalWorkingHours;
  dynamic locationId;
  dynamic location;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["Id"],
    name: employeeNameValues.map[json["Name"]]!,
    designation: json["Designation"],
    email: json["Email"],
    mobileNo: json["MobileNo"],
    telephoneNo: json["TelephoneNo"],
    address: json["Address"],
    bankName: json["BankName"],
    bankAccount: json["BankAccount"],
    isActive: json["IsActive"],
    joiningDate: DateTime.parse(json["JoiningDate"]),
    isTemp: json["IsTemp"],
    isInActive: json["IsInActive"],
    isOwnEmployee: json["IsOwnEmployee"],
    normalWorkingHours: json["NormalWorkingHours"],
    locationId: json["LocationId"],
    location: json["Location"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": employeeNameValues.reverse[name],
    "Designation": designation,
    "Email": email,
    "MobileNo": mobileNo,
    "TelephoneNo": telephoneNo,
    "Address": address,
    "BankName": bankName,
    "BankAccount": bankAccount,
    "IsActive": isActive,
    "JoiningDate": joiningDate.toIso8601String(),
    "IsTemp": isTemp,
    "IsInActive": isInActive,
    "IsOwnEmployee": isOwnEmployee,
    "NormalWorkingHours": normalWorkingHours,
    "LocationId": locationId,
    "Location": location,
  };
}

enum EmployeeName { EMPTY, SAMEER, ASIF_D, IMRAN, BHARATH, MAHMOOD, RAMESH, SOHAIL, ABDUL_RAHMAN, SULTAN, RAJU_DELIVERY, BHANU, PRADEEP_DEL, RAVI_TEJA, SHYAM, SIDDIPET_POULTRY, NIKHIL, NAGARAJU, NITHISH, SATHEESH, RAHUL, RAKESH, KARNAKAR, SANTHOSH, NAZEER, MAHESH }

final employeeNameValues = EnumValues({
  "Abdul Rahman": EmployeeName.ABDUL_RAHMAN,
  "AsifD": EmployeeName.ASIF_D,
  "Bhanu": EmployeeName.BHANU,
  "bharath": EmployeeName.BHARATH,
  "": EmployeeName.EMPTY,
  "Imran": EmployeeName.IMRAN,
  "Karnakar": EmployeeName.KARNAKAR,
  "Mahesh": EmployeeName.MAHESH,
  "mahmood": EmployeeName.MAHMOOD,
  "Nagaraju": EmployeeName.NAGARAJU,
  "Nazeer": EmployeeName.NAZEER,
  "Nikhil": EmployeeName.NIKHIL,
  "Nithish": EmployeeName.NITHISH,
  "Pradeep del": EmployeeName.PRADEEP_DEL,
  "Rahul": EmployeeName.RAHUL,
  "raju delivery": EmployeeName.RAJU_DELIVERY,
  "Rakesh": EmployeeName.RAKESH,
  "ramesh": EmployeeName.RAMESH,
  "Ravi Teja": EmployeeName.RAVI_TEJA,
  "sameer": EmployeeName.SAMEER,
  "Santhosh": EmployeeName.SANTHOSH,
  "Satheesh": EmployeeName.SATHEESH,
  "Shyam": EmployeeName.SHYAM,
  "Siddipet Poultry": EmployeeName.SIDDIPET_POULTRY,
  "sohail": EmployeeName.SOHAIL,
  "sultan": EmployeeName.SULTAN
});

class Location {
  Location({
    required this.id,
    required this.name,
    this.lat,
    this.lng,
    required this.deliveryRange,
    required this.deliveryCharge,
    required this.isActive,
  });

  int id;
  LocationName name;
  dynamic lat;
  dynamic lng;
  int deliveryRange;
  int deliveryCharge;
  bool isActive;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["Id"],
    name: locationNameValues.map[json["Name"]]!,
    lat: json["Lat"],
    lng: json["Lng"],
    deliveryRange: json["DeliveryRange"],
    deliveryCharge: json["DeliveryCharge"],
    isActive: json["IsActive"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": locationNameValues.reverse[name],
    "Lat": lat,
    "Lng": lng,
    "DeliveryRange": deliveryRange,
    "DeliveryCharge": deliveryCharge,
    "IsActive": isActive,
  };
}

enum LocationName { SIDDIPET, MEHDIPATNAM, EMPTY }

final locationNameValues = EnumValues({
  "": LocationName.EMPTY,
  "Mehdipatnam": LocationName.MEHDIPATNAM,
  "SIDDIPET": LocationName.SIDDIPET
});

class PromoOffer {
  PromoOffer({
    required this.id,
    required this.value,
    required this.maxValue,
    required this.isPercentage,
    this.code,
    this.image,
    required this.tittle,
    required this.count,
    required this.isActive,
    required this.isSelected,
  });

  int id;
  int value;
  int maxValue;
  bool isPercentage;
  dynamic code;
  dynamic image;
  Tittle tittle;
  int count;
  bool isActive;
  bool isSelected;

  factory PromoOffer.fromJson(Map<String, dynamic> json) => PromoOffer(
    id: json["Id"],
    value: json["Value"],
    maxValue: json["MaxValue"],
    isPercentage: json["IsPercentage"],
    code: json["Code"],
    image: json["Image"],
    tittle: tittleValues.map[json["Tittle"]]!,
    count: json["Count"],
    isActive: json["IsActive"],
    isSelected: json["IsSelected"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Value": value,
    "MaxValue": maxValue,
    "IsPercentage": isPercentage,
    "Code": code,
    "Image": image,
    "Tittle": tittleValues.reverse[tittle],
    "Count": count,
    "IsActive": isActive,
    "IsSelected": isSelected,
  };
}

enum Tittle { EMPTY, EAHARA_WOW, EAHARA_50, WELCOMEBACK, EAHARA2021, WELCOME }

final tittleValues = EnumValues({
  "EAHARA2021": Tittle.EAHARA2021,
  "EAHARA 50": Tittle.EAHARA_50,
  "EAHARA WOW": Tittle.EAHARA_WOW,
  "": Tittle.EMPTY,
  "WELCOME": Tittle.WELCOME,
  "WELCOMEBACK": Tittle.WELCOMEBACK
});

class Shop {
  Shop({
    required this.id,
    required this.name,
    this.tagLine,
    this.address,
    this.description,
    this.openingHours,
    this.cuisines,
    this.image,
    this.averageRating,
    required this.shopCategoryId,
    this.deliveryTime,
    this.preference,
    required this.deliveryCharge,
    required this.commissionPercentage,
    this.mobileNo,
    this.mobileNo2,
    this.mobileNo3,
    required this.startTime,
    required this.endTime,
    this.lat,
    this.lng,
    required this.deliveryRange,
    required this.averageCost,
    required this.order,
    this.locationId,
    this.location,
    required this.isActive,
    this.shopCategory,
    this.shopImages,
    this.shopInfos,
    this.shopMenus,
    this.items,
    this.itemCategories,
  });

  int id;
  ShopName name;
  dynamic tagLine;
  dynamic address;
  dynamic description;
  dynamic openingHours;
  dynamic cuisines;
  dynamic image;
  dynamic averageRating;
  int shopCategoryId;
  dynamic deliveryTime;
  dynamic preference;
  int deliveryCharge;
  int commissionPercentage;
  dynamic mobileNo;
  dynamic mobileNo2;
  dynamic mobileNo3;
  int startTime;
  int endTime;
  dynamic lat;
  dynamic lng;
  int deliveryRange;
  int averageCost;
  int order;
  dynamic locationId;
  dynamic location;
  bool isActive;
  dynamic shopCategory;
  dynamic shopImages;
  dynamic shopInfos;
  dynamic shopMenus;
  dynamic items;
  dynamic itemCategories;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["Id"],
    name: shopNameValues.map[json["Name"]]!,
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
    "Name": shopNameValues.reverse[name],
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

enum ShopName { AKSHAYA_FAMILY_RESTAURANT }

final shopNameValues = EnumValues({
  "Akshaya Family Restaurant": ShopName.AKSHAYA_FAMILY_RESTAURANT
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
