class Session {
  String title;
  String attachments;
  String content;
  String enddate;
  String image;
  String location;
  String startdate;
  String nid;
  String joinzoom;
  String startzoom;
  Session(
      {this.title,
      this.attachments,
      this.content,
      this.enddate,
      this.image,
      this.location,
      this.startdate,
      this.nid,
      this.joinzoom,
      this.startzoom});
  factory Session.fromJson(Map<String, dynamic> session) => Session(
        title: session['title'],
        attachments: session['field_attachments'],
        content: session['field_content'],
        enddate: session['field_end_date'],
        image: session['field_image'],
        location: session['field_location'],
        startdate: session['field_start_date'],
        nid: session['nid'],
        joinzoom: session['join_zoom'],
        startzoom: session['start_zoom'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'field_attachments': attachments,
        'field_content': content,
        'field_end_date': enddate,
        'field_image': image,
        'field_location': location,
        'field_start_date': startdate,
        'nid': nid,
        'join_zoom': joinzoom,
        'start_zoom': startzoom
      };
}
