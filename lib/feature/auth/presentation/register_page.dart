import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_reed/feature/auth/manager/auth_cubit.dart';
import 'package:h_reed/feature/auth/manager/auth_state.dart';
import 'package:h_reed/feature/auth/presentation/login_page.dart';
import 'package:h_reed/feature/auth/widget/container1.dart';
import 'package:h_reed/feature/auth/widget/add_boutton.dart';
import 'package:h_reed/feature/auth/widget/password_forme.dart';
import 'package:h_reed/feature/auth/widget/redirect.dart';
import 'package:h_reed/feature/auth/widget/text_forme.dart';
import 'package:h_reed/feature/home/home_page1.dart';
import 'package:h_reed/feature/home/presentation/home_page2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String? selectedGenre;
  TextEditingController adressController = TextEditingController();
  TextEditingController atcdController = TextEditingController();
  TextEditingController pathController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();

    adressController.dispose();
    atcdController.dispose();
    pathController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(253, 168, 167, 250),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'registration failed'),
                backgroundColor: const Color.fromARGB(255, 240, 158, 152),
              ),
            );
          }
          if (state.status == AuthStatus.success) {
            print('success');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Account created successfully!'),
                backgroundColor: Color.fromRGBO(192, 251, 223, 1),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<RegisterCubit>().isPatient(true);
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: state.isPatient
                                  ? const Color.fromARGB(252, 153, 151, 249)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: BoxBorder.all(color: Colors.white),
                            ),
                            height: 40,
                            width: 80,
                            child: Center(
                              child: Text(
                                'patient',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    117,
                                    79,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        GestureDetector(
                          onTap: () {
                            context.read<RegisterCubit>().isPatient(false);
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: state.isPatient
                                  ? Colors.white
                                  : const Color.fromARGB(252, 153, 151, 249),
                              borderRadius: BorderRadius.circular(20),
                              border: BoxBorder.all(color: Colors.white),
                            ),
                            height: 40,
                            width: 80,
                            child: Center(
                              child: Text(
                                'medcin',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    117,
                                    79,
                                    255,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    state.isPatient
                        ? Container1(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Nouveau patient',
                                  style: TextStyle(
                                    color: Color.fromARGB(250, 106, 105, 163),

                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextForme(
                                  labelText: 'Nom',
                                  controller: nameController,
                                  prefixIcon: Icons.person_add,
                                  keyboardType: TextInputType.text,
                                ),

                                SizedBox(height: 10),
                                TextForme(
                                  labelText: 'age',
                                  controller: ageController,
                                  prefixIcon: Icons.cake_rounded,
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 10),
                                DropdownButtonFormField<String>(
                                  initialValue: selectedGenre,
                                  decoration: InputDecoration(
                                    labelText: 'genre',
                                    prefixIcon: Icon(
                                      Icons.male_rounded,
                                      color: const Color.fromARGB(
                                        253,
                                        168,
                                        167,
                                        250,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'Homme',
                                      child: Text('Homme'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Femme',
                                      child: Text('Femme'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGenre = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10),

                                TextForme(
                                  labelText: 'adresse',
                                  controller: adressController,
                                  prefixIcon: Icons.contact_mail,
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(height: 10),
                                TextForme(
                                  labelText: 'ATCD',
                                  controller: atcdController,
                                  prefixIcon: Icons.pending_actions_sharp,
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(height: 10),
                                TextForme(
                                  labelText: 'pathologie',
                                  controller: pathController,
                                  prefixIcon: Icons.personal_injury,
                                  keyboardType: TextInputType.text,
                                ),
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
                                BlocBuilder<RegisterCubit, RegisterState>(
                                  builder: (context, state) {
                                    return state.status == AuthStatus.loding
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Adding(
                                            addText: 'creer un dossier',
                                            onPressed: () {
                                              print('loged in');
                                              try {
                                                context
                                                    .read<RegisterCubit>()
                                                    .register(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                      nom: nameController.text,
                                                      age: ageController.text,
                                                      genre:
                                                          selectedGenre ?? '',
                                                      adresse:
                                                          adressController.text,
                                                      atcd: atcdController.text,
                                                      pathologie:
                                                          pathController.text,
                                                    );
                                                print(
                                                  'register called successfully',
                                                );

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage1(),
                                                  ),
                                                );
                                              } catch (e, stack) {
                                                print('ERROR CAUGHT: $e');
                                                print(stack);
                                              }
                                            },
                                          );
                                  },
                                ),
                                Redirect(
                                  registerText: 'already have an account?',
                                  register: 'login',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BlocProvider(
                                          create: (_) => LoginCubit(),
                                          child: LoginPage(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        : Container1(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Nouveau medcin',
                                  style: TextStyle(
                                    color: Color.fromARGB(250, 106, 105, 163),

                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextForme(
                                  labelText: 'Nom',
                                  controller: nameController,
                                  prefixIcon: Icons.person_add,
                                  keyboardType: TextInputType.text,
                                ),
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
                                BlocBuilder<RegisterCubit, RegisterState>(
                                  builder: (context, state) {
                                    return state.status == AuthStatus.loding
                                        ? const Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Adding(
                                            addText: 'register',
                                            onPressed: () {
                                              print('loged in');
                                              try {
                                                context
                                                    .read<RegisterCubit>()
                                                    .register(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                    );
                                                print(
                                                  'register called successfully',
                                                );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage2(),
                                                  ),
                                                );
                                              } catch (e, stack) {
                                                print('ERROR CAUGHT: $e');
                                                print(stack);
                                              }
                                            },
                                          );
                                  },
                                ),
                                Redirect(
                                  registerText: 'already have an account?',
                                  register: 'login',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BlocProvider(
                                          create: (_) => LoginCubit(),
                                          child: LoginPage(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
