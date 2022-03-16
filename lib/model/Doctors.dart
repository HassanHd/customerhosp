class Doctors{
String wp_user_id;
String admin_moderation;
String gender;
String company_name;
String mobile;
String email;
String bio;
String tagline;
String category_id;
String address;
String rating;
String favorite;
String img;
String category_name;
String full_name;
String profile_link;

Doctors({
    required this.wp_user_id,
    required this.admin_moderation,
    required this.gender,
    required this.company_name,
    required this.mobile,
    required this.email,
    required this.bio,
    required this.tagline,
    required this.category_id,
    required this.address,
    required this.rating,
    required this.favorite,
    required this.img,
    required this.category_name,
    required this.full_name,
    required this.profile_link,
  });

Map<String, dynamic> toMap() {
    return {
      'wp_user_id': this.wp_user_id,
      'admin_moderation': this.admin_moderation,
      'gender': this.gender,
      'company_name': this.company_name,
      'mobile': this.mobile,
      'email': this.email,
      'bio': this.bio,
      'tagline': this.tagline,
      'category_id': this.category_id,
      'address': this.address,
      'rating': this.rating,
      'favorite': this.favorite,
      'img': this.img,
      'category_name': this.category_name,
      'full_name': this.full_name,
      'profile_link': this.profile_link,
    };
  }

  factory Doctors.fromMap(Map<String, dynamic> map) {
    return Doctors(
      wp_user_id: map['wp_user_id'] as String,
      admin_moderation: map['admin_moderation'] as String,
      gender: map['gender'] as String,
      company_name: map['company_name'] as String,
      mobile: map['mobile'] as String,
      email: map['email'] as String,
      bio: map['bio'] as String,
      tagline: map['tagline'] as String,
      category_id: map['category_id'] as String,
      address: map['address'] as String,
      rating: map['rating'] as String,
      favorite: map['favorite'] as String,
      img: map['img'] as String,
      category_name: map['category_name'] as String,
      full_name: map['full_name'] as String,
      profile_link: map['profile_link'] as String,
    );
  }
}