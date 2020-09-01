import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String gender;
  final String dateOfBirth;
  final String avatar;

  const User({this.id, this.fullName, this.email, this.password ,this.phone,
    this.address, this.gender, this.dateOfBirth, this.avatar});

  @override
  List<Object> get props =>
      [fullName, email, phone, password, address, gender, dateOfBirth, avatar];

  static User convertJson(dynamic json) {
    final data = json['data'];
    return User(
      id: data['id'],
      fullName: data['full_name'],
      email: data['email'],
      phone: data['phone'],
      address: data['address'],
      gender: data['gender'],
      dateOfBirth: data['date_of_birth'],
      avatar: data['avatar']
    );
  }
}
