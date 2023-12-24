import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DSettingController extends GetxController {
  var _frpc_version = ''.obs;
  var frpc_version_widgets = <DropdownMenuItem>[].obs;
  var frpc_version_value = 0.obs;
  var github_proxy_url = ''.obs;
  var github_proxy_url_value = 0.obs;
  var github_proxy_widgets = <DropdownMenuItem>[].obs;

  load() async {
    //final List<String> versions = await FrpcManagerStorage.downloadedVersions;
    //final list = _buildDMIWidgetList(versions);
    //github_proxy_url.value = await FrpcManagerStorage.proxyUrl;
    //github_proxy_widgets.value = await FrpcManagerStorage.proxyUrl;
    /*frpc_version_widgets.value = //list;
        <DropdownMenuItem>[
      DropdownMenuItem(
        child: Text('0.51.3'),
        value: 0,
      ),
      DropdownMenuItem(
        child: Text('0.51.0'),
        value: 1,
      ),
      DropdownMenuItem(
        child: Text('0.48.1'),
        value: 2,
      ),
    ];

     */
  }

  //Future<FrpcList> _getList() async {
  //final ct = CancelToken();
  //await FrpcDownloadDio()(arch: 'amd64', platform: 'windows', progressCallback: () {}, cancelToken: ct);
  //}

  /// 构建选项列表
  List<DropdownMenuItem> _buildDMIWidgetList(List<String> versions) {
    final List<DropdownMenuItem> dmil = <DropdownMenuItem>[];
    for (var i = 0; i > versions.length - 1; i++) {
      dmil.add(_buildDMIWidget(version: versions[i], value: i));
    }
    return dmil;
  }

  /// 构建选项
  DropdownMenuItem _buildDMIWidget(
      {required String version, required int value}) {
    return DropdownMenuItem(
      child: Text(version),
      value: value,
    );
  }
}
