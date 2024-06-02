import 'package:encrypt/encrypt.dart' as Encry;
import 'package:flutter/material.dart';
import 'package:shop_app/models/LoginRequest.dart';
import 'package:shop_app/models/LoginResponse.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_interface.dart';
import 'package:shop_app/service/core/base_api.dart';
import 'package:shop_app/service/core/base_toast.dart';
import 'package:shop_app/service/utils/constants.dart';
import 'package:shop_app/service/utils/share_prefer_utils.dart';

class LoginService implements ILoginInterface {

  @override
  login(LoginRequest request, BuildContext context, String auth) async {
    await SharePreferUtils.getUserName().then((value) async => {
      if (value != null) {
          if (value != request.username) {
            SharePreferUtils.logOutApp()
          } else {
              // check xem là user cũ hay mới là một máy hay máy khác để gửi request lên khác nhau
              await SharePreferUtils.getUserInfo().then((dataLocal) => {
                if (dataLocal != null) {
                    request.setAccessToken = dataLocal.accessToken
                  }
              })
            }
        } else {
          SharePreferUtils.logOutApp()
        }
    });
    var result = await BaseApi.getInstance()?.createPost(Constants.Y == auth ? UrlApi.API_AUTHENTICATION_FINGER : UrlApi.API_AUTHENTICATION,
        showLoading: true, body: Constants.Y == auth ? request.toMapFinger() : request.toMap(), context: context);
    verifyAuthentication(request, LoginResponse.fromJson(result), result, context);
  }

  void verifyAuthentication(LoginRequest request, LoginResponse result,
      Map<dynamic, dynamic> resultMap, BuildContext context) async {
    switch (int.parse(result.errorCode)) {
      case StatusApi.STATUS_200: // login to Home
        loginStep2VerifyToHome(result, resultMap, context, request.username??"", "", request.password??"");
        break;

      case StatusApi.STATUS_201: // login first time
        showInduction(result, context, request);
        break;

      case "FL999":
        break;

      default:
        Toast.showLongTop(result.errorDesc);
        break;
    }
  }

  void showInduction(LoginResponse data, BuildContext context, LoginRequest request) {
  }

