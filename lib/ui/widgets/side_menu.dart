import '/shared/theme.dart';
import 'package:flutter/material.dart';

import 'logo.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultCircular), // <-- Radius
      ),
      elevation: 0,
      backgroundColor: kSecondaryColor,
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(child: Logo()),
            Divider(
                indent: 30, endIndent: 30, color: kGreyColor, thickness: 1.0),
            DrawerListTile(
              title: "Dashbord",
              onPress: () {},
            ),
            DrawerListTile(
              title: "Transaction",
              onPress: () {},
            ),
            Container(
              decoration: BoxDecoration(color: kBackgroundColor),
              child: Container(
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.holiday_village_outlined,
                      color: kPrimaryColor),
                  title: Text(
                    'Notes',
                    style: whiteTextStyle,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              child: ListTile(
                selected: true,
                onTap: () {},
                leading:
                    Icon(Icons.holiday_village_outlined, color: kPrimaryColor),
                title: Text(
                  'Tasks',
                  style: whiteTextStyle,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: kBackgroundColor),
              child: Container(
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(Icons.holiday_village_outlined,
                      color: kPrimaryColor),
                  title: Text(
                    'Notes',
                    style: whiteTextStyle,
                  ),
                ),
              ),
            ),
            DrawerListTile(
              title: "Store",
              onPress: () {},
            ),
            DrawerListTile(
              title: "Notification",
              onPress: () {},
            ),
            DrawerListTile(
              title: "Profile",
              onPress: () {},
            ),
            DrawerListTile(
              title: "Settings",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return ListTile(
      tileColor: kSecondaryColor,
      selected: selected,
      selectedTileColor: kBackgroundColor,
      onTap: onPress,
      leading: Icon(Icons.holiday_village_outlined, color: kPrimaryColor),
      title: Text(
        title,
        style: whiteTextStyle,
      ),
    );
  }
}
