import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/guest_controller.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/utills/constants.dart';

// ignore: must_be_immutable
class AddGuest extends StatelessWidget {
  AddGuest({Key? key}) : super(key: key);

  TextEditingController guestname = TextEditingController();
  GuestController controller = GuestController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Provider.of<ThemeContoller>(context).isLight()
          ? Colors.white
          : const Color(0xff3A374A),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, right: 20, bottom: 10),
            child: Container(
              color: Provider.of<ThemeContoller>(context).isLight()
                  ? Colors.white
                  : const Color(0xff1F1D2B),
              child: TextField(
                autofocus: true,
                style: TextStyle(
                    color: Provider.of<ThemeContoller>(context).isLight()
                        ? Colors.black
                        : Colors.black),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    controller.addGuest(value);
                  }
                  Navigator.pop(context);
                },
                controller: guestname,
                decoration: InputDecoration(
                    hintText: "add Gues name",
                    hintStyle:
                        const TextStyle(fontSize: 15.0, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: kSecondaryImp),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kSecondaryImp, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor:
                      Provider.of<ThemeContoller>(context).isLight()
                          ? kSecondary
                          : Color.fromARGB(255, 34, 37, 49),
                  onSurface: Colors.white,
                  padding: const EdgeInsets.all(20.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Add Guest",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onPressed: () {
                if (guestname.text.isNotEmpty) {
                  controller.addGuest(guestname.text);
                }
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
