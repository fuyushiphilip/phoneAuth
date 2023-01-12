import 'package:flutter/material.dart';
import 'package:phoneauth_firebase/provider/auth_provider.dart';
import 'package:phoneauth_firebase/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("User Info"),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 35),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(ap.userModel.profilePic),
                  radius: 90,
                ),
                const SizedBox(height: 50),
                Text(
                  ap.userModel.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  ap.userModel.phoneNumber,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  ap.userModel.email,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  ap.userModel.bio,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// children: [
//           CircleAvatar(
//             backgroundColor: Colors.red,
//             backgroundImage: NetworkImage(ap.userModel.profilePic),
//             radius: 50,
//           ),

// Text(ap.userModel.name),
// Text(ap.userModel.phoneNumber),
// Text(ap.userModel.email),
// Text(ap.userModel.bio),
