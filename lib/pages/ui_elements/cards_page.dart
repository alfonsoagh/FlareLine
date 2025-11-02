import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CardsPage extends LayoutWidget {
  const CardsPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Column(
          children: [
            TitleCard(
              title: 'Cards Básicos',
              childWidget: _BasicCardsWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Cards con Imágenes',
              childWidget: _ImageCardsWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Cards Informativos',
              childWidget: _InfoCardsWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Cards de Estadísticas',
              childWidget: _StatsCardsWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Tarjetas';
  }
}

class _BasicCardsWidget extends StatelessWidget {
  final bool isMobile;

  const _BasicCardsWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Wrap(
        spacing: isMobile ? 12 : 20,
        runSpacing: isMobile ? 12 : 20,
        children: [
          _buildBasicCard(
            'Card Simple',
            'Este es un card básico con título y descripción.',
            GlobalColors.primary,
            isMobile,
            baseFontSize,
          ),
          _buildBasicCard(
            'Card con Color',
            'Card con color secundario para destacar información.',
            GlobalColors.secondary,
            isMobile,
            baseFontSize,
          ),
          _buildBasicCard(
            'Card de Éxito',
            'Utilice este estilo para mensajes de confirmación.',
            GlobalColors.success,
            isMobile,
            baseFontSize,
          ),
          _buildBasicCard(
            'Card de Información',
            'Ideal para mostrar información adicional al usuario.',
            GlobalColors.info,
            isMobile,
            baseFontSize,
          ),
        ],
      ),
    );
  }

  Widget _buildBasicCard(
    String title,
    String description,
    Color accentColor,
    bool isMobile,
    double baseFontSize,
  ) {
    double cardWidth = isMobile ? double.infinity : 280;

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.border),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: GlobalColors.text,
            ),
          ),
          SizedBox(height: isMobile ? 6 : 8),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: GlobalColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageCardsWidget extends StatelessWidget {
  final bool isMobile;

  const _ImageCardsWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Wrap(
        spacing: isMobile ? 12 : 20,
        runSpacing: isMobile ? 12 : 20,
        children: [
          _buildImageCard(
            'Proyecto Alpha',
            'Desarrollo de aplicación web moderna',
            Icons.web,
            GlobalColors.primary,
            isMobile,
          ),
          _buildImageCard(
            'Proyecto Beta',
            'Sistema de gestión empresarial',
            Icons.business_center,
            GlobalColors.secondary,
            isMobile,
          ),
          _buildImageCard(
            'Proyecto Gamma',
            'Aplicación móvil multiplataforma',
            Icons.phone_android,
            GlobalColors.info,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(
    String title,
    String description,
    IconData icon,
    Color color,
    bool isMobile,
  ) {
    double cardWidth = isMobile ? double.infinity : 300;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.border),
        boxShadow: [
          BoxShadow(
            color: GlobalColors.primary.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: isMobile ? 140 : 160,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Icon(icon, size: isMobile ? 60 : 80, color: color),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 16 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.text,
                  ),
                ),
                SizedBox(height: isMobile ? 6 : 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    color: GlobalColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: isMobile ? 12 : 16),
                SizedBox(
                  width: double.infinity,
                  height: isMobile ? 36 : 40,
                  child: ButtonWidget(
                    btnText: 'Ver más',
                    type: ButtonType.primary.type,
                    fontSize: isMobile ? 13 : 14,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCardsWidget extends StatelessWidget {
  final bool isMobile;

  const _InfoCardsWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        children: [
          _buildInfoCard(
            'Información Importante',
            'Este es un mensaje informativo para el usuario. Puede contener detalles relevantes sobre alguna acción o estado del sistema.',
            Icons.info_outline,
            GlobalColors.info,
            isMobile,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          _buildInfoCard(
            'Advertencia',
            'Tenga cuidado con esta acción. Asegúrese de revisar todos los datos antes de continuar.',
            Icons.warning_amber_outlined,
            GlobalColors.warn,
            isMobile,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          _buildInfoCard(
            'Error Crítico',
            'Ha ocurrido un error que requiere atención inmediata. Por favor contacte al administrador.',
            Icons.error_outline,
            GlobalColors.danger,
            isMobile,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          _buildInfoCard(
            'Operación Exitosa',
            'La operación se ha completado correctamente. Todos los cambios han sido guardados.',
            Icons.check_circle_outline,
            GlobalColors.success,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String message,
    IconData icon,
    Color color,
    bool isMobile,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: isMobile ? 24 : 28),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 15 : 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                SizedBox(height: isMobile ? 4 : 6),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    color: GlobalColors.text,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsCardsWidget extends StatelessWidget {
  final bool isMobile;

  const _StatsCardsWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Wrap(
        spacing: isMobile ? 12 : 20,
        runSpacing: isMobile ? 12 : 20,
        children: [
          _buildStatCard(
            'Total Usuarios',
            '1,234',
            '+12.5%',
            Icons.people_outline,
            GlobalColors.primary,
            true,
            isMobile,
          ),
          _buildStatCard(
            'Ventas',
            'Q15,678',
            '+8.2%',
            Icons.shopping_cart_outlined,
            GlobalColors.success,
            true,
            isMobile,
          ),
          _buildStatCard(
            'Productos',
            '567',
            '-3.1%',
            Icons.inventory_2_outlined,
            GlobalColors.danger,
            false,
            isMobile,
          ),
          _buildStatCard(
            'Proyectos',
            '89',
            '+15.7%',
            Icons.folder_outlined,
            GlobalColors.info,
            true,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    String change,
    IconData icon,
    Color color,
    bool isPositive,
    bool isMobile,
  ) {
    double cardWidth = isMobile ? double.infinity : 260;

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.border),
        boxShadow: [
          BoxShadow(
            color: GlobalColors.primary.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 10 : 12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: isMobile ? 22 : 26),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isPositive
                      ? GlobalColors.success.withOpacity(0.1)
                      : GlobalColors.danger.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(
                      isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                      size: isMobile ? 12 : 14,
                      color: isPositive ? GlobalColors.success : GlobalColors.danger,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      change,
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        fontWeight: FontWeight.w600,
                        color: isPositive ? GlobalColors.success : GlobalColors.danger,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: GlobalColors.textSecondary,
            ),
          ),
          SizedBox(height: isMobile ? 4 : 6),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: GlobalColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
