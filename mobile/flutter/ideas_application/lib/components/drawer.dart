import 'package:flutter/material.dart';
import 'package:ideas_application/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
    final void Function()? onSignOut;
  const MyDrawer({
    super.key, 
    required this.onProfileTap, 
    required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 1, 77),
      child: Column(
        children: [
          //header
          const DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 64,
            ),
          ),
          //home, list title
          MyListTile(
            icon: Icons.home,
            text: 'H O M E',
            onTap: () => Navigator.pop(context),
          ),

          //profile
          MyListTile(
          icon: Icons.person,
           text: 'P R O F I L E', 
           onTap: onProfileTap,
           ),


          //logout
          MyListTile(
          icon: Icons.logout,
           text: 'L O G  O U T', 
           onTap: onSignOut,
           ),
        ],
      ),
    );
  }
}
