class Specialty{
  String id;
  String name;
  // String icon;

  Specialty({
    required this.id,
    required this.name,
    // required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      // 'icon': this.icon,
    };
  }

  factory Specialty.fromMap(Map<String, dynamic> map) {
    return Specialty(
      id: map['id'] as String,
      name: map['name'] as String,
      // icon: map['icon'] as String,
    );
  }
}