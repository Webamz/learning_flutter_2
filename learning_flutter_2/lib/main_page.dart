import 'package:flutter/material.dart';
import 'package:learning_flutter_2/calculator_screen.dart';
import 'package:learning_flutter_2/contacts_page.dart';
import 'package:learning_flutter_2/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("My Application"),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_phone), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Calculator"),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.amber,
      ),
    );
  }

  final pages = [
    const HomePage(),
    const ContactsPage(),
    const CalculatorScreen(),
  ];
}
