import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/utills/constants.dart';
import 'package:sqlite_practice/src/view/drawer_home.dart';
import 'package:sqlite_practice/src/view/invitation_page.dart';
import 'home_page_widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black.withOpacity(0.3),
      drawer: InviterDrawer(),
      backgroundColor: Provider.of<ThemeContoller>(context).isLight()
          ? kPrimary
          : const Color(0xff1F1D2B),
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeContoller>(context).isLight()
            ? Colors.white
            : const Color(0xff3A374A),
        foregroundColor: Provider.of<ThemeContoller>(context).isLight()
            ? Colors.black87
            : Colors.white,
        elevation: 1.5,
        title: const Text(
          "Inviter",
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor:
                      Provider.of<ThemeContoller>(context).isLight()
                          ? kSecondary
                          : const Color.fromARGB(255, 34, 37, 49),
                  padding: const EdgeInsets.all(10.0)),
              child: Row(
                children: const [
                  Icon(
                    Icons.inventory_outlined,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Invite to contest",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => InvitationPage()),
                );
              },
            ),
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const AddGuestButton(),
        GuestListWrapper(),
      ]),
    );
  }
}
