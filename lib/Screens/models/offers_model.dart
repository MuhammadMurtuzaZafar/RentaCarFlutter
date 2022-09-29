// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'dart:convert';

List<Offer> offerFromJson(String str) => List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerToJson(List<Offer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  Offer({
    required this.offerId,
    required this.offerTitle,
    required this.offerPrice,
    required this.tenure,
    required this.includeExcludeList,
  });

  String offerId;
  String offerTitle;
  String offerPrice;
  String tenure;
  List<IncludeExcludeList> includeExcludeList;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    offerId: json["offer_id"],
    offerTitle: json["offer_title"],
    offerPrice: json["offer_price"],
    tenure: json["tenure"],
    includeExcludeList: List<IncludeExcludeList>.from(json["include_exclude_list"].map((x) => IncludeExcludeList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offer_id": offerId,
    "offer_title": offerTitle,
    "offer_price": offerPrice,
    "tenure": tenure,
    "include_exclude_list": List<dynamic>.from(includeExcludeList.map((x) => x.toJson())),
  };
}

class IncludeExcludeList {
  IncludeExcludeList({
    required this.content,
    required this.ieType,
  });

  String content;
  String ieType;

  factory IncludeExcludeList.fromJson(Map<String, dynamic> json) => IncludeExcludeList(
    content: json["content"],
    ieType: json["ie_type"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "ie_type": ieType,
  };
}



