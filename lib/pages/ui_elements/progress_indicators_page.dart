import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProgressIndicatorsPage extends LayoutWidget {
  const ProgressIndicatorsPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Column(
          children: [
            TitleCard(
              title: 'Progreso Circular',
              childWidget: _CircularProgressWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Progreso de Curso',
              childWidget: _CourseProgressWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Sistema de Niveles',
              childWidget: _LevelSystemWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Progreso por Pasos',
              childWidget: _StepProgressWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Progress Indicators';
  }
}

class _CircularProgressWidget extends StatelessWidget {
  final bool isMobile;

  const _CircularProgressWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indicadores circulares de progreso con porcentaje:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 20 : 32),

          Wrap(
            spacing: isMobile ? 16 : 32,
            runSpacing: isMobile ? 16 : 24,
            children: [
              _buildCircularProgress(25, 'Inicial', GlobalColors.danger, isMobile),
              _buildCircularProgress(50, 'En Progreso', GlobalColors.warn, isMobile),
              _buildCircularProgress(75, 'Avanzado', GlobalColors.info, isMobile),
              _buildCircularProgress(100, 'Completado', GlobalColors.success, isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress(int percentage, String label, Color color, bool isMobile) {
    double size = isMobile ? 100 : 120;

    return Column(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            children: [
              // Círculo de fondo
              SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: isMobile ? 8 : 10,
                  valueColor: AlwaysStoppedAnimation<Color>(color.withOpacity(0.2)),
                  backgroundColor: Colors.transparent,
                ),
              ),
              // Círculo de progreso
              SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: isMobile ? 8 : 10,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  backgroundColor: Colors.transparent,
                ),
              ),
              // Texto central
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: isMobile ? 8 : 12),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 13 : 14,
            fontWeight: FontWeight.w500,
            color: GlobalColors.text,
          ),
        ),
      ],
    );
  }
}

class _CourseProgressWidget extends StatelessWidget {
  final bool isMobile;

  const _CourseProgressWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tarjetas de progreso de curso:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          _buildCourseCard(
            'Introducción a Flutter',
            'Módulo 1 de 4',
            8,
            12,
            GlobalColors.primary,
            isMobile,
          ),
          SizedBox(height: isMobile ? 12 : 16),

          _buildCourseCard(
            'Desarrollo Web con React',
            'Módulo 3 de 5',
            15,
            20,
            GlobalColors.info,
            isMobile,
          ),
          SizedBox(height: isMobile ? 12 : 16),

          _buildCourseCard(
            'Base de Datos SQL',
            'Módulo 8 de 8',
            24,
            24,
            GlobalColors.success,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
    String title,
    String subtitle,
    int completed,
    int total,
    Color color,
    bool isMobile,
  ) {
    double percentage = (completed / total) * 100;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.border),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 15 : 16,
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.text,
                      ),
                    ),
                    SizedBox(height: isMobile ? 4 : 6),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        color: GlobalColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: percentage / 100,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 8 : 12),
              Text(
                '$completed/$total',
                style: TextStyle(
                  fontSize: isMobile ? 12 : 13,
                  fontWeight: FontWeight.w600,
                  color: GlobalColors.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LevelSystemWidget extends StatelessWidget {
  final bool isMobile;

  const _LevelSystemWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sistema de niveles y experiencia:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          _buildLevelCard(
            level: 5,
            currentXP: 750,
            requiredXP: 1000,
            color: GlobalColors.secondary,
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 16 : 20),

          // Sistema de estrellas
          _buildStarRating(4, isMobile),
        ],
      ),
    );
  }

  Widget _buildLevelCard({
    required int level,
    required int currentXP,
    required int requiredXP,
    required Color color,
    required bool isMobile,
  }) {
    double percentage = (currentXP / requiredXP) * 100;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Insignia de nivel
          Container(
            width: isMobile ? 60 : 80,
            height: isMobile ? 60 : 80,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nivel',
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$level',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: isMobile ? 12 : 16),

          // Información de XP
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experiencia',
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.text,
                  ),
                ),
                SizedBox(height: isMobile ? 6 : 8),
                Container(
                  height: isMobile ? 10 : 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: percentage / 100,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 6 : 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$currentXP XP',
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${requiredXP - currentXP} XP restante',
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        color: GlobalColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(int rating, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calificación del Curso',
            style: TextStyle(
              fontSize: isMobile ? 14 : 15,
              fontWeight: FontWeight.w600,
              color: GlobalColors.text,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Row(
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.only(right: isMobile ? 4 : 8),
                child: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: index < rating ? GlobalColors.warn : GlobalColors.border,
                  size: isMobile ? 28 : 32,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _StepProgressWidget extends StatelessWidget {
  final bool isMobile;

  const _StepProgressWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indicador de progreso por pasos:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          _buildStepIndicator(
            steps: [
              {'title': 'Información Personal', 'completed': true},
              {'title': 'Datos Académicos', 'completed': true},
              {'title': 'Documentos', 'completed': false},
              {'title': 'Confirmación', 'completed': false},
            ],
            currentStep: 2,
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator({
    required List<Map<String, dynamic>> steps,
    required int currentStep,
    required bool isMobile,
  }) {
    return Column(
      children: List.generate(steps.length, (index) {
        bool isCompleted = steps[index]['completed'] as bool;
        bool isCurrent = index == currentStep;
        bool isLast = index == steps.length - 1;

        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Círculo con número/check
                Container(
                  width: isMobile ? 36 : 40,
                  height: isMobile ? 36 : 40,
                  decoration: BoxDecoration(
                    color: isCompleted || isCurrent
                        ? GlobalColors.secondary
                        : GlobalColors.background,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted || isCurrent
                          ? GlobalColors.secondary
                          : GlobalColors.border,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: isMobile ? 18 : 20,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: isMobile ? 14 : 16,
                              fontWeight: FontWeight.bold,
                              color: isCurrent ? Colors.white : GlobalColors.textSecondary,
                            ),
                          ),
                  ),
                ),
                SizedBox(width: isMobile ? 12 : 16),

                // Título y descripción
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        steps[index]['title'] as String,
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 15,
                          fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                          color: isCompleted || isCurrent
                              ? GlobalColors.text
                              : GlobalColors.textSecondary,
                        ),
                      ),
                      if (isCurrent) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Paso actual',
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 13,
                            color: GlobalColors.secondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),

            // Línea conectora
            if (!isLast)
              Padding(
                padding: EdgeInsets.only(left: isMobile ? 17 : 19),
                child: Container(
                  width: 2,
                  height: isMobile ? 40 : 50,
                  color: isCompleted ? GlobalColors.secondary : GlobalColors.border,
                ),
              ),
          ],
        );
      }),
    );
  }
}
