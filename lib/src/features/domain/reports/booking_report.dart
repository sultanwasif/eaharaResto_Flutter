// To parse this JSON data, do
//
//     final bookingReport = bookingReportFromJson(jsonString);

// import 'dart:convert';
//
// List<BookingReport> bookingReportFromJson(String str) => List<BookingReport>.from(json.decode(str).map((x) => BookingReport.fromJson(x)));
//
// String bookingReportToJson(List<BookingReport> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingReport {
  BookingReport({
    // this.id,
    // this.isActive,
    // this.isView,
    this.isPaid,
    // this.isBlackList,
    this.description,
    // this.remarks,
    this.time,
    // this.date,
    // this.pickUpDate,
    // this.assignedDate,
    // this.statusDate,
    // this.count,
    // this.total,
    // this.promoOfferPrice,
    // this.totalDeliveryCharge,
    // this.subTotal,
    // this.walletCash,
    // this.commission,
    // this.actualTotal,
    // this.balance,
    // this.name,
    // this.mobileNo,
    // this.emailId,
    this.address,
    this.refNo,
    // this.statusName,
    // this.cancelRemarks,
    // this.lat,
    // this.lng,
    // this.addressId,
    // this.statusId,
    // this.status,
    // this.customerId,
    // this.customer,
    // this.shopId,
    // this.shop,
    // this.locationId,
    // this.location,
    // this.isOrderLater,
    this.orderDate,
    // this.promoOfferId,
    // this.promoOffer,
    // this.employeeId,
    // this.employee,
    this.bookingDetails,
    // this.day,
    // this.month,
    // this.year,
    // this.hour,
    // this.minutes,
    // this.dBooked,
    // this.dApproved,
    // this.dPicked,
    // this.dReady,
    // this.dCancelled,
    // this.dDelivered,
    // this.tAssigned,
    // this.tDelivered,
  });

  // int? id;
  // bool? isActive;
  // bool? isView;
  bool? isPaid;
  // bool? isBlackList;
  String? description;
  // String? remarks;
  String? time;
  // DateTime? date;
  // DateTime? pickUpDate;
  // DateTime? assignedDate;
  // DateTime? statusDate;
  // int? count;
  // int? total;
  // int? promoOfferPrice;
  // int? totalDeliveryCharge;
  // int? subTotal;
  // int? walletCash;
  // int? commission;
  // int? actualTotal;
  // int? balance;
  // String? name;
  // String? mobileNo;
  // String? emailId;
  String? address;
  String? refNo;
  // String? statusName;
  // String? cancelRemarks;
  // String? lat;
  // String? lng;
  // int? addressId;
  // int? statusId;
  // Status? status;
  // String? customerId;
  // String? customer;
  // int? shopId;
  // String? shop;
  // int? locationId;
  // Location? location;
  // bool? isOrderLater;
  DateTime? orderDate;
  // String? promoOfferId;
  // String? promoOffer;
  // String? employeeId;
  // Employee? employee;
  List<BookingDetail>? bookingDetails;
  // int? day;
  // int? month;
  // int? year;
  // int? hour;
  // int? minutes;
  // int? dBooked;
  // int? dApproved;
  // int? dPicked;
  // int? dReady;
  // int? dCancelled;
  // int? dDelivered;
  // int? tAssigned;
  // int? tDelivered;

  factory BookingReport.fromJson(Map<String, dynamic> json) => BookingReport(
    // id: json["Id"],
    // isActive: json["IsActive"],
    // isView: json["IsView"],
    isPaid: json["IsPaid"],
    // isBlackList: json["IsBlackList"],
    description: json["Description"].toString(),
    // remarks: json["Remarks"],
    time: json["Time"].toString(),
    // date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    // pickUpDate: json["PickUpDate"],
    // assignedDate: json["AssignedDate"],
    // statusDate: json["StatusDate"] == null ? null : DateTime.parse(json["StatusDate"]),
    // count: json["Count"],
    // total: json["Total"],
    // promoOfferPrice: json["PromoOfferPrice"],
    // totalDeliveryCharge: json["TotalDeliveryCharge"],
    // subTotal: json["SubTotal"],
    // walletCash: json["WalletCash"],
    // commission: json["Commission"],
    // actualTotal: json["ActualTotal"],
    // balance: json["Balance"],
    // name: json["Name"],
    // mobileNo: json["MobileNo"],
    // emailId: json["EmailId"],
    address: json["Address"].toString(),
    refNo: json["RefNo"].toString(),
    // statusName: json["StatusName"],
    // cancelRemarks: json["CancelRemarks"],
    // lat: json["Lat"],
    // lng: json["Lng"],
    // addressId: json["AddressId"],
    // statusId: json["StatusId"],
    // status: json["Status"] == null ? null : Status.fromJson(json["Status"]),
    // customerId: json["CustomerId"],
    // customer: json["Customer"],
    // shopId: json["ShopId"],
    // shop: json["Shop"],
    // locationId: json["LocationId"],
    // location: json["Location"] == null ? null : Location.fromJson(json["Location"]),
    // isOrderLater: json["IsOrderLater"],
    orderDate: json["OrderDate"] == null ? null : DateTime.parse(json["OrderDate"]),
    // promoOfferId: json["PromoOfferId"],
    // promoOffer: json["PromoOffer"],
    // employeeId: json["EmployeeId"],
    // employee: json["Employee"] == null ? null : Employee.fromJson(json["Employee"]),
    bookingDetails: json["BookingDetails"] == null ? [] : List<BookingDetail>.from(json["BookingDetails"]!.map((x) => BookingDetail.fromJson(x))),
    // day: json["Day"],
    // month: json["Month"],
    // year: json["Year"],
    // hour: json["Hour"],
    // minutes: json["Minutes"],
    // dBooked: json["DBooked"],
    // dApproved: json["DApproved"],
    // dPicked: json["DPicked"],
    // dReady: json["DReady"],
    // dCancelled: json["DCancelled"],
    // dDelivered: json["DDelivered"],
    // tAssigned: json["TAssigned"],
    // tDelivered: json["TDelivered"],
  );

  Map<String, dynamic> toJson() => {
    // "Id": id,
    // "IsActive": isActive,
    // "IsView": isView,
    "IsPaid": isPaid,
    // "IsBlackList": isBlackList,
    "Description": description,
    // "Remarks": remarks,
    "Time": time,
    // "Date": date?.toIso8601String(),
    // "PickUpDate": pickUpDate,
    // "AssignedDate": assignedDate,
    // "StatusDate": statusDate?.toIso8601String(),
    // "Count": count,
    // "Total": total,
    // "PromoOfferPrice": promoOfferPrice,
    // "TotalDeliveryCharge": totalDeliveryCharge,
    // "SubTotal": subTotal,
    // "WalletCash": walletCash,
    // "Commission": commission,
    // "ActualTotal": actualTotal,
    // "Balance": balance,
    // "Name": name,
    // "MobileNo": mobileNo,
    // "EmailId": emailId,
    "Address": address,
    "RefNo": refNo,
    // "StatusName": statusName,
    // "CancelRemarks": cancelRemarks,
    // "Lat": lat,
    // "Lng": lng,
    // "AddressId": addressId,
    // "StatusId": statusId,
    // "Status": status?.toJson(),
    // "CustomerId": customerId,
    // "Customer": customer,
    // "ShopId": shopId,
    // "Shop": shop,
    // "LocationId": locationId,
    // "Location": location?.toJson(),
    // "IsOrderLater": isOrderLater,
    "OrderDate": orderDate?.toIso8601String(),
    // "PromoOfferId": promoOfferId,
    // "PromoOffer": promoOffer,
    // "EmployeeId": employeeId,
    // "Employee": employee?.toJson(),
    "BookingDetails": bookingDetails == null ? [] : List<dynamic>.from(bookingDetails!.map((x) => x.toJson())),
    // "Day": day,
    // "Month": month,
    // "Year": year,
    // "Hour": hour,
    // "Minutes": minutes,
    // "DBooked": dBooked,
    // "DApproved": dApproved,
    // "DPicked": dPicked,
    // "DReady": dReady,
    // "DCancelled": dCancelled,
    // "DDelivered": dDelivered,
    // "TAssigned": tAssigned,
    // "TDelivered": tDelivered,
  };
}

