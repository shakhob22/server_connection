class Post {
  int? id;
  String? employee_name;
  String? employee_salary;
  int? employee_age;
  String? profile_image;

  Post({this.id, this.employee_name, this.employee_salary, this.employee_age, this.profile_image});

  Post.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.employee_name = json["employee_name"];
    this.employee_salary = json["employee_salary"];
    this.employee_age = json["employee_age"];
    this.profile_image = json["profile_image"];
  }

  Map<String, dynamic> toJson() => {
    "id": id, "employee_name": employee_name,
    "employee_salary": employee_salary,
    "employee_age": employee_age,
    "profile_image": profile_image
  };

}