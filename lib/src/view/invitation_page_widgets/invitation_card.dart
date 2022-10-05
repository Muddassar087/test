import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/guest_controller.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/utills/constants.dart';

class InvitaionCard extends StatefulWidget {
  const InvitaionCard({Key? key, this.color, this.text, this.id})
      : super(key: key);
  final Color? color;
  final String? text;
  final int? id;

  @override
  State<InvitaionCard> createState() => _InvitaionCardState();
}

class _InvitaionCardState extends State<InvitaionCard> {
  final GuestController controller = GuestController();

  TextEditingController updateText = TextEditingController();
  bool isUpdate = false;

  @override
  void initState() {
    updateText.text = widget.text!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<ThemeContoller>(context).isLight()
          ? Colors.white
          : const Color(0xff3A374A),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0, top: 10.0),
        margin: const EdgeInsets.only(bottom: 2.0, left: 10.0),
        decoration: BoxDecoration(
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
          children: [
            CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: widget.color!,
              child: Center(
                child: Text(widget.text![0].toUpperCase()),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              widget.text!,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Provider.of<ThemeContoller>(context).isLight()
                      ? Colors.grey[800]
                      : Colors.white),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(
                Icons.remove_circle_outline,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