  void loginStep2VerifyToHome(LoginResponse data, Map result, BuildContext context,
      String username, String deviceId, String pass) async {
    await SharePreferUtils.saveAccessToken(data.accessToken??"");
    result['userName'] = username;
    result['deviceId'] = deviceId;
    final key = Encry.Key.fromLength(32);
    final iv = Encry.IV.fromLength(16);
    final encryptedPass = Encry.Encrypter(Encry.AES(key)).encrypt(pass, iv: iv).base64;
    result['pass'] = encryptedPass;
    await SharePreferUtils.saveUserInfo(result);
    await SharePreferUtils.saveUsername(username);
    await SharePreferUtils.saveAvatar(data.avatar);
    await SharePreferUtils.saveUserInfoFinger(result, username);
    // set userInfo vào loginNotifier
    final userInfo = await SharePreferUtils.getUserInfo();
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  // Future<List<MenuModel>> innitGetMenu([LoginResponse data]) async {
  //   var dataMenuApi = '[    {     "moduleId": 50999,     "title": "menu.nopthue.title",     "icon": "0xe82a",     "contains": [{ "moduleId": "5099901",  "displayName": "menu.nopthue.nopthue",  "id": "50999",  "routerName": "/nopthue",  "icon": "0xe82a"},     {"moduleId": "5099902",  "displayName": "menu.nopthue.tracuuchungtu",  "id": "50999",  "routerName": "/tracuuchungtuLPTB",  "icon": "0xe838"}  ]   },     {     "moduleId": 51999,     "title": "menu.tracuunghiavuthue.title",     "icon": "0xe837",     "contains": [       {   "moduleId": "5199901",   "displayName": "menu.tracuunghiavuthue.sothuecanhan",  "id": "51999",  "routerName": "/tracuusothuecanhan",  "icon": "0xe827"},  {  "moduleId": "5199902",  "displayName": "menu.tracuunghiavuthue.sothuetruocbanhadat",  "id": "51999",   "routerName": "/tracuusothuetruocbanhadat",   "icon": "0xe826"},    {   "moduleId": "5199903",  "displayName": "menu.tracuunghiavuthue.sothuetruocbaotoxemay", "id": "51999",  "routerName": "/tracuusothuetruocbaotoxemay", "icon": "0xe825"}  ,{  "moduleId": "5199904",  "displayName": "menu.nopthue.tracuunganhangunt","id": "51999",  "routerName": "/tracuunganhangUNT",  "icon": "0xe825"}   ]   },    {     "moduleId": 52999,     "title": "menu.tracuuthongbaothue.title",     "icon": "0xe81d",     "contains": [  {  "moduleId": "5299901",  "displayName": "menu.tracuuthongbaothue.thongbao",  "id": "52999", "routerName": "/tracuuthongbaokhac",  "icon": "0xe821"}, {  "moduleId": "5299902","displayName": "menu.tracuuthongbaothue.thongbaoLPTB",  "id": "52999",  "routerName": "/tracuuthongbaoLPTB",   "icon": "0xe819"} ]   },    {     "moduleId": 53999,     "title": "menu.tracuuhosothue.title",      "icon": "0xe81e",     "contains": [{  "moduleId": "5399901",  "displayName": "menu.tracuuhosothue.hosokhaithue",      "id": "53999",  "routerName": "/tracuutokhai",  "icon": "0xe831"}, {  "moduleId": "5399902",    "displayName": "menu.tracuuhosothue.hosoquyettoanthue",  "id": "53999",  "routerName": "/tracuutokhaiquyettoanthue", "icon": "0xe830"}, {  "moduleId": "5399903",  "displayName": "menu.tracuuhosothue.tokhaiLPTB",    "id": "53999",  "routerName": "/tracuutokhaiLPTB",  "icon": "0xe83a"}, {  "moduleId": "5399904",     "displayName": "menu.tracuuhosothue.hosodangkythue",  "id": "53999",  "routerName": "/tracuutokhaidangkythue",     "icon": "0xe82b"}      ]   }, {     "moduleId": 61999,     "title": "tienich.title",     "icon": "0xe835",     "contains": [      {   "moduleId": "6199900",  "displayName": "tienich.banggiaLPTB",  "id": "61999","routerName": "/tracuubanggiaLPTB",  "icon": "0xe839"}, {  "moduleId": "6199901",      "displayName": "tienich.tracuuthongtinnnt",  "id": "61999",  "routerName": "/tracuuthongtinnnt",   "icon": "0xe820"}, {  "moduleId": "6199902",  "displayName": "tienich.diachicoquanthue",      "id": "61999",  "routerName": "/diachicoquanthue",  "icon": "0xe80a"},  {  "moduleId": "6199903",  "displayName": "tienich.danhsachmstruiro", "id": "61999",  "routerName": "/danhsachmstruiro",  "icon": "0xe80c"},     {  "moduleId": "6199904",  "displayName": "tienich.cauhoithuonggap",  "id": "61999",  "routerName": "/support",  "icon": "0xe809"}, {  "moduleId": "6199906",  "displayName": "tienich.huongdansudung",  "id": "61999",  "routerName": "/huongdansudung",  "icon": "0xe807"},   {  "moduleId": "6199907",  "displayName": "tienich.congcutinhthue",   "id": "61999",  "routerName": "/congcutinhthue",  "icon": "0xe810"}, {    "moduleId": "6199909",  "displayName": "tienich.chiase",  "id": "61999",      "routerName": "/",  "icon": "0xe80b"}, {  "moduleId": "6199910",     "displayName": "tienich.thongtinhotro",  "id": "61999",  "routerName": "/thongtinhotro",     "icon": "0xe806"}, {  "moduleId": "6199911",  "displayName": "tienich.phienban", "id": "61999",  "routerName": "/phienban",  "icon": "0xe80d"}, {  "moduleId": "6199912",  "displayName": "tienich.tracuunguoiphuthuoc",  "id": "61999",  "routerName": "/tracuunguoiphuthuoc",     "icon": "0xe81a"}     ]   },   {"moduleId": 62000,"title": "menu.support.title",   "icon": "0xe835","contains": [{ "moduleId": "6200001","displayName": "tienich.cauhoithuonggap","id": "62000","routerName": "/support",   "icon": "0xe809"}, {"moduleId": "6200002","displayName": "tienich.huongdansudung","id": "62000","routerName": "/huongdansudung","icon": "0xe807"},    {"moduleId": "6200003","displayName": "tienich.chiase","id": "62000","routerName": "/","icon": "0xe80b"},    {"moduleId": "6200004","displayName": "tienich.thongtinhotro","id": "62000","routerName": "/thongtinhotro","icon": "0xe806"},  {"moduleId": "6200005","displayName": "tienich.phienban","id": "62000","routerName": "/phienban","icon": "0xe80d"},     {  "moduleId": "6199908",  "displayName": "tienich.tintucthue",   "id": "61999",  "routerName": "/tintucthue",  "icon": "0xe808"},   {  "moduleId": "6199915",  "displayName": "tienich.tintuc_web",   "id": "62000",  "routerName": "/tintuc_web",  "icon": "0xe808"}]}, {      "moduleId": 10008,     "title": "menu.setting.title",     "icon": "0xe812",     "contains": [ {  "moduleId": "100082",  "displayName": "menu.setting.avatar",  "id": "10008",  "icon": "0xe802"},   {   "moduleId": "100084",  "displayName": "menu.setting.password",  "id": "10008",  "routerName": "/changePassword","icon": "0xe803"},{   "moduleId": "100087",  "displayName": "menu.setting.fingerprint", "routerName": "/fingerprint",  "id": "10008",  "icon": "0xe834"},{   "moduleId": "100088",  "displayName": "menu.setting.notification",  "id": "10008",  "routerName": "/registerNotification",      "icon": "0xe800"},{   "moduleId": "100089",  "displayName": "menu.setting.quick-menu",  "id": "10008",   "routerName": "/quickfunctions",  "icon": "0xe818"}     ]   } ]';
  //   final menuApi = Utils.convertStringToJson(dataMenuApi);
  //   var menuLocal;
  //   try {
  //     menuLocal = await ApiDio.loadAsset('assets/json/menu/menu.json');
  //   } catch (e) {
  //     Toast.showLongTop(e.message);
  //   }
  //
  //   final menuResponse = [];
  //   final containsMenuApi = [];
  //   var containsMenu = [];
  //   menuApi.forEach((value) {
  //     value['contains'].forEach((contains) => containsMenuApi.add(contains));
  //   });
  //
  //   // đầu tiền phải add nhưng chức năng tự tạo
  //   menuLocal.forEach((value) {
  //     if (value['moduleId'] == Constants.MODULE_ID_HOME ||
  //         value['moduleId'] == Constants.MODULE_ID_GENERAL ||
  //         value['moduleId'] == Constants.MODULE_ID_SETTING ||
  //         value['moduleId'] == Constants.MODULE_ID_LOGOUT) {
  //       menuResponse.add(value);
  //     } else {
  //       containsMenu = [];
  //       value['contains'].forEach((value2) {
  //         bool exists = containsMenuApi.any((e) => e['moduleId'] == value2['moduleId']);
  //         if (exists) {
  //           containsMenu.add(value2);
  //         }
  //       });
  //
  //       if (containsMenu.isNotEmpty) {
  //         value['contains'] = containsMenu;
  //         menuResponse.add(value);
  //       }
  //     }
  //   });
  //   final responses = menuResponse.map((j) => MenuModel.fromMap(j)).toList();
  //   return responses;
  // }
  //
  // // hàm sử lý đăng nhập vân tay
  // void authenticateFingerPrintIOS(LoginRequest request, BuildContext context) async {
  //   PlatformHelper.authenticateWithFingerPrint(true);
  //   MethodChannel methodChannel =
  //   MethodChannel("com.seatech.core_project.fingerprint_channel");
  //   methodChannel.setMethodCallHandler((call) async {
  //     if (call.method == "com.seatech.core_project.auth_result") {
  //       if (call.arguments is int) {
  //         int state = call.arguments as int;
  //         print("IOS state fringerprint: $state");
  //         switch (state) {
  //           case -5:
  //             //userCancel
  //             print("-5");
  //             break;
  //           case -4:
  //             // systemCancel touch id
  //             print("-4");
  //             break;
  //           case -3:
  //             //touchIDNotAvailable
  //             print("Vui lòng bật xác thực vân tay hoặc xác thực khuôn mặt trên thiết bị để có thể sử dụng tính năng này.");
  //             break;
  //           case -2:
  //             //Nếu người dùng chưa cài đặt vân tay cho ứng dụng
  //             print("Vui lòng cài đặt vân tay cho thiết bị để sử dụng tính năng này.");
  //             break;
  //           case -1:
  //             //Có lỗi ngoài ý muốn
  //             print("Vui lòng cài đặt khóa màn hình cho thiết bị để sử dụng tính năng này.");
  //           case 0:
  //             //Xác thực thất bại do sai vân tay
  //             print("Xác thực thất bại vui lòng thử lại.");
  //           case 1:
  //             //Xác thực thành công
  //             print("Xác thực thành công.");
  //             login(request, context, "");
  //             break;
  //           case 2:
  //             //TouchIdLockout
  //             print("Xác thực thất bại quá 5 lần. Vui lòng sử dụng tài khoản và mật khẩu để đăng nhập.");
  //           case 4:
  //             //touchIDNotAvailable
  //             print("Dữ liệu vân tay được cập nhật. Vui lòng đăng nhập lại với Tài khoản và Mật khẩu.");
  //             break;
  //         }
  //       }
  //     }
  //   });
  // }
}
