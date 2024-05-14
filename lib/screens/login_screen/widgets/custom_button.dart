

import '../../../consts/consts.dart';

Widget customButton({context, onTap}) {
  var size = MediaQuery.of(context).size;
  return SizedBox(
    width: size.width,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(smallBorderRadius),
          ),
        ),
        onPressed: onTap,
        child: const Text(loginBtnText,
            style: TextStyle(color: white, fontSize: mediumText))),
  );
}
