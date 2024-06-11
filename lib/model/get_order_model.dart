// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromJson(jsonString);

import 'dart:convert';

GetOrderModel getOrderModelFromJson(String str) =>
    GetOrderModel.fromJson(json.decode(str));

String getOrderModelToJson(GetOrderModel data) => json.encode(data.toJson());

class GetOrderModel {
  GetOrderModel({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data!.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    // this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  dynamic currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  dynamic from;
  dynamic lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        // lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.orderId,
    this.driverId,
    this.productOrderId,
    this.productId,
    this.deliveryDate,
    this.orderStatusId,
    this.createdAt,
    this.updatedAt,
    this.productOrders,
    this.user,
    this.deliveryAddressId,
    this.paymentId,
    this.promotionalDisount,
    this.isCouponApplied,
    this.deliveryAddress,
    this.couponCode,
    this.subtotal,
    this.finalAmount,
    this.tax,
    this.deliveryFee,
    this.paymentMethod,
    this.timeslotId,
  });

  dynamic id;
  dynamic userId;
  dynamic orderId;
  dynamic driverId;
  dynamic productOrderId;
  dynamic productId;
  DateTime? deliveryDate;
  dynamic orderStatusId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ProductOrders>? productOrders;
  User? user;
  //Order? order;
  int? deliveryAddressId;
  int? paymentId;
  int? promotionalDisount;
  int? isCouponApplied;
  String? couponCode;
  double? subtotal;
  double? finalAmount;
  double? tax;
  double? deliveryFee;
  String? paymentMethod;
  int? timeslotId;
  DeliveryAddress? deliveryAddress;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        driverId: json["driver_id"],
        productOrderId: json["product_order_id"],
        productId: json["product_id"],
        deliveryAddressId: json['delivery_address_id'],
        paymentId: json['payment_id'] != null
            ? int.parse(json['payment_id'].toString())
            : null,
        promotionalDisount: json['promotional_disount'],
        isCouponApplied: json['is_coupon_applied'],
        couponCode: json['coupon_code'],
        subtotal: json['sub_total'] != null
            ? double.parse(json['sub_total']!.toString())
            : 0.0,
        finalAmount: json['final_amount'] != null
            ? double.parse(json['final_amount']!.toString())
            : 0.0,
        tax: json['tax'] != null ? double.parse(json['tax']!.toString()) : 0.0,
        deliveryFee: json['delivery_fee'] != null
            ? double.parse(json['delivery_fee']!.toString())
            : 0.0,
        paymentMethod: json['payment_method'],
        timeslotId: json['time_slot_id'],
        deliveryDate: json["delivery_date"] != null
            ? DateTime.parse(json["delivery_date"])
            : null,
        orderStatusId: json["order_status_id"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        productOrders: json["product_orders_driver"] != null
            ? List<ProductOrders>.from(json["product_orders_driver"]
                .map((e) => ProductOrders.fromJson(e))).toList()
            : [],
        // deliveryStatus: List<DeliveryStatus>.from(json['product_deliverys'].map((e)=>DeliveryStatus.fromJson(e["delivery_status"]))),
        user: User.fromJson(json["user_only"]),
        deliveryAddress: json["delivery_address"] != null
            ? DeliveryAddress.fromJson(json["delivery_address"])
            : DeliveryAddress(),
        // order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "driver_id": driverId,
        "product_order_id": productOrderId,
        "product_id": productId,
        "delivery_date": deliveryDate!.toIso8601String(),
        "order_status_id": orderStatusId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "product_orders": productOrders!.map((e) => e.toJson()),
        "user": user!.toJson(),
        // "order": order!.toJson(),
      };
}

class DeliveryStatus {
  DeliveryStatus({
    this.id,
    this.status,
    // this.createdAt,
    // this.updatedAt,
  });

  dynamic id;
  String? status;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  factory DeliveryStatus.fromJson(Map<String, dynamic> json) => DeliveryStatus(
        id: json["id"],
        status: json["status"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        // "created_at": createdAt!.toIso8601String(),
        // "updated_at": updatedAt!.toIso8601String(),
      };
}

class Order {
  Order({
    this.id,
    this.userId,
    this.orderStatusId,
    this.deliveryAddressId,
    this.paymentId,
    this.promotionalDisount,
    this.isCouponApplied,
    this.couponCode,
    this.subtotal,
    this.finalAmount,
    this.tax,
    this.deliveryFee,
    this.paymentMethod,
    this.timeslotId,
    this.createdAt,
    this.updatedAt,
    this.deliveryAddress,
  });

