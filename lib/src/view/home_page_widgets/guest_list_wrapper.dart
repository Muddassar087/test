import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/guest_controller.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/model/card_model.dart';
import 'package:sqlite_practice/src/utills/constants.dart';
import 'package:sqlite_practice/src/view/home_page_widgets/guest_card.dart';

// ignore: must_be_immutable
class GuestListWrapper extends StatelessWidget {
  GuestListWrapper({
    Key? key,
  }) : super(key: key);
  final ScrollController controller = ScrollController();

  GuestController controllerGuest = GuestController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CardModel>>(
      future: controllerGuest.getList(),
      builder: (context, snapshot) => Consumer<GuestController>(
        builder: (context, value, child) => Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Provider.of<ThemeContoller>(context).isLight()
                  ? Colors.white
                  : const Color(0xff3A374A),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: snapshot.connectionState == ConnectionState.done
                ? snapshot.data!.isNotEmpty
                    ? Scrollbar(
                        thumbVisibility: true,
                        controller: controller,
                        child: ListView(
                            controller: controller,
                            children: snapshot.data!
                                .map((e) => GuestCard(m: e))
                                .toList()),
                      )
                    : Center(
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
                              "No guests",
                              style: TextStyle(color: kSecondary),
                            ),
                          ],
                        ),
                      )
                : const Center(
                    child: CircularProgressIndicator(
                      color: kSecondary,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
