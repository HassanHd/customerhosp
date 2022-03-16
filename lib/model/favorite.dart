class favorite{
  String id;
  String avatar_id;
  String member_name;
  String email;
  String phone;
  String service_area;
  String regions;
  String services;
  String rating;
  String admin_wp_id;
  String is_admin;
  String image;

  favorite({
    required this.id,
    required this.avatar_id,
    required this.member_name,
    required this.email,
    required this.phone,
    required this.service_area,
    required this.regions,
    required this.services,
    required this.rating,
    required this.admin_wp_id,
    required this.is_admin,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'avatar_id': this.avatar_id,
      'member_name': this.member_name,
      'email': this.email,
      'phone': this.phone,
      'service_area': this.service_area,
      'regions': this.regions,
      'services': this.services,
      'rating': this.rating,
      'admin_wp_id': this.admin_wp_id,
      'is_admin': this.is_admin,
      'image': this.image,
    };
  }

  factory favorite.fromMap(Map<String, dynamic> map) {
    return favorite(
      id: map['id'] as String,
      avatar_id: map['avatar_id'] as String,
      member_name: map['member_name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      service_area: map['service_area'] as String,
      regions: map['regions'] as String,
      services: map['services'] as String,
      rating: map['rating'] as String,
      admin_wp_id: map['admin_wp_id'] as String,
      is_admin: map['is_admin'] as String,
      image: map['image'] as String,
    );
  }
}