  dynamic id;
  dynamic userId;
  dynamic orderStatusId;
  dynamic deliveryAddressId;
  dynamic paymentId;
  dynamic promotionalDisount;
  dynamic isCouponApplied;
  dynamic couponCode;
  dynamic subtotal;
  dynamic finalAmount;
  dynamic tax;
  dynamic deliveryFee;
  String? paymentMethod;
  dynamic timeslotId;
  DateTime? createdAt;
  DateTime? updatedAt;
  DeliveryAddress? deliveryAddress;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["user_id"],
        orderStatusId: json["order_status_id"],
        deliveryAddressId: json["delivery_address_id"],
        paymentId: json["payment_id"],
        promotionalDisount: json["promotional_disount"],
        isCouponApplied: json["is_coupon_applied"],
        couponCode: json["coupon_code"],
        subtotal: json["subtotal"],
        finalAmount: json["final_amount"],
        tax: json["tax"],
        deliveryFee: json["delivery_fee"],
        paymentMethod: json["payment_method"],
        timeslotId: json["timeslot_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"].toString()),
        deliveryAddress: json["delivery_address"] != null
            ? DeliveryAddress.fromJson(json["delivery_address"])
            : DeliveryAddress(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_status_id": orderStatusId,
        "delivery_address_id": deliveryAddressId,
        "payment_id": paymentId,
        "promotional_disount": promotionalDisount,
        "is_coupon_applied": isCouponApplied,
        "coupon_code": couponCode,
        "subtotal": subtotal,
        "final_amount": finalAmount,
        "tax": tax,
        "delivery_fee": deliveryFee,
        "payment_method": paymentMethod,
        "timeslot_id": timeslotId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "delivery_address": deliveryAddress!.toJson(),
      };
}

class DeliveryAddress {
  DeliveryAddress({
    this.id,
    this.type,
    this.locationName,
    this.address,
    this.googleAddress,
    this.note,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.latitude,
    this.longitude,
    this.isDefault,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  String? type;
  dynamic locationName;
  String? address;
  String? googleAddress;
  dynamic note;
  dynamic city;
  String? state;
  String? country;
  String? zipcode;
  String? latitude;
  String? longitude;
  dynamic isDefault;
  dynamic userId;
  dynamic createdAt;
  dynamic updatedAt;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        id: json["id"],
        type: json["type"],
        locationName: json["location_name"],
        address: json["address"],
        googleAddress: json["google_address"],
        note: json["note"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipcode: json["zipcode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isDefault: json["is_default"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? ''
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? ''
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "location_name": locationName,
        "address": address,
        "google_address": googleAddress,
        "note": note,
        "city": city,
        "state": state,
        "country": country,
        "zipcode": zipcode,
        "latitude": latitude,
        "longitude": longitude,
        "is_default": isDefault,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class ProductOrders {
  ProductOrders({
    this.id,
    this.userId,
    this.orderId,
    this.productId,
    this.quantity,
    this.perItemAmount,
    this.perDeliveryAmount,
    this.totalDeliveryAmount,
    this.noOfDelivery,
    this.orderFrequency,
    this.days,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.deliveryStatus,
    this.updatedAt,
    this.product,
  });

  dynamic id;
  dynamic userId;
  dynamic orderId;
  dynamic productId;
  dynamic quantity;
  dynamic perItemAmount;
  dynamic perDeliveryAmount;
  dynamic totalDeliveryAmount;
  dynamic noOfDelivery;
  String? orderFrequency;
  String? days;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdAt;
  dynamic updatedAt;
  Product? product;
  List<DeliveryStatus>? deliveryStatus;

  factory ProductOrders.fromJson(Map<String, dynamic> json) => ProductOrders(
        id: json["id"],
        userId: json["user_id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        perItemAmount: json["per_item_amount"],
        perDeliveryAmount: json["per_delivery_amount"],
        totalDeliveryAmount: json["total_delivery_amount"],
        noOfDelivery: json["no_of_delivery"],
        orderFrequency: json["order_frequency"],
        days: json["days"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        deliveryStatus: List<DeliveryStatus>.from(
            json['product_deliverys_status']
                .map((e) => DeliveryStatus.fromJson(e["delivery_status"]))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        product:
            json["product"] != null ? Product.fromJson(json["product"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "per_item_amount": perItemAmount,
        "per_delivery_amount": perDeliveryAmount,
        "total_delivery_amount": totalDeliveryAmount,
        "no_of_delivery": noOfDelivery,
        "order_frequency": orderFrequency,
        "days": days,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
        "product": product!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.discountPrice,
    this.stock,
    this.description,
    this.minimumOrderQuantity,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  String? name;
  String? image;
  dynamic price;
  dynamic discountPrice;
  dynamic stock;
  dynamic description;
  dynamic minimumOrderQuantity;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        discountPrice: json["discount_price"],
        stock: json["stock"],
        description: json["description"],
        minimumOrderQuantity: json["minimum_order_quantity"],
        status: json["status"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "discount_price": discountPrice,
        "stock": stock,
        "description": description,
        "minimum_order_quantity": minimumOrderQuantity,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class User {
  User({
    this.id,
    this.type,
    this.name,
    this.image,
    this.langCode,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.isVerified,
    this.enableNotificaton,
    this.otp,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  String? type;
  dynamic name;
  dynamic image;
  dynamic langCode;
  dynamic email;
  String? phone;
  dynamic emailVerifiedAt;
  dynamic isVerified;
  dynamic enableNotificaton;
  dynamic otp;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        image: json["image"],
        langCode: json["lang_code"],
        email: json["email"],
        phone: json["phone"],
        emailVerifiedAt: json["email_verified_at"],
        isVerified: json["is_verified"],
        enableNotificaton: json["enable_notificaton"],
        otp: json["otp"],
        status: json["status"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(),
        updatedAt: DateTime.parse(json["updated_at"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "image": image,
        "lang_code": langCode,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "is_verified": isVerified,
        "enable_notificaton": enableNotificaton,
        "otp": otp,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
