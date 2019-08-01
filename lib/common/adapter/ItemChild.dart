import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_explore_shop/common/bean/PoiBean.dart';
import 'package:flutter_explore_shop/common/page/PoiDetail.dart';

Widget getPoiItem(BuildContext context, PoiBean bean, int index) {
  return InkWell(
      onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return PoiDetail(bean);
            }))
          },
      child: Column(
        children: <Widget>[
          Container(
              child: Row(
            children: <Widget>[
              Container(
                child: ExtendedImage.network(
                  ((null == bean.poiCover) ? "" : bean.poiCover),
                  width: 90,
                  height: 90,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  cache: true,
                  // ignore: missing_return
                  loadStateChanged: (ExtendedImageState state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                        return Image.asset("images/moren.png",
                            fit: BoxFit.fill);
                        break;
                      case LoadState.completed:
                        return FadeTransition(
                            child: ExtendedRawImage(
                                image: state.extendedImageInfo?.image,
                                width: 80,
                                height: 80));
                        break;
                      case LoadState.failed:
                        return Image.asset("images/moren.png",
                            fit: BoxFit.fill);
                        break;
                    }
                  },
                ),
                width: 90,
                height: 90,
                margin:
                    EdgeInsets.only(left: 10, top: 0.0, right: 10, bottom: 0.0),
                alignment: Alignment.topCenter,
              ),
              //可以解决text不换行的问题
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bean.poiName,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      "营业时间：" + bean.poiBusinessHours,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                        "地址：" +
                            ((null == bean.poiMapLocation)
                                ? ""
                                : bean.poiMapLocation),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        softWrap: true,
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              )
            ],
          )),
          //分割线
          Divider(
            color: Colors.cyan,
          )
        ],
      ));
}
