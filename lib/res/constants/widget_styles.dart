import 'package:flutter/material.dart';

class WidgetStyle {
  //  App Colors
  static const Color primaryColor = Color(0xff03687e);
  static const Color secondaryColor = Color(0xff3fb7c8);

  //  Colors
  static const Color qtextColor = Colors.white;
  static Color qScoreColor = Colors.amber.shade700;
  static const Color qIdColor = Colors.red;

  //  App Fonts
  static const String appFont = "Pacifico";

  // Container

  //  Box Shadow
  static const List<BoxShadow> myBoxShadow = [
    BoxShadow(
      color: Colors.blue,
      offset: Offset(5, 6),
      blurRadius: 10,
    ),
    BoxShadow(
      color: Colors.black,
      offset: Offset(-5, -6),
      blurRadius: 20,
    )
  ];

  //  App Text Styles
  static const TextStyle appTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontFamily: appFont,
  );
  static const TextStyle appBarStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontFamily: appFont,
  );

  // Custom  Widgets

  //  Custom TextField

  //    Styles
  static const TextStyle customTextFieldStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  static const TextStyle customTextFieldLabelStyle = TextStyle(
    color: primaryColor,
    fontSize: 18,
  );
  static const TextStyle customTextFieldHintStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle customTextFieldErrorStyle = TextStyle(
    color: Colors.pinkAccent,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle customTextFieldSuffixStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  static const TextStyle customTextFieldPrefixStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  //     Border Styles
  static const OutlineInputBorder customTextFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
  static const OutlineInputBorder customTextFieldFocusedBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
  static const OutlineInputBorder customTextFieldEnabledBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: secondaryColor, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );
  static const OutlineInputBorder customTextFieldErrorBorder =
      OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );
  static const OutlineInputBorder customTextFieldDisabledBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 3),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );
  static const OutlineInputBorder customTextFieldFocusedErrorBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: secondaryColor, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );

  //  Custom Button

  //   Colors
  static const Color customButtonColor = primaryColor;

  //    Styles
  static const TextStyle customButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
  static ButtonStyle customButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(customButtonColor),
    overlayColor: MaterialStateProperty.all<Color>(secondaryColor),
    shadowColor: MaterialStateProperty.all<Color>(primaryColor),
    elevation: MaterialStateProperty.all<double>(10),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: secondaryColor,
          width: 3,
          strokeAlign: StrokeAlign.center,
        ),
      ),
    ),
  );
}
