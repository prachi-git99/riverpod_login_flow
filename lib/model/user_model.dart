class UserModel {
  late final String id;
  late final String email;
  late final String name;

  UserModel({required this.id, required this.email, required this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
  }



  String getInitials(UserModel userModel) {
    String? name = userModel.name;
    var initial = name.split(" ");
    for (int i = 0; i < initial.length; i++) {
      initial[i] = initial[i][0];
    }
    if (initial.length > 2) {
      initial = initial.sublist(0, 2);
    }
    name = initial.join("");
    return name;
  }
}
