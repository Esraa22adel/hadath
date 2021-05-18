class Event {
  String title;
  String attachments;
  String content;
  String enddate;
  // String geoloc;
  String image;
  String location;
  String startdate;
  String nid;
  String joinzoom;
  String startzoom;
  Event(
      {this.title,
      this.attachments,
      this.content,
      this.enddate,
      // this.geoloc,
      this.image,
      this.location,
      this.startdate,
      this.nid,
      this.joinzoom,
      this.startzoom});
  factory Event.fromJson(Map<String, dynamic> json) => Event(
        title: json['title'],
        attachments: json['field_attachments'],
        content: json['field_content'],
        enddate: json['field_end_date'],
        // geoloc: json['field_geoloc'],
        image: json['field_image'],
        location: json['field_location'],
        startdate: json['field_start_date'],
        nid: json['nid'],
        joinzoom: json['join_zoom'],
        startzoom: json['start_zoom'],
      );

  Map<String, dynamic> toJson() => {
    'title':title,
    'field_attachments':attachments,
    'field_content':content,
    'field_end_date':enddate,
    // 'field_geoloc':geoloc,
    'field_image':image,
    'field_location':location,
    'field_start_date':startdate,
  };
}
