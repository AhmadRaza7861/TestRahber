class UserModel {
  String? email;
  String? name;

  UserModel({this.email, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['UserName'] = this.name;
    return data;
  }
}