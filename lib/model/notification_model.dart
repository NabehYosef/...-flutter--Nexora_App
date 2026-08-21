class NotificationModel {
  String? id;
  String? title;
  String? message;
  String? type;
  String? createdAt;
  bool isRead;
  String? orderId;
  Map<String, dynamic> data;

  NotificationModel({
    this.id,
    this.title,
    this.message,
    this.type,
    this.createdAt,
    this.isRead = false,
    this.orderId,
    this.data = const {},
  });

  factory NotificationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    Map<String, dynamic> payload = {};
    if (json['data'] is Map) {
      payload =
          Map<String, dynamic>.from(
            json['data'],
          );
    }

    return NotificationModel(
      id:
          json['_id']?.toString() ??
          json['id']?.toString(),
      title: json['title']?.toString(),
      message: json['message']
          ?.toString(),
      type: json['type']?.toString(),
      createdAt: _formatDate(
        json['createdAt'],
      ),
      isRead: json['isRead'] == true,
      orderId: payload['orderId']
          ?.toString(),
      data: payload,
    );
  }

  static String _formatDate(
    dynamic value,
  ) {
    if (value == null) return "";
    final parsed = DateTime.tryParse(
      value.toString(),
    );
    if (parsed == null)
      return value.toString();
    final local = parsed.toLocal();
    String two(int n) =>
        n.toString().padLeft(2, '0');
    return "${local.year}-${two(local.month)}-${two(local.day)} ${two(local.hour)}:${two(local.minute)}";
  }
}
