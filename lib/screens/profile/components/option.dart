import 'package:flutter/material.dart';
import '../../../constant.dart';

class Option extends StatelessWidget {
  double width;
  double height;
  Color? leadingColor;
  IconData icon;
  String title;
  String trailingTxt;
  Color? trailingBgColor;
  Color? trailingIconColor;

  Option({
    required this.width,
    required this.height,
    required this.leadingColor,
    required this.icon,
    required this.title,
    required this.trailingTxt,
    required this.trailingBgColor,
    required this.trailingIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          // color: Colors.amber,
          width: width,
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: leadingColor,
                radius: 22,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    icon,
                    color: lightTextColor,
                  ),
                ),
              ),
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: darkTextColor,
                  fontSize: 15,
                ),
              ),
              trailing: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: trailingBgColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        trailingTxt,
                        style: TextStyle(
                          color: lightTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: trailingIconColor,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