class BookingDetail {
  BookingDetail({
    this.id,
    this.quantity,
    this.price,
    this.totalPrice,
    // this.isActive,
    // this.remarks,
    // this.bookingId,
    // this.booking,
    // this.itemId,
    this.item,
    // this.shopId,
    // this.shop,
    // this.statusId,
    // this.status,
    // this.discountPrice,
    // this.delCharge,
  });

  String? id;
  String? quantity;
  String? price;
  String? totalPrice;
  // bool? isActive;
  // dynamic remarks;
  // int? bookingId;
  // dynamic booking;
  // int? itemId;
  Item? item;
  // int? shopId;
  // dynamic shop;
  // int? statusId;
  // dynamic status;
  // int? discountPrice;
  // int? delCharge;

  factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
    id: json["Id"].toString(),
    quantity: json["Quantity"].toString(),
    price: json["Price"].toString(),
    totalPrice: json["TotalPrice"].toString(),
    // isActive: json["IsActive"],
    // remarks: json["Remarks"],
    // bookingId: json["BookingId"],
    // booking: json["Booking"],
    // itemId: json["ItemId"],
    item: json["Item"] == null ? null : Item.fromJson(json["Item"]),
    // shopId: json["ShopId"],
    // shop: json["Shop"],
    // statusId: json["StatusId"],
    // status: json["Status"],
    // discountPrice: json["DiscountPrice"],
    // delCharge: json["DelCharge"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Quantity": quantity,
    "Price": price,
    "TotalPrice": totalPrice,
    // "IsActive": isActive,
    // "Remarks": remarks,
    // "BookingId": bookingId,
    // "Booking": booking,
    // "ItemId": itemId,
    "Item": item?.toJson(),
    // "ShopId": shopId,
    // "Shop": shop,
    // "StatusId": statusId,
    // "Status": status,
    // "DiscountPrice": discountPrice,
    // "DelCharge": delCharge,
  };
}

