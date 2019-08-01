class PoiBean {
  String poiId;
  String poiName;
  String poiLat;
  String poiLng;
  String poiLatlngHash;
  String poiCover;
  String poiStatus;
  String poiAddress;
  String poiMapLocation;
  String poiCreateBy;
  String poiCreateAt;
  String poiAvgPrice;
  String poiAuditTip;
  String poiAuditTime;
  int poiBrowseNum;
  int poiCommentNum;
  int poiFavNum;
  int poiSignNum;
  String poiPark;
  String poiBus;
  String poiDescribe;
  String poiGrade;
  String poiBusinessHours;
  String isDel;
  String distance;
  String publish;
  bool fav;
  bool attatPoi;
  bool attatPeo;
  bool sign;

  PoiBean(
      {this.poiId,
      this.poiName,
      this.poiLat,
      this.poiLng,
      this.poiLatlngHash,
      this.poiCover,
      this.poiStatus,
      this.poiAddress,
      this.poiMapLocation,
      this.poiCreateBy,
      this.poiCreateAt,
      this.poiAvgPrice,
      this.poiAuditTip,
      this.poiAuditTime,
      this.poiBrowseNum,
      this.poiCommentNum,
      this.poiFavNum,
      this.poiSignNum,
      this.poiPark,
      this.poiBus,
      this.poiDescribe,
      this.poiGrade,
      this.poiBusinessHours,
      this.isDel,
      this.distance,
      this.publish,
      this.fav,
      this.attatPoi,
      this.attatPeo,
      this.sign});

  PoiBean.fromJson(Map<String, dynamic> json) {
    poiId = json['poiId'];
    poiName = json['poiName'];
    poiLat = json['poiLat'];
    poiLng = json['poiLng'];
    poiLatlngHash = json['poiLatlngHash'];
    poiCover = json['poiCover'];
    poiStatus = json['poiStatus'];
    poiAddress = json['poiAddress'];
    poiMapLocation = json['poiMapLocation'];
    poiCreateBy = json['poiCreateBy'];
    poiCreateAt = json['poiCreateAt'];
    poiAvgPrice = json['poiAvgPrice'];
    poiAuditTip = json['poiAuditTip'];
    poiAuditTime = json['poiAuditTime'];
    poiBrowseNum = json['poiBrowseNum'];
    poiCommentNum = json['poiCommentNum'];
    poiFavNum = json['poiFavNum'];
    poiSignNum = json['poiSignNum'];
    poiPark = json['poiPark'];
    poiBus = json['poiBus'];
    poiDescribe = json['poiDescribe'];
    poiGrade = json['poiGrade'];
    poiBusinessHours = json['poiBusinessHours'];
    isDel = json['isDel'];
    distance = json['distance'];
    publish = json['publish'];
    fav = json['fav'];
    attatPoi = json['attatPoi'];
    attatPeo = json['attatPeo'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poiId'] = this.poiId;
    data['poiName'] = this.poiName;
    data['poiLat'] = this.poiLat;
    data['poiLng'] = this.poiLng;
    data['poiLatlngHash'] = this.poiLatlngHash;
    data['poiCover'] = this.poiCover;
    data['poiStatus'] = this.poiStatus;
    data['poiAddress'] = this.poiAddress;
    data['poiMapLocation'] = this.poiMapLocation;
    data['poiCreateBy'] = this.poiCreateBy;
    data['poiCreateAt'] = this.poiCreateAt;
    data['poiAvgPrice'] = this.poiAvgPrice;
    data['poiAuditTip'] = this.poiAuditTip;
    data['poiAuditTime'] = this.poiAuditTime;
    data['poiBrowseNum'] = this.poiBrowseNum;
    data['poiCommentNum'] = this.poiCommentNum;
    data['poiFavNum'] = this.poiFavNum;
    data['poiSignNum'] = this.poiSignNum;
    data['poiPark'] = this.poiPark;
    data['poiBus'] = this.poiBus;
    data['poiDescribe'] = this.poiDescribe;
    data['poiGrade'] = this.poiGrade;
    data['poiBusinessHours'] = this.poiBusinessHours;
    data['isDel'] = this.isDel;
    data['distance'] = this.distance;
    data['publish'] = this.publish;
    data['fav'] = this.fav;
    data['attatPoi'] = this.attatPoi;
    data['attatPeo'] = this.attatPeo;
    data['sign'] = this.sign;
    return data;
  }
}
