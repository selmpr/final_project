import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:h_reed/feature/auth/widget/container2.dart';
import 'package:h_reed/feature/auth/widget/container3.dart';
import 'package:h_reed/feature/auth/widget/container4.dart';
import 'package:h_reed/feature/profile/presentation/profile_page.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  int _index = 0;
  final List<Widget> _pages = [
    Container2(),
    Container3(),
    Container4(),
    ProfilePage(),
  ];
  List<String> titles = ['Home', 'mesure d"hygiene', 'progressin', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 106, 105, 163),
        title: Text(titles[_index]),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(250, 106, 105, 163),
        selectedItemColor: const Color.fromARGB(255, 54, 22, 94),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.no_meals_outlined),
            label: "mesur d'hygiene",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart),
            label: 'progression',
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
