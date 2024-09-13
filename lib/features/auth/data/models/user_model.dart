/* class UserModel {
  final String fullname;
  final String phone;
  final List<String> privileges;
  UserModel({
    required this.fullname,
    required this.phone,
    required this.privileges,
  });

  UserModel.init({this.fullname = 'Ahmed', this.phone = '0676075152'})
      : privileges = ['all'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullname,
      'phone': phone,
      'privileges': privileges,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullname: map['fullname'],
      phone: map['phone'],
      privileges: (map['privileges'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }

  @override
  String toString() =>
      'UserModel(fullName: $fullname, phone: $phone, privileges: $privileges)';
}
 */
class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] ?? '',  // Provide default values if data is missing
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }
}
