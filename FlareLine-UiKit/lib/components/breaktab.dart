library flareline_uikit;

import 'package:flutter/material.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';


class BreakTab extends StatelessWidget {
  final String title;
  final Widget? rightWidget;

  BreakTab(this.title, {super.key, this.rightWidget});

  @override
  Widget build(BuildContext context) {
    // Prepara el widget derecho (breadcrumb o el que provea el llamador)
    final Widget trailing = rightWidget ?? (Row(
      children: [
        InkWell(
          child: const Text(
            'Dashboard',
            style: TextStyle(fontSize: 14),
          ),
          onTap: () {
            Navigator.of(context).popAndPushNamed('/');
          },
        ),
        const SizedBox(width: 6),
        const Text('/'),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: FlarelineColors.primary),
        )
      ],
    ));

    return Row(children: [
      Expanded(
        child: Tooltip(
          message: title,
          preferBelow: false,
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      ),
      const SizedBox(width: 8),
      // El lado derecho puede desplazarse horizontalmente si no cabe
      Flexible(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Align(
            alignment: Alignment.centerRight,
            child: trailing,
          ),
        ),
      ),
    ]);
  }
}
