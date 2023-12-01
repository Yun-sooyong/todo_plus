import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Google sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    try {
      if (gUser != null) {
        // obtain auth details from request
        final GoogleSignInAuthentication gAuth = await gUser.authentication;

        // create a new credential for user
        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        // finally, lets sign in
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      // 로그인 취소 시 앱 정지
      //return null;
    } on FirebaseAuthException catch (error) {
      String? errorCode;
      switch (error.code) {
        case 'email-already-exists':
          errorCode = error.code;
          break;
        case 'id-token-revoked':
          errorCode = error.code;
          break;
        case 'internal-error':
          errorCode = error.code;
          break;
        default:
          errorCode = null;
      }
      if (errorCode != null) {
        Fluttertoast.showToast(msg: errorCode, toastLength: Toast.LENGTH_SHORT);
      }
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
