import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseAuth firebaseAuth, 
    GoogleSignIn googleSignIn,
    FirebaseFirestore firebaseFirestore
  })
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    print("Hola existo aqui");
    isRegistered(currentUser);

    return currentUser != null;
  }

  Future<void> isRegistered(User currentUser) async{
    if(currentUser != null){
      final CollectionReference mtRef = _firebaseFirestore.collection('music_taste');

      Object taste = await mtRef.doc(currentUser.uid).get().then((value) => value.data());
      if(taste == null){
        await addUser(currentUser,mtRef);
        await addRecord(currentUser);
      }
    }
  }

  Future<void> addRecord(currentUser){
    final CollectionReference recordRef = _firebaseFirestore.collection('record');

    return recordRef.doc(currentUser.uid).set({
      currentUser.displayName   :   150
    });
  }

  Future<void> addUser(User currentUser, CollectionReference mtRef){
    return mtRef.doc(currentUser.uid).set({
      'Country'     :   false,
      'Pop'         :   false,
      'Rock'        :   false,
      'Metal'       :   false,
      'Alternative' :   false,
      'Indie'       :   false,
      'Rap'         :   false,
      'Electronic'  :   false,
      'Blues'       :   false,
      'Balad'       :   false
    });
  }

  Future<User> getUser() async {
    return _firebaseAuth.currentUser;
  }
}
