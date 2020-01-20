class Ticket {
  final String id;
  final String subject;

  Ticket(this.id, this.subject);

  Ticket.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        subject = json['subject'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'subject': subject,
      };
}
