import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class PersonalAvatarWidget extends StatelessWidget {
  const PersonalAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        title: AppLocalizations.of(context)!.yourPhoto,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://nextjs-demo.tailadmin.com/_next/image?url=%2Fimages%2Fuser%2Fuser-01.png&w=256&q=75'),
                radius: 22,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.editYourPhoto,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        Text(AppLocalizations.of(context)!.delete),
                        Text(AppLocalizations.of(context)!.update),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: GlobalColors.gray,
            child: Stack(
              children: [
                Center(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Icon(Icons.upload),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(AppLocalizations.of(context)!.clickToUpload),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('SVG,PNG,JPG or GIF'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('max,800 X 800px'),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          LayoutBuilder(builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 400;

            final cancelButton = ButtonWidget(
              btnText: AppLocalizations.of(context)!.cancel,
            );

            final saveButton = ButtonWidget(
              btnText: AppLocalizations.of(context)!.save,
              type: ButtonType.primary.type,
            );

            if (isNarrow) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  saveButton,
                  const SizedBox(height: 8),
                  cancelButton,
                ],
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 120,
                  child: cancelButton,
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 120,
                  child: saveButton,
                ),
              ],
            );
          })
        ]));
  }
}
