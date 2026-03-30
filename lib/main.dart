import 'package:flutter/material.dart';
import 'homePage.dart';
import 'profilePage.dart';
import 'settingsPage.dart';
import 'studentList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.blueAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 45, 50, 90),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 35, 40, 70),
          selectedItemColor: const Color.fromARGB(255, 100, 200, 255),
          unselectedItemColor: Colors.grey[400],
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue, brightness: Brightness.dark).copyWith(secondary: Colors.blueAccent),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 25, 30, 50),
          selectedItemColor: const Color.fromARGB(255, 100, 200, 255),
          unselectedItemColor: Colors.grey[600],
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MainScreen(onThemeToggle: toggleDarkMode),
    );
  }
}

class MainScreen extends StatefulWidget {
  final Function(bool) onThemeToggle;

  const MainScreen({super.key, required this.onThemeToggle});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(onNavigateTo: onItemTapped),
      ProfilePage(),
      StudentListPage(),
      SettingsPage(onThemeToggle: widget.onThemeToggle),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shittim Chest'),
        centerTitle: true,
        leading: selectedIndex != 0
            ? IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => onItemTapped(0),
                tooltip: 'Back to Home',
              )
            : null,
      ),
      drawer: selectedIndex == 0 ? null : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/schaleLogo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/sensei.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nathaniel Rolando Castellano',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 180, 240),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'S.C.H.A.L.E.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 50, 180, 240),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              selected: selectedIndex == 1,
              onTap: () {
                onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Student List'),
              selected: selectedIndex == 2,
              onTap: () {
                onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              selected: selectedIndex == 3,
              onTap: () {
                onItemTapped(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/schaleLogo2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: pages[selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        backgroundColor: Theme.of(context).brightness == Brightness.dark 
            ? const Color.fromARGB(255, 25, 30, 50)
            : const Color.fromARGB(255, 35, 40, 70),
        selectedItemColor: const Color.fromARGB(255, 100, 200, 255),
        unselectedItemColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[600]
            : Colors.grey[400],
        selectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 100, 200, 255),
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[600]
              : Colors.grey[400],
        ),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ]
      )
    );
  }
}
