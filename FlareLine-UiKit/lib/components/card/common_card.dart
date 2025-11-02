library flareline_uikit;

import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final String? title;
  final Color? color;

  const CommonCard(
      {super.key,
      this.child,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.title,
      this.color});

  @override
  Widget build(BuildContext context) {
    Widget childWidget = Padding(
        padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          width: width,
          height: height,
          child: child,
        ));
    return Container(
      decoration: ShapeDecoration(
        color: color ?? Theme.of(context).cardTheme?.color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: Theme.of(context).cardTheme?.surfaceTintColor ??
                  Colors.transparent),
          borderRadius: BorderRadius.circular(2),
        ),
        shadows: [
          BoxShadow(
            color:
                Theme.of(context).cardTheme?.shadowColor ?? Colors.transparent,
            blurRadius: 13,
            offset: Offset(0, 8),
            spreadRadius: -3,
          )
        ],
      ),
      child: title != null
          ? _titleWidget(
              title ?? '',
              childWidget,
            )
          : childWidget,
    );
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // título flexible: al menos 50px de alto, hasta 2 líneas
      ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      const Divider(
        height: 1,
      ),
      Padding(padding: const EdgeInsets.all(16), child: childWidget)
    ]);
  }
}
