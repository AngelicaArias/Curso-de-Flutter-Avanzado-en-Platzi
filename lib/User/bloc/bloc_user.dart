import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_repositor.dart';

class UserBloc extends Bloc{

 final _auth_repository =AuthRepository();
 //flujo de datos - Streams 
 // Stream - Firebase
 // StreamController 

 Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
 Stream<FirebaseUser> get authStatus => streamFirebase;

 //Casos de uso 
 //1. SignIn a la aplicacion Google
Future<FirebaseUser> singIn(){
return _auth_repository.singInFirebase();
}

// 2. registrar nuestro segundo caso de uso
final _cloudFirestoreRepository = CloudFirestoreRepository();
void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);


 signOut() {
   _auth_repository.signOut();

 }

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
  
}