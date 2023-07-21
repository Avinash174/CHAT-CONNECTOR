class chatUser {
  chatUser({
    required this.image,
    required this.name,
    required this.about,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.email,
    required this.pushToken,
  });
  late String image;
  late String name;
  late String about;
  late String createdAt;
  late bool isOnline;
  late String id;
  late String lastActive;
  late String email;
  late String pushToken;

  chatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    about = json['about'] ?? '';
    createdAt = json['createdAt'] ?? '';
    id = json['id'] ?? '';
    lastActive = json['lastActive'] ?? '';
    email = json['email'] ?? '';
    isOnline = json['isOnline'] ?? '';
    pushToken = json['pushToken'] ?? '';
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['id'] = id;
    data['about'] = about;
    data['lastActive'] = lastActive;
    data['isOnline'] = isOnline;
    data['createdAt'] = createdAt;
    data['email'] = email;
    data['pushToken'] = pushToken;

    return data;
  }
}
