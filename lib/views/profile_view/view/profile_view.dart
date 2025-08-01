import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/core/shared_preference.dart';
import 'package:recipes_app/core/utils/constants.dart';
import 'package:recipes_app/core/utils/routes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> _signOut(BuildContext context) async {
    await CacheHelper.removeData(key: 'token');
    GoRouter.of(context).go(AppRoutes.kOnboardingView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: Text(
                'D', 
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Donia',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // Settings Section
            Container(
              decoration: BoxDecoration(
                color: kWidgetColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outline, color: Colors.white),
                    title: Text('Account', style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text('Settings', style: TextStyle(color: Colors.white)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {},
                  ),
                  SwitchListTile(
                    value: false, // محتاجة تربطيها بالثيم لو عايزة تفعليه
                    onChanged: (value) {
                      // لسه
                    },
                    secondary: Icon(Icons.dark_mode, color: Colors.white),
                    title: Text('Dark Mode', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Sign Out Button
            ElevatedButton.icon(
              onPressed: () => _signOut(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              icon: Icon(Icons.logout),
              label: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
