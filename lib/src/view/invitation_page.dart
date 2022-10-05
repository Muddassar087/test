import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/invitation_card_controller.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/utills/constants.dart';
import 'package:sqlite_practice/src/view/invitation_page_widgets/invitation_card.dart';

class InvitationPage extends StatelessWidget {
  InvitationPage({Key? key}) : super(key: key);

  final InvitationCardController controller = InvitationCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeContoller>(context).isLight()
          ? kPrimary
          : const Color(0xff1F1D2B),
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeContoller>(context).isLight()
            ? kPrimary
            : const Color(0xff3A374A),
        foregroundColor: Provider.of<ThemeContoller>(context).isLight()
            ? Colors.grey[800]
            : Colors.white,
        elevation: 2.0,
        title: const Text(
          "Invitaion List",
          style: TextStyle(fontSize: 17.0),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Remove all",
                    style: TextStyle(color: Colors.redAccent[100]),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.remove_circle_outline_sharp,
                    color: Colors.redAccent[100],
                  )
                ],
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          controller.getList().isNotEmpty
              ? Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: controller
                        .getList()
                        .map<InvitaionCard>((e) => InvitaionCard(
                              color: e.color,
                              id: e.id,
                              text: e.name,
                            ))
                        .toList(),
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.free_cancellation_outlined,
                            color: kSecondary,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "No invites",
                            style: TextStyle(color: kSecondary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          Container(
            color: Provider.of<ThemeContoller>(context).isLight()
                ? Colors.white
                : const Color(0xff3A374A),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor:
                        Provider.of<ThemeContoller>(context).isLight()
                            ? kSecondary
                            : kSecondaryDark,
                    padding: const EdgeInsets.all(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      "Invite",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          )
          // Text("some dummy text"),
        ],
      ),
    );
  }
}
