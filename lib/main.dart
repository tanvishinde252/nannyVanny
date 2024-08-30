import 'package:flutter/material.dart';
import 'package:nanny_vanny/views/currentWidget.dart';
import 'package:nanny_vanny/views/menuWidget.dart';
import 'package:nanny_vanny/views/packageWidget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Package Page'),
    Text('Booking Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MenuDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60, // Diameter of the circle
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.pink, // Border color
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20, // Adjust size as needed
                      child: ClipOval(
                        child: Image.asset(
                          'assets/girlicon.png',
                          fit: BoxFit.cover,
                        ),
                      ), // Adjust size as needed
                    ),
                  ),
                  const SizedBox(width: 10), // Space between icon and text
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                      ),
                      Text(
                        'Emily Cyrus',
                        style: TextStyle(
                          color: Color.fromARGB(255, 236, 107, 150),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                clipBehavior:
                    Clip.none, // Allows the image to overflow the container
                children: [
                  Container(
                    width: 300, // Width of the container
                    height: 150, // Height of the container
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 174,
                          198), // Background color of the container
                      borderRadius:
                          BorderRadius.circular(20), // Circular corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Nanny And ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 46, 41, 121),
                            ),
                          ),
                          const Text(
                            'Babysitting Service',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 46, 41, 121),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 46, 41, 121), // Blue background color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5), // Padding around the text
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Book Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -40, // Negative value to overlap the container
                    top: -10, // Align with the container’s top
                    bottom:
                        -1, // Make the image extend below the container’s bottom
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // Optional: match the container's border radius
                      child: Image.asset(
                        'assets/babysitting.jpg', // Replace with your image asset path
                        width: 100, // Width of the image
                        height:
                            250, // Height of the image (larger than container's height)
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Your Current Booking',
                style: TextStyle(
                    color: Color.fromARGB(255, 46, 41, 121),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              CurrentBookingWidget(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Packages',
                style: TextStyle(
                    color: Color.fromARGB(255, 46, 41, 121),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              // SizedBox(height: 20,),
              const PackageDataWidget(),
              // PackageWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Package',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
