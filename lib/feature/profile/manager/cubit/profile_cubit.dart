import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_reed/feature/profile/manager/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> fetchProfile() async {
    emit(state.copyWith(status: ProfileStatus.loding));
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        emit(
          state.copyWith(
            status: ProfileStatus.error,
            errorMessage: 'utilisateur non connecte',
          ),
        );
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!doc.exists) {
        emit(
          state.copyWith(
            status: ProfileStatus.error,
            errorMessage: 'profil introuvable',
          ),
        );
        return;
      }

      emit(state.copyWith(status: ProfileStatus.success, data: doc.data()));
    } catch (e) {
      emit(
        state.copyWith(status: ProfileStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
