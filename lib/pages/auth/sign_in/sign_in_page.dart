import 'package:flareline/pages/auth/sign_in/sign_in_provider.dart';
import 'package:flareline_uikit/core/mvvm/base_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignInWidget extends BaseWidget<SignInProvider> {
  @override
  Widget bodyWidget(
      BuildContext context, SignInProvider viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: GlobalColors.background,
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
              return contentDesktopWidget(context, viewModel);
            }
            return SingleChildScrollView(
              child: contentMobileWidget(context,viewModel),
            );
          },
        ),
      )
    );
  }

  @override
  SignInProvider viewModelBuilder(BuildContext context) {
    return SignInProvider(context);
  }

  Widget contentDesktopWidget(BuildContext context,SignInProvider viewModel) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1200),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.appName,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.slogan,
                    style: const TextStyle(
                      fontSize: 18,
                      color: GlobalColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: 450,
                    child: SvgPicture.asset('assets/signin/main.svg',
                        semanticsLabel: ''),
                  )
                ],
              ),
            ),
            const SizedBox(width: 80),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: GlobalColors.primary.withOpacity(0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: _signInFormWidget(context, viewModel),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context,SignInProvider viewModel) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            AppLocalizations.of(context)!.appName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: GlobalColors.primary,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: GlobalColors.primary.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: _signInFormWidget(context, viewModel),
          ),
        ],
      ),
    );
  }

  Widget _signInFormWidget(BuildContext context,SignInProvider viewModel) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth > 600 ? 0 : 20;

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.signIn,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: GlobalColors.primary,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Ingresa tus credenciales para acceder',
              style: const TextStyle(
                fontSize: 14,
                color: GlobalColors.textSecondary,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            OutBorderTextFormField(
              labelText: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.emailHint,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Por favor ingrese un correo electrónico válido';
                } else {
                  return null;
                }
              },
              suffixWidget: SvgPicture.asset(
                'assets/signin/email.svg',
                width: 22,
                height: 22,
              ),
              controller: viewModel.emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              obscureText: true,
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.passwordHint,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Por favor ingrese una contraseña válida';
                } else {
                  return null;
                }
              },
              suffixWidget: SvgPicture.asset(
                'assets/signin/lock.svg',
                width: 22,
                height: 22,
              ),
              controller: viewModel.passwordController,
            ),
            const SizedBox(
              height: 16,
            ),
            // Recuérdame / ¿Olvidaste la contraseña? (responsivo)
            LayoutBuilder(builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 420;
              final remember = Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: viewModel.rememberMe,
                    onChanged: (v) => viewModel.rememberMe = v ?? false,
                  ),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.rememberMe,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
              final forgot = InkWell(
                child: Text(
                  AppLocalizations.of(context)!.forgetPwd,
                  style: const TextStyle(
                    color: GlobalColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).popAndPushNamed('/resetPwd');
                },
              );

              if (isNarrow) {
                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [remember, forgot],
                );
              }
              return Row(
                children: [
                  Expanded(child: remember),
                  forgot,
                ],
              );
            }),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              type: ButtonType.primary.type,
              btnText: AppLocalizations.of(context)!.signIn,
              height: 48,
              fontSize: 16,
              borderRadius: 8,
              onTap: () {
                viewModel.signIn(context);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                const Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: GlobalColors.border,
                    )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    AppLocalizations.of(context)!.or,
                    style: const TextStyle(
                      color: GlobalColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: GlobalColors.border,
                    )),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonWidget(
              color: Colors.white,
              borderColor: GlobalColors.border,
              borderRadius: 8,
              height: 48,
              iconWidget: SvgPicture.asset(
                'assets/brand/brand-01.svg',
                width: 22,
                height: 22,
              ),
              btnText: AppLocalizations.of(context)!.signInWithGoogle,
              textColor: GlobalColors.text,
              onTap: () {
                viewModel.signInWithGoogle(context);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonWidget(
              color: Colors.white,
              borderColor: GlobalColors.border,
              borderRadius: 8,
              height: 48,
              iconWidget: SvgPicture.asset(
                'assets/brand/brand-03.svg',
                width: 22,
                height: 22,
              ),
              btnText: AppLocalizations.of(context)!.signInWithGithub,
              textColor: GlobalColors.text,
              onTap: () {
                viewModel.signInWithGithub(context);
              },
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.dontHaveAccount,
                  style: const TextStyle(
                    color: GlobalColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.signUp,
                    style: const TextStyle(
                      color: GlobalColors.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/signUp');
                  },
                )
              ],
            )
          ],
        ));
  }
}
