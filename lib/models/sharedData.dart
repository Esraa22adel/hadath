class ShardData{
  String title;
  String fieldcontent;
  String fieldimage;
  String fieldjob;
  String nid;
  ShardData({this.title,
      this.fieldcontent,
      this.fieldimage,
      this.fieldjob,
      this.nid});
      factory ShardData.fromJson(Map<String, dynamic> json) => ShardData(
      title: json['title'],
      fieldcontent: json['field_content'],
      fieldimage: json['field_image'],
      fieldjob: json['field_job'],
      nid: json['nid']);
  Map<String, dynamic> toJson() => {
        'title': title,
        'field_content': fieldcontent,
        'field_image': fieldimage,
        'field_job': fieldjob,
        'nid': nid
      };

}