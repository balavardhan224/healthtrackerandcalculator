class UserModel {
  String? uid;
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile1;
  String? mobile2;
  String? city;
  String? profilepic;

  UserModel({
    this.uid,
    this.email,
    this.firstname,
    this.lastname,
    this.mobile1,
    this.mobile2,
    this.username,
    this.city,
    this.profilepic,
  });
//recive data to firestore
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        username: map['username'],
        email: map['email'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        mobile1: map['mobile1'],
        mobile2: map['mobile2'],
        city: map['city'],
        profilepic: map['profilepic']);
  }
//send data to firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'city': city,
      'profilepic': profilepic,
    };
  }
}
