import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextFieldPage extends LayoutWidget {
  const TextFieldPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        double baseFontSize = isMobile ? 14 : 16;

        return Column(
          children: [
            TitleCard(
              title: 'Text Fields Básicos',
              childWidget: _basicTextFieldsWidget(context, isMobile, baseFontSize),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Text Fields con Iconos',
              childWidget: _iconTextFieldsWidget(context, isMobile, baseFontSize),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Text Fields Especiales',
              childWidget: _specialTextFieldsWidget(context, isMobile, baseFontSize),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Text Areas',
              childWidget: _textAreasWidget(context, isMobile, baseFontSize),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  Widget _basicTextFieldsWidget(BuildContext context, bool isMobile, double baseFontSize) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingrese texto en diferentes formatos:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          OutBorderTextFormField(
            labelText: 'Texto Normal',
            hintText: 'Ingrese texto aquí',
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Email',
            hintText: 'ejemplo@correo.com',
            keyboardType: TextInputType.emailAddress,
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Teléfono',
            hintText: '+502 1234 5678',
            keyboardType: TextInputType.phone,
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Número',
            hintText: '123456',
            keyboardType: TextInputType.number,
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Contraseña',
            hintText: 'Ingrese su contraseña',
            obscureText: true,
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget _iconTextFieldsWidget(BuildContext context, bool isMobile, double baseFontSize) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Text Fields con iconos personalizados:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          OutBorderTextFormField(
            labelText: 'Usuario',
            hintText: 'Ingrese su usuario',
            suffixWidget: const Icon(Icons.person_outline, color: GlobalColors.primary),
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Email',
            hintText: 'ejemplo@correo.com',
            keyboardType: TextInputType.emailAddress,
            suffixWidget: const Icon(Icons.email_outlined, color: GlobalColors.secondary),
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Buscar',
            hintText: 'Buscar...',
            suffixWidget: const Icon(Icons.search, color: GlobalColors.info),
            controller: TextEditingController(),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Ubicación',
            hintText: 'Ingrese su dirección',
            suffixWidget: const Icon(Icons.location_on_outlined, color: GlobalColors.danger),
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget _specialTextFieldsWidget(BuildContext context, bool isMobile, double baseFontSize) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Text Fields con estados especiales:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          OutBorderTextFormField(
            labelText: 'Campo Deshabilitado',
            hintText: 'Este campo está deshabilitado',
            controller: TextEditingController(text: 'Valor no editable'),
            enabled: false,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutBorderTextFormField(
                labelText: 'URL',
                hintText: 'https://ejemplo.com',
                keyboardType: TextInputType.url,
                suffixWidget: const Icon(Icons.link, color: GlobalColors.info),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 4),
              Text(
                'Ingrese una URL válida',
                style: TextStyle(
                  fontSize: isMobile ? 11 : 12,
                  color: GlobalColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          OutBorderTextFormField(
            labelText: 'Fecha',
            hintText: 'DD/MM/YYYY',
            suffixWidget: const Icon(Icons.calendar_today, color: GlobalColors.primary),
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }

  Widget _textAreasWidget(BuildContext context, bool isMobile, double baseFontSize) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Áreas de texto multilínea:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Descripción',
              hintText: 'Ingrese una descripción detallada...',
              labelStyle: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: GlobalColors.primary,
              ),
              hintStyle: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: GlobalColors.textSecondary.withOpacity(0.6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: GlobalColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: GlobalColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: GlobalColors.primary, width: 2),
              ),
              contentPadding: EdgeInsets.all(isMobile ? 12 : 16),
            ),
            style: TextStyle(fontSize: isMobile ? 14 : 16),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          TextField(
            maxLines: 6,
            decoration: InputDecoration(
              labelText: 'Comentarios',
              hintText: 'Escriba sus comentarios aquí...',
              labelStyle: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: GlobalColors.primary,
              ),
              hintStyle: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: GlobalColors.textSecondary.withOpacity(0.6),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: GlobalColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: GlobalColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: GlobalColors.secondary, width: 2),
              ),
              contentPadding: EdgeInsets.all(isMobile ? 12 : 16),
            ),
            style: TextStyle(fontSize: isMobile ? 14 : 16),
          ),
        ],
      ),
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Campos de Texto';
  }
}
