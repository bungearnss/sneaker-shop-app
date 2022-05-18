import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../customappbar.dart';
import '../../constant.dart';
import '../../data/mockdata.dart';
import '../../models/modelindex.dart';
import '../../animation/FadeAnimation.dart';
import './components/option.dart';
import '../../screens/components/custombutton.dart';
import '../../providers/index_controller.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int statusCurrentIndex = 0;
  Users? getUserInfo;
  UserStatus? getUserStatus;

  Users? _getUserInfo(BuildContext context) {
    return getUserInfo =
        Provider.of<UserController>(context, listen: false).loadedUser;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Provider.of<UserController>(context, listen: false)
        .fetchAndSetUserProfile();
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar("profile", () {}),
        backgroundColor: backgroundColor,
        body: Container(
          margin: const EdgeInsets.all(15),
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                profileSection(width, height),
                const SizedBox(height: 20),
                statusSection(width, height),
                const SizedBox(height: 20),
                dashboardSection(width, height),
                const SizedBox(height: 20),
                logoutSection(width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileSection(width, height) {
    return FadeAnimation(
      delay: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getUserInfo(context) == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CircleAvatar(
                  radius: 50,
                  // backgroundImage: NetworkImage(userInfo.profilepic),
                  backgroundImage:
                      NetworkImage(_getUserInfo(context)!.profilepic),
                ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _getUserInfo(context)!.profilename,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  statusSection(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: SizedBox(
        width: width,
        height: height / 9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "status",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: SizedBox(
                width: width / 1.12,
                height: height / 13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: statusLsit.length,
                  itemBuilder: (ctx, index) {
                    UserStatus status = statusLsit[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          statusCurrentIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 120,
                          decoration: BoxDecoration(
                            color: statusCurrentIndex == index
                                ? status.selectColor
                                : status.unselectColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                status.emoji,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                status.txt,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: lightTextColor,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dashboardSection(width, height) {
    return FadeAnimation(
      delay: 2,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Dashboard",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Option(
              width: width,
              height: height,
              leadingColor: Colors.green[600],
              icon: Icons.wallet_travel_outlined,
              trailingBgColor: Colors.blue[700],
              title: "Payment",
              trailingTxt: "Debit",
              trailingIconColor: lightTextColor,
            ),
            Option(
              width: width,
              height: height,
              leadingColor: Colors.yellow[600],
              icon: Icons.archive,
              trailingBgColor: Colors.transparent,
              title: "Achievments",
              trailingTxt: "",
              trailingIconColor: darkTextColor,
            ),
            Option(
              width: width,
              height: height,
              leadingColor: Colors.grey[400],
              icon: Icons.shield,
              trailingBgColor: Colors.red[500],
              title: "Privacy",
              trailingTxt: "Action Needed",
              trailingIconColor: lightTextColor,
            ),
          ],
        ),
      ),
    );
  }

  logoutSection(width, height) {
    return FadeAnimation(
      delay: 2.5,
      child: CustomButton(
        onPressed: () {},
        title: "LOGOUT",
      ),
    );
  }
}
