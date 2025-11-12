import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_11pplg2/model/LoginModel.dart';
import 'package:latihan_11pplg2/routes/AppConstant.dart';
import 'package:latihan_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAPIController extends GetxController {
  var isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var isLoggedIn = false.obs;

  Future<void> login(String username, String password) async {
    try {
      isLoading.value = true;

      var url = Uri.parse("${AppConstant.baseUrl}/latihan/login");
      var response = await http.post(
        url,
        body: {'username': username, 'password': password},
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == true) {
        LoginModel model = LoginModel.fromJson(data);

        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("token", model.token);

        Get.snackbar("Success", "Sukses Login");
        Get.offAllNamed("/main_page");
      } else {
        Get.snackbar("Error", data["message"] ?? "Login gagal");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      isLoading.value = true;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user != null) {
        String username = user.displayName ?? "User";
        String email = user.email ?? "-";
        String photoUrl = user.photoURL ?? "";

        Get.snackbar("Success", "Welcome, $username!");

        isLoggedIn.value = true;

        Get.offAllNamed(AppRoutes.mainPage);
      }
    } catch (e) {
      Get.snackbar("Error", "Login Google gagal: $e");
      print("Error login Google: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
