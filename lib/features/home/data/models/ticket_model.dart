class TicketModel {
  late int id;
  late String title;
  late String description;
  late int category_id;
  late int user_id;
  late String status;
  late String created_at;
  late String updated_at;

  TicketModel(
    this.id,
    this.title,
    this.description,
    this.category_id,
    this.user_id,
    this.status,
  );

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      json['id'],
      json['title'],
      json['description'],
      json['category_id'],
      json['user_id'],
      json['status'],
    );
  }
}
