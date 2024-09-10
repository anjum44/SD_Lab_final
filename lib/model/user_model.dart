class UserModel {
  String? name;
  String? id;
  String? phone;
  String? Email;
  String? guardianEmail;
  String? type;
  String? profilePic;

  UserModel(
      {this.name,
        this.Email,
        this.id,
        this.guardianEmail,
        this.phone,
        this.profilePic,
        this.type});

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'id': id,
    'Email': Email,
    'guardiantEmail': guardianEmail,
    'type': type,
    'profilePic': profilePic
  };
}
