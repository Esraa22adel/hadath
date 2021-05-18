class ResModel {
  String name;
  String pass;
  String mail;
  String field_first_name;
  String field_middle_name;
  String field_last_name;
  bool field_accept_terms;
  String field_region;
  String field_email_verification_code;
  String field_mobile;
  ResModel(
      {this.name,
      this.pass,
      this.mail,
      this.field_first_name,
      this.field_middle_name,
      this.field_last_name,
      this.field_accept_terms,
      this.field_region,
      this.field_email_verification_code,
      this.field_mobile});
      factory ResModel.fromJson(Map<String, dynamic> data) =>
      ResModel(
        name: data['name'],
        pass:data['pass'],
        mail:data['mail'],
        field_first_name:data['field_first_name'], 
        field_middle_name:data['field_middle_name'],
        field_last_name:data['field_last_name'],
        field_accept_terms:data['field_accept_terms'],
        field_region:data['field_region'],
        field_email_verification_code:data['field_email_verification_code'],
        field_mobile:data['field_mobile']

         );

  Map<String, dynamic> toJson() => {
        "name": name,
        "pass":pass,
        "mail":mail,
        "field_first_name":field_first_name,
        "field_middle_name":field_middle_name,
        "field_last_name":field_last_name,
        "field_accept_terms":field_accept_terms,
        "field_region":field_region,
        "field_email_verification_code":field_email_verification_code,
        " field_mobile": field_mobile
    
      };
}

