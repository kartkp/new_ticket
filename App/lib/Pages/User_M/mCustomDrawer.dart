
import 'package:flutter/material.dart';
import 'package:project_ticket/Pages/User_/homePage.dart';
import 'package:project_ticket/Pages/miscellaneous/profilePage.dart';
import 'package:project_ticket/Pages/miscellaneous/helpAndSupport.dart';
import '../../service/firebaseAuthService.dart';
import '../../welcome_page.dart';
import '../miscellaneous/notification.dart';
import '../miscellaneous/setting.dart';

// Firebase Auth
import 'package:firebase_auth/firebase_auth.dart';

class mCustomDrawer extends StatelessWidget {
  mCustomDrawer({super.key});

  final User? user = Auth().currentUser;

  final String? name = Auth().currentUser?.displayName;

  final String? email = Auth().currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Expanded(
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/splashScreen.jpeg"),
                      fit: BoxFit.cover)),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.transparent),
                accountName: Text(name ?? 'Guest'),
                accountEmail: Text(email ?? "xyz-101@domain.com"),
                currentAccountPictureSize: const Size.square(60),
                currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.account_circle, size: 60)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const profilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text(' My Ticket '),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_active),
              title: const Text(' Notification '),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  notification()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(' Help and Support '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const helpAndSupport()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Setting '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            ),

            const Expanded(
              child: Align(alignment: Alignment.bottomCenter, child: null),
            ),
            ListTile(
              leading: const Icon(Icons.change_circle),
              title: const Text(' Switch User Mode'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const homePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(' Sign Out '),
              onTap: () {
                Auth().signOut();
                print("user logged in");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const welcome_page()));
              },
            ),
            // ],)
          ],
        ),
      ),
    );
  }
}