class Item {
  Item({
    this.id,
    this.name,
    // this.tagLine,
    // this.description,
    // this.price,
    // this.commissionPercentage,
    // this.offerPrice,
    // this.image,
    // this.isActive,
    // this.inActive,
    // this.shopId,
    // this.shop,
    // this.itemCategoryId,
    // this.itemsCategory,
    // this.itemImages,
    // this.offerId,
    // this.offer,
    // this.preference,
    // this.quantity,
    // this.deliveryCharge,
  });

  String? id;
  String? name;
  // dynamic tagLine;
  // dynamic description;
  // int? price;
  // int? commissionPercentage;
  // int? offerPrice;
  // dynamic image;
  // bool? isActive;
  // bool? inActive;
  // int? shopId;
  // dynamic shop;
  // int? itemCategoryId;
  // dynamic itemsCategory;
  // dynamic itemImages;
  // dynamic offerId;
  // dynamic offer;
  // dynamic preference;
  // int? quantity;
  // int? deliveryCharge;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["Id"].toString(),
    name: json["Name"].toString(),
    // tagLine: json["TagLine"],
    // description: json["Description"],
    // price: json["Price"],
    // commissionPercentage: json["CommissionPercentage"],
    // offerPrice: json["OfferPrice"],
    // image: json["Image"],
    // isActive: json["IsActive"],
    // inActive: json["InActive"],
    // shopId: json["ShopId"],
    // shop: json["Shop"],
    // itemCategoryId: json["ItemCategoryId"],
    // itemsCategory: json["ItemsCategory"],
    // itemImages: json["ItemImages"],
    // offerId: json["OfferId"],
    // offer: json["Offer"],
    // preference: json["Preference"],
    // quantity: json["Quantity"],
    // deliveryCharge: json["DeliveryCharge"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    // "TagLine": tagLine,
    // "Description": description,
    // "Price": price,
    // "CommissionPercentage": commissionPercentage,
    // "OfferPrice": offerPrice,
    // "Image": image,
    // "IsActive": isActive,
    // "InActive": inActive,
    // "ShopId": shopId,
    // "Shop": shop,
    // "ItemCategoryId": itemCategoryId,
    // "ItemsCategory": itemsCategory,
    // "ItemImages": itemImages,
    // "OfferId": offerId,
    // "Offer": offer,
    // "Preference": preference,
    // "Quantity": quantity,
    // "DeliveryCharge": deliveryCharge,
  };
}

