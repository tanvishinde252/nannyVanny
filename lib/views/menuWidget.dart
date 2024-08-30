import 'package:flutter/material.dart';

class MenuDrawerWidget extends StatelessWidget {
  const MenuDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 80, // Diameter of the circle
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.pink, // Border color
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40, // Adjust size as needed
                    child: ClipOval(
                      child: Image.asset(
                        'assets/girlicon.png',
                        fit: BoxFit.cover,
                      ),
                    ), // Adjust size as needed
                  ),
                ),
                const SizedBox(width: 20), // Space between icon and text
                const Text(
                  'Emily Cyrus',
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 107, 150),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Color.fromARGB(255, 236, 107, 150),
              height: 2,
            ),
            ListTile(
              title: const Text(
                'Book a Nanny',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'How it Works',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Color.fromARGB(255, 236, 107, 150),
              height: 2,
            ),
            ListTile(
              title: const Text(
                'Why Nanny Vanny',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'My Bookings',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Color.fromARGB(255, 236, 107, 150),
              height: 2,
            ),
            ListTile(
              title: const Text(
                'My Profile',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Support',
                style: TextStyle(
                  color: Color.fromARGB(255, 46, 41, 121),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
