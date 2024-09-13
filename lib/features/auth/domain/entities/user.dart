import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String ? phoneNum;
  final String ? userName;
  final String ? password;
const UserEntity({
  this.phoneNum, this.userName, this.password,
});

  @override
  // TODO: implement props
  List<Object?> get props  {
    return[
    phoneNum,
    userName,
    password,
    ];
  }

}