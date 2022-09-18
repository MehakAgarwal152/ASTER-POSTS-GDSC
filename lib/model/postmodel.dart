class Postmodel {
  final int id;
  final int userId;
  final String title;
  final String body;
  Postmodel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  static Postmodel fromMap(Map<dynamic, dynamic> map) => Postmodel(
        id: map['id'] as int,
        userId: map['userId'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}