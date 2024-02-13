import 'package:flutter/material.dart';
import 'package:learning_flutter_2/calculator_screen.dart';
import 'package:learning_flutter_2/contacts_page.dart';
import 'package:learning_flutter_2/drawer_header.dart';
import 'package:learning_flutter_2/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // backgroundColor: Colors.cyanAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyDrawerHeader(),
              drawerList(),
            ],
          ),
        ),
      ),
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

  Widget drawerList() {
    return Column(
      children: [
        menuItem(0, "Home", Icons.home,
            currentPage == DrawerSections.home ? true : false),
        menuItem(1, "Contacts", Icons.contacts,
            currentPage == DrawerSections.contacts ? true : false),
        menuItem(2, "Calculator", Icons.calculate,
            currentPage == DrawerSections.calculator ? true : false)
      ],
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            currentIndex = id;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections { home, contacts, calculator }
