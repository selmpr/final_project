import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_reed/feature/auth/manager/auth_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  Future<void> register({
    required String email,
    required String password,
    String nom = '',
    String age = '',
    String genre = '',
    String adresse = '',
    String atcd = '',
    String pathologie = '',
  }) async {
    if (email.isEmpty || password.isEmpty) {
      print('champs vides');
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'remplir les champs',
        ),
      );
      return;
    }
    emit(state.copyWith(status: AuthStatus.loding));
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      User? user = userCredential.user;
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'Nom': nom.trim(),
          'age': age.trim(),
          'genre': genre.trim(),
          'adresse': adresse.trim(),
          'ATCD': atcd.trim(),
          'pathologie': pathologie.trim(),
          'email': email.trim(),
          'role': state.isPatient ? 'patient' : 'medcin',
        });
      }
      print('utilisateur cree avec succe');

      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }

  void isPatient(bool value) {
    emit(state.copyWith(isPatient: value));
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: 'remplir les champs',
        ),
      );
      return;
    }
    emit(state.copyWith(status: AuthStatus.loding));
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email.trim(),
            password: password.trim(),
          );
      final uid = userCredential.user!.uid;
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();
      final role = doc.data()?['role'] ?? 'patient';
      emit(
        state.copyWith(
          status: AuthStatus.success,
          isPatient: role == 'patient',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
