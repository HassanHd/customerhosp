class Chats{
  String? Receiver_name;
  String? Receiver_id;
  String? id;
  String? chatId;
  String? image;
  String? last_datetime;
  String? total_count;
  String? unread_count;
  String? messageTime;

  Chats({
    this.Receiver_name,
    this.Receiver_id,
    this.id,
    this.chatId,
    this.image,
    this.last_datetime,
    this.total_count,
    this.unread_count,
    this.messageTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'Receiver_name': this.Receiver_name,
      'Receiver_id': this.Receiver_id,
      'id': this.id,
      'chatId': this.chatId,
      'image': this.image,
      'last_datetime': this.last_datetime,
      'total_count': this.total_count,
      'unread_count': this.unread_count,
      'messageTime': this.messageTime,
    };
  }

  factory Chats.fromMap(Map<String, dynamic> map) {
    return Chats(
      Receiver_name: map['Receiver_name'] as String,
      Receiver_id: map['Receiver_id'] as String,
      id: map['id'] as String,
      chatId: map['chatId'] as String,
      image: map['image'] as String,
      last_datetime: map['last_datetime'] as String,
      total_count: map['total_count'] as String,
      unread_count: map['unread_count'] as String,
      messageTime: map['last_message']['messageTime'] as String,
    );
  }
}