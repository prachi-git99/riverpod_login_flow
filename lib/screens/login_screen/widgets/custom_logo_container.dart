import '../../../consts/consts.dart';


Widget customLogoContainer(context) {
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    padding: EdgeInsets.symmetric(vertical: size.height * 0.06),
    margin: const EdgeInsets.symmetric(vertical: verticalMargin),
    decoration: BoxDecoration(
        color: glassWhite,
        border: Border.all(color: white, width: 2.0),
        borderRadius: BorderRadius.circular(smallBorderRadius)),
    child: FlutterLogo(size: size.height * 0.15),
  );
}
