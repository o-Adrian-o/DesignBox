import 'package:flutter/material.dart';

BorderRadius boxRadius(double radius) => BorderRadius.all(Radius.circular(radius));

BoxShadow boxShadow(double elevation, {int alpha = 25}) => BoxShadow(
    color: Color.fromARGB(alpha, 0, 0, 0),
    offset: Offset(0, elevation / 3),
    blurRadius: elevation,
    spreadRadius: elevation);

BoxBorder boxBorder(Color color, {double width = 1, BorderStyle style = BorderStyle.solid}) =>
    Border.all(color: color, width: width, style: style, strokeAlign: BorderSide.strokeAlignOutside);

Gradient boxGradient(
        {required AlignmentGeometry begin,
        required AlignmentGeometry end,
        required Color beginColor,
        required Color endColor}) =>
    LinearGradient(
      begin: begin,
      end: end,
      colors: [
        beginColor,
        endColor,
      ],
    );

class Box extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Gradient? gradient;
  final BorderRadius? radius;
  final BoxShadow? shadow;
  final BoxBorder? border;
  final void Function()? onPressed;
  final Color? onPressedColor;
  final double onPressedColorIntensity;
  final Widget? child;

  const Box({
    super.key,
    this.width,
    this.height,
    this.constraints,
    this.color,
    this.gradient,
    this.padding,
    this.margin,
    this.radius,
    this.shadow,
    this.border,
    this.onPressed,
    this.onPressedColor,
    this.onPressedColorIntensity = 1,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        constraints: constraints,
        decoration: buildDecoration(),
        child: withOptionalInkWell(child));
  }

  Widget? withOptionalInkWell(Widget? child) {
    if (onPressed == null) {
      return child;
    }
    return Material(
        color: const Color.fromARGB(0, 0, 0, 0),
        child: InkWell(
            hoverColor: onPressedColor?.withAlpha((10 * onPressedColorIntensity).floor()),
            focusColor: onPressedColor?.withAlpha((15 * onPressedColorIntensity).floor()),
            highlightColor: onPressedColor?.withAlpha((20 * onPressedColorIntensity).floor()),
            splashColor: onPressedColor?.withAlpha((20 * onPressedColorIntensity).floor()),
            splashFactory: InkRipple.splashFactory,
            customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius?.bottomLeft.x ?? 0)),
            onTap: onPressed,
            child: child));
  }

  Decoration? buildDecoration() {
    if (shadow == null && radius == null && color == null) {
      return null;
    }
    final safeShadow = shadow == null ? null : {shadow as BoxShadow};
    return BoxDecoration(
        color: gradient == null ? color : null,
        gradient: gradient,
        border: border,
        borderRadius: radius,
        boxShadow: safeShadow?.toList());
  }
}
