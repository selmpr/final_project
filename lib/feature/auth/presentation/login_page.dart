import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_reed/feature/auth/manager/auth_cubit.dart';
import 'package:h_reed/feature/auth/manager/auth_state.dart';
import 'package:h_reed/feature/auth/presentation/register_page.dart';
import 'package:h_reed/feature/auth/widget/add_boutton.dart';
import 'package:h_reed/feature/auth/widget/container1.dart';
import 'package:h_reed/feature/auth/widget/password_forme.dart';
import 'package:h_reed/feature/auth/widget/redirect.dart';
import 'package:h_reed/feature/auth/widget/text_forme.dart';
import 'package:h_reed/feature/home/home_page1.dart';
import 'package:h_reed/feature/home/presentation/home_page2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rolelController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rolelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(253, 168, 167, 250),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'login failed'),
                backgroundColor: const Color.fromARGB(255, 240, 158, 152),
              ),
            );
          }
          if (state.status == AuthStatus.success) {
            print('success');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('welcome back'),
                backgroundColor: Color.fromARGB(255, 192, 251, 223),
              ),
            );
            if (state.isPatient) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage1()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage2()),
              );
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200),
              Container1(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20),
                    Text(
                      'bien venu ',
                      style: TextStyle(
                        color: Color.fromARGB(250, 106, 105, 163),

                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    TextForme(
                      labelText: 'email',
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    PasswordForme(controller: passwordController),
                    SizedBox(height: 10),

                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return state.status == AuthStatus.loding
                            ? const Center(child: CircularProgressIndicator())
                            : Adding(
                                addText: 'login',
                                onPressed: () {
                                  context.read<LoginCubit>().login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                                },
                              );
                      },
                    ),
                    SizedBox(width: 10),
                    Redirect(
                      registerText: 'dont have an account',
                      register: 'register',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => RegisterCubit(),
                              child: RegisterPage(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
