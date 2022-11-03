import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> signWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final userCred = await _auth.signInWithCredential(credential);

  final User? user = userCred.user;

  assert(!user!.isAnonymous);
  assert(await user!.getIdToken() != null);

  final User? currentUser = await _auth.currentUser;
  assert(currentUser!.uid == user!.uid);
  print(user);
  await createNewUser(
    user!.displayName.toString(),
    user.email.toString(),
  );
}

Future<String> signOut() async {
  await googleSignIn.signOut();
  await _auth.signOut();
  //await LocalDB.saveUserID('null');
  return 'Successfully logged out';
}

createNewUser(String name, String email) async {
  final User? current_user = _auth.currentUser;

  try {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(current_user!.uid)
        .set({
      'name': name,
      'email': email,
    }).then((value) {
      print('User Registered Successfully');
    });
  } on Exception catch (error) {
    print(error);
  }
}
