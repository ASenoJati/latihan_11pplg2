import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:latihan_11pplg2/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var username = "".obs;
  var email = "".obs;
  var photoUrl = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUserData();
  }

  Future<void> logout() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();
      await _auth.signOut();
      await _googleSignIn.signOut();

      Get.offAllNamed(AppRoutes.loginPage);

      Get.snackbar("Logout", "Berhasil keluar dari akun");
    } catch (e) {
      Get.snackbar("Error", "Gagal logout: $e");
    }
  }

  void loadUserData() {
    final user = _auth.currentUser;
    if (user != null) {
      username.value = user.displayName ?? "Pengguna";
      email.value = user.email ?? "-";
      photoUrl.value = user.photoURL ?? "";
    } else {
      username.value = "Tidak ada pengguna";
      email.value = "-";
      photoUrl.value = "";
    }
  }
}
