import 'package:flutter/cupertino.dart';
import 'package:inprodi/widgets/touchableTxt.dart';

class BottomText extends StatelessWidget {
  final String text;
  final String boldTxt;
  final Function() onpress;
  const BottomText(
      {Key? key,
      required this.text,
      required this.onpress,
      required this.boldTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        SizedBox(width: 10),
        TouchableTxt(onpress: onpress, text: boldTxt)
      ],
    );
  }
}
