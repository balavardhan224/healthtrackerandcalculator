class DoctorModel {
  String? uid;
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile1;
  String? mobile2;
  String? city;
  String? profilepic;
  String? salary;
  String? profession;
  String? experince;
  String? rating;

  DoctorModel({
    this.uid,
    this.email,
    this.firstname,
    this.lastname,
    this.mobile1,
    this.mobile2,
    this.username,
    this.city,
    this.profilepic,
    this.salary,
    this.profession,
    this.experince,
    this.rating,
  });
//recive data to firestore
  factory DoctorModel.fromMap(map) {
    return DoctorModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      mobile1: map['mobile1'],
      mobile2: map['mobile2'],
      city: map['city'],
      profilepic: map['profilepic'],
      salary: map['salary'],
      profession: map['profession'],
      experince: map['experince'],
      rating: map['rating'],
    );
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
      //feesperpatient
      'salary': salary,
      'profession': profession,
      'experince': experince,
      'rating': rating,
    };
  }
}


//'${firstname.toString().substring(0, 2)}${lastname.toString().substring(lastname!.length - 1)}${uid.toString().substring(uid!.length - 3)}',