// class Employee {
//   Employee({
//     this.id,
//     this.name,
//     this.designation,
//     this.email,
//     this.mobileNo,
//     this.telephoneNo,
//     this.address,
//     this.bankName,
//     this.bankAccount,
//     this.isActive,
//     this.joiningDate,
//     this.isTemp,
//     this.isInActive,
//     this.isOwnEmployee,
//     this.normalWorkingHours,
//     this.locationId,
//     this.location,
//   });
//
//   int? id;
//   String? name;
//   dynamic designation;
//   dynamic email;
//   dynamic mobileNo;
//   dynamic telephoneNo;
//   dynamic address;
//   dynamic bankName;
//   dynamic bankAccount;
//   bool? isActive;
//   DateTime? joiningDate;
//   bool? isTemp;
//   bool? isInActive;
//   bool? isOwnEmployee;
//   int? normalWorkingHours;
//   dynamic locationId;
//   dynamic location;
//
//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//     id: json["Id"],
//     name: json["Name"],
//     designation: json["Designation"],
//     email: json["Email"],
//     mobileNo: json["MobileNo"],
//     telephoneNo: json["TelephoneNo"],
//     address: json["Address"],
//     bankName: json["BankName"],
//     bankAccount: json["BankAccount"],
//     isActive: json["IsActive"],
//     joiningDate: json["JoiningDate"] == null ? null : DateTime.parse(json["JoiningDate"]),
//     isTemp: json["IsTemp"],
//     isInActive: json["IsInActive"],
//     isOwnEmployee: json["IsOwnEmployee"],
//     normalWorkingHours: json["NormalWorkingHours"],
//     locationId: json["LocationId"],
//     location: json["Location"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Name": name,
//     "Designation": designation,
//     "Email": email,
//     "MobileNo": mobileNo,
//     "TelephoneNo": telephoneNo,
//     "Address": address,
//     "BankName": bankName,
//     "BankAccount": bankAccount,
//     "IsActive": isActive,
//     "JoiningDate": joiningDate?.toIso8601String(),
//     "IsTemp": isTemp,
//     "IsInActive": isInActive,
//     "IsOwnEmployee": isOwnEmployee,
//     "NormalWorkingHours": normalWorkingHours,
//     "LocationId": locationId,
//     "Location": location,
//   };
// }
//
// class Location {
//   Location({
//     this.id,
//     this.name,
//     this.lat,
//     this.lng,
//     this.deliveryRange,
//     this.deliveryCharge,
//     this.isActive,
//   });
//
//   int? id;
//   String? name;
//   dynamic lat;
//   dynamic lng;
//   int? deliveryRange;
//   int? deliveryCharge;
//   bool? isActive;
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//     id: json["Id"],
//     name: json["Name"],
//     lat: json["Lat"],
//     lng: json["Lng"],
//     deliveryRange: json["DeliveryRange"],
//     deliveryCharge: json["DeliveryCharge"],
//     isActive: json["IsActive"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Name": name,
//     "Lat": lat,
//     "Lng": lng,
//     "DeliveryRange": deliveryRange,
//     "DeliveryCharge": deliveryCharge,
//     "IsActive": isActive,
//   };
// }
//
// class Status {
//   Status({
//     this.id,
//     this.name,
//     this.isActive,
//   });
//
//   int? id;
//   String? name;
//   bool? isActive;
//
//   factory Status.fromJson(Map<String, dynamic> json) => Status(
//     id: json["Id"],
//     name: json["Name"],
//     isActive: json["IsActive"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Id": id,
//     "Name": name,
//     "IsActive": isActive,
//   };
// }
