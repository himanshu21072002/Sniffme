class UserModel {
  String uid;
  String email;
  String name;
  int coins;

  UserModel({this.uid, this.email, this.name,this.coins});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      coins: map['coins'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': name,
      'coins': coins,
    };
  }
}