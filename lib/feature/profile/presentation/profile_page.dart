import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_reed/feature/profile/manager/cubit/profile_cubit.dart';
import 'package:h_reed/feature/profile/manager/cubit/profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..fetchProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.status == ProfileStatus.loding) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == ProfileStatus.error) {
            return Center(child: Text(state.errorMessage ?? 'erreur'));
          }
          if (state.status == ProfileStatus.success && state.data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Nom: ${state.data!['Nom']}'),
                ),

                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Email: ${state.data!['email']}'),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Role: ${state.data!['role']}'),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
