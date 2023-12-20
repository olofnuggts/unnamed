import 'package:uuid/uuid.dart';

class User {
  final String uid;
  final String email;
  final String userName;
  final String photoUrl;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final int age;
  // The password field is removed

  User({
    required this.email,
    required this.userName,
    required this.photoUrl,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.age,
  }) : uid = Uuid().v4();

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      userName: json['userName'],
      photoUrl: json['photoUrl'],
      phoneNumber: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'User{uid: $uid, email: $email, userName: $userName, photoUrl: $photoUrl, phoneNumber: $phoneNumber, firstName: $firstName, lastName: $lastName, age: $age}';
  }

  @override
  int get hashCode =>
      uid.hashCode ^
      email.hashCode ^
      userName.hashCode ^
      photoUrl.hashCode ^
      phoneNumber.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      age.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          email == other.email &&
          userName == other.userName &&
          photoUrl == other.photoUrl &&
          phoneNumber == other.phoneNumber &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          age == other.age;
}
