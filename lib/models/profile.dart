class Profile {
  String mail;
  String field_certified;
  String field_full_name;
  String field_mobile;
  String user_picture;
  String field_region;
  String uid;
  String certificate;
  Profile(
      {this.mail,
      this.field_certified,
      this.field_full_name,
      this.field_mobile,
      this.user_picture,
      this.field_region,
      this.uid,
      this.certificate});
  factory Profile.fromJson(Map<String, dynamic> user) => Profile(
        mail: user['mail'],
        field_certified: user['field_certified'],
        field_full_name: user['field_full_name'],
        field_mobile: user['field_mobile'],
        user_picture: user['user_picture'],
        field_region: user['field_region'],
        uid: user['uid'],
        certificate: user['certificate'],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail,
        "field_certified": field_certified,
        "field_full_name": field_full_name,
        "field_mobile": field_mobile,
        "user_picture": user_picture,
        "uid": uid,
        "certificate": certificate
      };
}
