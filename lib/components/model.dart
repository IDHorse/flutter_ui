
class LabelBean {
  String label;
  dynamic value;
  LabelBean.fromJson(Map<String, dynamic> json){
    this.label = json["label"];
    this.value = json["value"];
  }
}