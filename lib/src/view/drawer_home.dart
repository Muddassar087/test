import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/utills/constants.dart';

class InviterDrawer extends StatelessWidget {
  InviterDrawer({
    Key? key,
  }) : super(key: key);

  final ThemeContoller contoller = ThemeContoller();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 10.0,
        backgroundColor: Provider.of<ThemeContoller>(context).isLight()
            ? Colors.white.withOpacity(0.9)
            : const Color(0xff252836).withOpacity(0.9),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [],
                  color: kSecondary),
              padding: const EdgeInsets.all(15.0),
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.inventory_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Inviter",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      contoller.dark();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Provider.of<ThemeContoller>(context).isLight()
                              ? Colors.transparent
                              : const Color.fromARGB(255, 68, 71, 87)),
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.dark_mode_outlined,
                            color:
                                Provider.of<ThemeContoller>(context).isLight()
                                    ? Colors.grey[500]
                                    : Colors.white,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Dark Mode",
                            style: TextStyle(
                                fontSize: 14,
                                color: Provider.of<ThemeContoller>(context)
                                        .isLight()
                                    ? Colors.grey[500]
                                    : Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      contoller.light();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Provider.of<ThemeContoller>(context).isLight()
                            ? Colors.grey[350]
                            : Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.light_mode_outlined,
                            color:
                                Provider.of<ThemeContoller>(context).isLight()
                                    ? Colors.black
                                    : Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Light Mode",
                            style: TextStyle(
                                fontSize: 14,
                                color: Provider.of<ThemeContoller>(context)
                                        .isLight()
                                    ? Colors.black
                                    : Colors.grey[400],
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
