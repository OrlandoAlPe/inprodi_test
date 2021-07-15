class Data {
  final String name;
  final String email;
  Data({required this.email, required this.name});

  factory Data.fromJson(Map<String, dynamic> json) {
    return new Data(
      name: json['name'],
      email: json['email'],
    );
  }
}