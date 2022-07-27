class Employee {
  final String? name;
  final int? age;

  const Employee({this.name, this.age});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      age: json['age'],
    );
  }
}
