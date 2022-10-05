import 'package:flutter/material.dart';
import 'package:sqlite_practice/src/utills/constants.dart';
import 'package:sqlite_practice/src/view/home_page_widgets/add_guest.dart';

class AddGuestButton extends StatelessWidget {
  const AddGuestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: AddGuest(),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                children: const [
                  Text(
                    "Add new guest",
                    style: TextStyle(
                        color: kSecondaryImp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  CircleAvatar(
                    backgroundColor: kSecondaryImp,
                    foregroundColor: Colors.white,
                    radius: 10.0,
                    child: Icon(
                      Icons.add,
                      size: 18.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
