// To parse this JSON data, do
//
//     final scanAsset = scanAssetFromJson(jsonString);

import 'dart:convert';

ScanAsset scanAssetFromJson(String str) => ScanAsset.fromJson(json.decode(str));

String scanAssetToJson(ScanAsset data) => json.encode(data.toJson());

class ScanAsset {
  String assetId;
  String assetNumber;
  String assetName;
  DateTime assetDateBuyed;
  String assetCategoryId;
  String brandId;
  String brandName;
  String assetCategoryName;
  String assetCategoryNumber;
  String userName;
  String userNrp;
  String userDept;
  String statusId;
  String statusName;
  String roomId;
  String roomName;
  String locId;
  String locName;

  ScanAsset({
    this.assetId,
    this.assetNumber,
    this.assetName,
    this.assetDateBuyed,
    this.assetCategoryId,
    this.brandId,
    this.brandName,
    this.assetCategoryName,
    this.assetCategoryNumber,
    this.userName,
    this.userNrp,
    this.userDept,
    this.statusId,
    this.statusName,
    this.roomId,
    this.roomName,
    this.locId,
    this.locName,
  });

  factory ScanAsset.fromJson(Map<String, dynamic> json) => ScanAsset(
        assetId: json["asset_id"],
        assetNumber: json["asset_number"],
        assetName: json["asset_name"],
        assetDateBuyed: DateTime.parse(json["asset_date_buyed"]),
        assetCategoryId: json["asset_category_id"],
        brandId: json["brand_id"],
        brandName: json["Brand_name"],
        assetCategoryName: json["asset_category_name"],
        assetCategoryNumber: json["asset_category_number"],
        userName: json["user_name"],
        userNrp: json["user_nrp"],
        userDept: json["user_dept"],
        statusId: json["status_id"],
        statusName: json["status_name"],
        roomId: json["room_id"],
        roomName: json["room_name"],
        locId: json["loc_id"],
        locName: json["loc_name"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": assetId,
        "asset_number": assetNumber,
        "asset_name": assetName,
        "asset_date_buyed":
            "${assetDateBuyed.year.toString().padLeft(4, '0')}-${assetDateBuyed.month.toString().padLeft(2, '0')}-${assetDateBuyed.day.toString().padLeft(2, '0')}",
        "asset_category_id": assetCategoryId,
        "brand_id": brandId,
        "Brand_name": brandName,
        "asset_category_name": assetCategoryName,
        "asset_category_number": assetCategoryNumber,
        "user_name": userName,
        "user_nrp": userNrp,
        "user_dept": userDept,
        "status_id": statusId,
        "status_name": statusName,
        "room_id": roomId,
        "room_name": roomName,
        "loc_id": locId,
        "loc_name": locName,
      };
}
