import 'package:flutter/material.dart';
import '../constant.dart';
import '../../data/mockdata.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 184, 67, 98)),
          child: Center(
              child: Row(
            children: [
              Expanded(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(userInfo.profilepic),
                ),
                flex: 2,
              ),
              Expanded(
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    Text(
                      userInfo.profilename,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                flex: 6,
              ),
            ],
          )),
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: materialButtonColor,
            size: 28,
          ),
          title: Text(
            "My Favorite Item",
            style: TextStyle(
              color: darkTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ]),
    );
  }
}
