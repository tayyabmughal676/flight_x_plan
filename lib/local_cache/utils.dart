import 'package:shared_preferences/shared_preferences.dart';
import '../res/strings.dart';

class PreferenceUtils {
  static String? userImage;
  var time = DateTime;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    if (PreferenceUtils._prefsInstance != null) {
      return _prefsInstance?.getString(key) ?? defValue ?? "";
    }
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;

    return prefs.setString(key, value); //?? Future.value(null);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value); //?? Future.value(null);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value); //?? Future.value(null);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  static Future setUploadImage(uploadProfilePictureResponse) async {
    PreferenceUtils.setString(
        Strings.filePath, uploadProfilePictureResponse.data!.message!);
  }

  static Future setUserImage(image) async {
    await PreferenceUtils.setString(Strings.userImageKey, image ?? "");
  }

  static String? getUserImage() {
    userImage = PreferenceUtils.getString(Strings.userImageKey)!;
    return userImage;
  }

  static Future setLoginResponse(loginResponse) async {
    await PreferenceUtils.setString(
        Strings.loginUserToken, loginResponse.data?.token?.token ?? "");
    await PreferenceUtils.setString(
        Strings.loginUserId, loginResponse.data?.user?.id ?? "");
    await PreferenceUtils.setUserImage(
        loginResponse.data?.user?.profilePicture);
    await PreferenceUtils.setString(
        Strings.loginFullName, loginResponse.data?.user?.fullName ?? "");
    await PreferenceUtils.setString(
        Strings.loginEmail, loginResponse.data?.user?.email ?? "");
    await PreferenceUtils.setString(
        Strings.loginPassword, loginResponse.data?.user?.password ?? "");
    await PreferenceUtils.setString(
        Strings.loginPhoneNo, loginResponse.data?.user?.phoneNumber ?? "");
  }

  static Future setEditProfileResponse(editProfileResponse) async {
    await PreferenceUtils.setString(
        Strings.loginUserId, editProfileResponse.data?.id ?? "");
    await PreferenceUtils.setString(
        Strings.loginFirstName, editProfileResponse.data?.firstName ?? "");
    await PreferenceUtils.setString(
        Strings.loginLastName, editProfileResponse.data?.lastName ?? "");
    await PreferenceUtils.setString(
        Strings.loginEmail, editProfileResponse.data?.email ?? "");
    await PreferenceUtils.setString(
        Strings.loginPassword, editProfileResponse.data?.password ?? "");
    await PreferenceUtils.setString(
        Strings.loginPhoneNo, editProfileResponse.data?.phoneNumber ?? "");
  }

  static clearPreferences() {
    _prefsInstance?.clear();
  }
}
