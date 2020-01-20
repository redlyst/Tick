// To parse this JSON data, do
//
//     final getTicket = getTicketFromJson(jsonString);

import 'dart:convert';

List<GetTicket> getTicketFromJson(String str) =>
    List<GetTicket>.from(json.decode(str).map((x) => GetTicket.fromJson(x)));

String getTicketToJson(List<GetTicket> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTicket {
  String id;
  String tiketId;
  String assistId;
  String subject;
  String reporterNrp;
  String reporterName;
  String department;
  String email;
  String assetId;
  String assetName;
  String message;
  dynamic notification;
  String media;
  String priority;
  String submitter;
  dynamic note;
  DateTime lastModified;
  DateTime reportedAt;
  dynamic respondTime;
  dynamic resolveTime;
  String status;

  GetTicket({
    this.id,
    this.tiketId,
    this.assistId,
    this.subject,
    this.reporterNrp,
    this.reporterName,
    this.department,
    this.email,
    this.assetId,
    this.assetName,
    this.message,
    this.notification,
    this.media,
    this.priority,
    this.submitter,
    this.note,
    this.lastModified,
    this.reportedAt,
    this.respondTime,
    this.resolveTime,
    this.status,
  });

  factory GetTicket.fromJson(Map<String, dynamic> json) => GetTicket(
        id: json["id"],
        tiketId: json["tiket_id"],
        assistId: json["assist_id"],
        subject: json["subject"],
        reporterNrp: json["reporter_nrp"],
        reporterName: json["reporter_name"],
        department: json["department"],
        email: json["email"],
        assetId: json["asset_id"],
        assetName: json["asset_name"],
        message: json["message"],
        notification: json["notification"],
        media: json["media"],
        priority: json["priority"],
        submitter: json["submitter"],
        note: json["note"],
        lastModified: DateTime.parse(json["last_modified"]),
        reportedAt: DateTime.parse(json["reported_at"]),
        respondTime: json["respond_time"],
        resolveTime: json["resolve_time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tiket_id": tiketId,
        "assist_id": assistId,
        "subject": subject,
        "reporter_nrp": reporterNrp,
        "reporter_name": reporterName,
        "department": department,
        "email": email,
        "asset_id": assetId,
        "asset_name": assetName,
        "message": message,
        "notification": notification,
        "media": media,
        "priority": priority,
        "submitter": submitter,
        "note": note,
        "last_modified": lastModified.toIso8601String(),
        "reported_at": reportedAt.toIso8601String(),
        "respond_time": respondTime,
        "resolve_time": resolveTime,
        "status": status,
      };
}
