class WangkResponse {
  int status;
  String message;
  dynamic data;
  int totalPages;


  WangkResponse({this.status, this.message, this.data});

  WangkResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    totalPages = json['totalPages'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = new Map<String, dynamic>();
    dataMap['status'] = this.status;
    dataMap['message'] = this.message;
    dataMap['totalPages'] = this.totalPages;
    dataMap['data'] = this.data;
    return dataMap;
  }
}
