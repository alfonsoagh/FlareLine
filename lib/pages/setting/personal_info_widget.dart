import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: AppLocalizations.of(context)!.personalInfo,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Fila responsiva de "Nombre" y "Teléfono"
        LayoutBuilder(builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 540; // apilar en móvil

          final firstField = OutBorderTextFormField(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset(
                  'assets/icon/user.svg',
                  width: 22,
                  height: 22,
                ),
              ),
              labelText: AppLocalizations.of(context)!.fullName,
              hintText: AppLocalizations.of(context)!.fullNameHint);

          final secondField = OutBorderTextFormField(
              labelText: AppLocalizations.of(context)!.phoneNumber,
              hintText: AppLocalizations.of(context)!.phoneNumberHint);

          if (isNarrow) {
            return Column(
              children: [
                firstField,
                const SizedBox(height: 12),
                secondField,
              ],
            );
          }

          return Row(
            children: [
              Expanded(child: firstField),
              const SizedBox(width: 12),
              Expanded(child: secondField),
            ],
          );
        }),
        const SizedBox(
          height: 16,
        ),
        OutBorderTextFormField(
          labelText: AppLocalizations.of(context)!.email,
          hintText: AppLocalizations.of(context)!.emailHint,
          icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SvgPicture.asset(
              'assets/signin/email.svg',
              width: 22,
              height: 22,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        OutBorderTextFormField(
            labelText: AppLocalizations.of(context)!.userName,
            hintText: AppLocalizations.of(context)!.userNameHint),
        const SizedBox(
          height: 16,
        ),
        OutBorderTextFormField(
          maxLines: 5,
          labelText: AppLocalizations.of(context)!.bio,
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
      ]),
    );
  }
}
