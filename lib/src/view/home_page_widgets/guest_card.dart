import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/guest_controller.dart';
import 'package:sqlite_practice/src/controllers/invitation_card_controller.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/model/card_model.dart';
import 'package:sqlite_practice/src/utills/constants.dart';

// ignore: must_be_immutable
class GuestCard extends StatefulWidget {
  GuestCard({Key? key, this.m, this.filled = false}) : super(key: key);
  CardModel? m;
  bool? filled;

  @override
  State<GuestCard> createState() => _GuestCardState();
}

class _GuestCardState extends State<GuestCard> {
  final GuestController controller = GuestController();

  TextEditingController updateText = TextEditingController();
  bool isUpdate = false;
  bool? filled;

  InvitationCardController ic = InvitationCardController();

  @override
  void initState() {
    updateText.text = widget.m!.name!;
    filled = widget.filled!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.7407407407407407 - 10;
    return Slidable(
      enabled: !isUpdate,
      startActionPane: ActionPane(
        dragDismissible: false,
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: (context) {
              controller.deleteGuest(widget.m!.id!);
            },
            padding: const EdgeInsets.only(bottom: 0),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
          SlidableAction(
            onPressed: (context) {
              setState(() {
                isUpdate = true;
              });
            },
            padding: const EdgeInsets.only(bottom: 0),
            backgroundColor: kSecondary,
            foregroundColor: Colors.white,
            icon: Icons.update,
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
        margin: const EdgeInsets.only(bottom: 2.0, left: 10.0),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: Provider.of<ThemeContoller>(context).isLight()
              ? Colors.white
              : const Color(0xff3A374A),

          boxShadow: [
            BoxShadow(
              color: Provider.of<ThemeContoller>(context).isLight()
                  ? Colors.black12
                  : const Color.fromARGB(255, 105, 105, 105),
              offset: const Offset(2.0, 1.0), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: widget.m!.color!,
                  child: Center(
                    child: Text(widget.m!.name![0].toUpperCase()),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                isUpdate
                    ? SizedBox(
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            onSubmitted: (value) {
                              controller.updateGuest(widget.m!.id!, value);
                              setState(() {
                                isUpdate = false;
                              });
                            },
                            controller: updateText,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: "add Gues name",
                              hintStyle: const TextStyle(fontSize: 15.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: kSecondaryImp),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: kSecondaryImp, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Text(
                        widget.m!.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeContoller>(context).isLight()
                                    ? Colors.grey[800]
                                    : Colors.white),
                      ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: () {
                  ic.addList(widget.m!);
                  controller.updateFilledStatus(widget.m!.id);
                  bool c = widget.m!.filled!;
                  ic.updateList(c, widget.m!.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: widget.m!.filled!
                          ? kSecondaryImp
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                      border: const Border.fromBorderSide(
                          BorderSide(color: kSecondaryImp))),
                  child: Icon(
                    Icons.add,
                    color: !widget.m!.filled! ? kSecondaryImp : Colors.white,
                    size: 18.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
