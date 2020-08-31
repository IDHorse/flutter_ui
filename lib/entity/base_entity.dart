class BaseEntity {
  var data;
  String status;
  String msg;
//  bool ok;
//  int timestamp;


//  data: []
//  msg: "ok"
//  status: "ok"
//  timestamp: 1597657364214
  BaseEntity.fromJson(Map<String, dynamic> json){
    data =  json['data'];
    status =  json['status'];
//    ok =  json['ok'];
//    timestamp =  json['timestamp'];
    msg =  json['msg'];
  }
}