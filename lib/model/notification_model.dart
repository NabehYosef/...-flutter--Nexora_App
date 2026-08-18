class NotificationModel {
  String? id;
  String? title;
  String? message;
  String? type;
  String? createdAt;
  bool isRead;
  String? orderId;

  NotificationModel({
    this.id,
    this.title,
    this.message,
    this.type,
    this.createdAt,
    this.isRead = false,
    this.orderId,
  });
}
