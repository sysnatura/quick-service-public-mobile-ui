class UserModel {
  final int UserId;
  final String Email;
  final String Password;

  UserModel({
    this.UserId,
    this.Email,
    this.Password
  });

  Map<String, dynamic> toMap() {
    return {
      'UserId': UserId,
      'Email': Email,
      'Password': Password
    };
  }
  UserModel.fromMap(Map<String, dynamic> res)
      : UserId = res["UserId"],
        Email = res["Email"],
        Password = res['Password'];

  @override
  String toString() {
    return 'Remember{UserId: $UserId, Email: $Email, Password: $Password}';
  }
}