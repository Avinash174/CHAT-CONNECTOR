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
  late final String image;
  late final String name;
  late final String about;
  late final String createdAt;
  late final bool isOnline;
  late final String id;
  late final String lastActive;
  late final String email;
  late final String pushToken;

  chatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    about = json['json'] ?? '';
    createdAt = json['createdAt'] ?? '';
    id = json['id'] ?? '';
    lastActive = json['lastActive'] ?? '';
    email = json['email'] ?? '';
    isOnline = json['isOnline'] ?? '';
    pushToken = json['pushToken'] ?? '';
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['name'] = name;
    _data['id'] = id;
    _data['about'] = about;
    _data['lastActive'] = lastActive;
    _data['isOnline'] = isOnline;
    _data['createdAt'] = createdAt;
    _data['email'] = email;
    _data['pushToken'] = pushToken;

    return _data;
  }
}
