import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoadingStatesPage extends LayoutWidget {
  const LoadingStatesPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Column(
          children: [
            TitleCard(
              title: 'Spinners - Indicadores de Carga',
              childWidget: _SpinnersWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Progress Bars - Barras de Progreso',
              childWidget: _ProgressBarsWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Skeleton Loaders',
              childWidget: _SkeletonLoadersWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Loading Overlays',
              childWidget: _LoadingOverlaysWidget(isMobile: isMobile),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Loading States';
  }
}

class _SpinnersWidget extends StatelessWidget {
  final bool isMobile;

  const _SpinnersWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Diferentes tamaños y colores de indicadores circulares:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 20 : 32),

          // Tamaños
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSpinnerItem('Pequeño', 20, GlobalColors.primary, isMobile),
              _buildSpinnerItem('Mediano', 32, GlobalColors.secondary, isMobile),
              _buildSpinnerItem('Grande', 48, GlobalColors.info, isMobile),
            ],
          ),

          SizedBox(height: isMobile ? 24 : 40),

          // Colores de la paleta CETAM
          Text(
            'Colores de la paleta CETAM:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          Wrap(
            spacing: isMobile ? 16 : 32,
            runSpacing: isMobile ? 16 : 24,
            children: [
              _buildSpinnerItem('Primary', 32, GlobalColors.primary, isMobile),
              _buildSpinnerItem('Secondary', 32, GlobalColors.secondary, isMobile),
              _buildSpinnerItem('Success', 32, GlobalColors.success, isMobile),
              _buildSpinnerItem('Info', 32, GlobalColors.info, isMobile),
              _buildSpinnerItem('Warning', 32, GlobalColors.warn, isMobile),
              _buildSpinnerItem('Danger', 32, GlobalColors.danger, isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpinnerItem(String label, double size, Color color, bool isMobile) {
    return Column(
      children: [
        Container(
          width: isMobile ? 70 : 100,
          height: isMobile ? 70 : 100,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                strokeWidth: size > 30 ? 4 : 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
        ),
        SizedBox(height: isMobile ? 6 : 8),
        Text(
          label,
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            color: GlobalColors.text,
          ),
        ),
      ],
    );
  }
}

class _ProgressBarsWidget extends StatefulWidget {
  final bool isMobile;

  const _ProgressBarsWidget({required this.isMobile});

  @override
  State<_ProgressBarsWidget> createState() => _ProgressBarsWidgetState();
}

class _ProgressBarsWidgetState extends State<_ProgressBarsWidget> {
  double _progress1 = 0.3;
  double _progress2 = 0.65;
  double _progress3 = 0.85;

  @override
  Widget build(BuildContext context) {
    double baseFontSize = widget.isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(widget.isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Barras de progreso lineales con diferentes estilos:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.isMobile ? 16 : 24),

          // Barra básica
          _buildProgressBar(
            'Progreso Básico',
            _progress1,
            GlobalColors.primary,
            '30%',
            widget.isMobile,
          ),
          SizedBox(height: widget.isMobile ? 16 : 20),

          _buildProgressBar(
            'En Proceso',
            _progress2,
            GlobalColors.info,
            '65%',
            widget.isMobile,
          ),
          SizedBox(height: widget.isMobile ? 16 : 20),

          _buildProgressBar(
            'Casi Completo',
            _progress3,
            GlobalColors.success,
            '85%',
            widget.isMobile,
          ),
          SizedBox(height: widget.isMobile ? 20 : 32),

          // Barra indeterminada
          Text(
            'Progreso Indeterminado (sin porcentaje conocido):',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.isMobile ? 12 : 16),

          Container(
            height: 8,
            decoration: BoxDecoration(
              color: GlobalColors.background,
              borderRadius: BorderRadius.circular(4),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(GlobalColors.secondary),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(String label, double value, Color color, String percentage, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: GlobalColors.text,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              percentage,
              style: TextStyle(
                fontSize: isMobile ? 12 : 13,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: GlobalColors.background,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

class _SkeletonLoadersWidget extends StatelessWidget {
  final bool isMobile;

  const _SkeletonLoadersWidget({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skeleton loaders para contenido en carga:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),

          // Skeleton de lista
          _buildSkeletonCard(isMobile),
          SizedBox(height: isMobile ? 12 : 16),
          _buildSkeletonCard(isMobile),
          SizedBox(height: isMobile ? 12 : 16),
          _buildSkeletonCard(isMobile),
        ],
      ),
    );
  }

  Widget _buildSkeletonCard(bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: GlobalColors.border),
      ),
      child: Row(
        children: [
          _buildShimmer(
            width: isMobile ? 50 : 60,
            height: isMobile ? 50 : 60,
            borderRadius: 8,
          ),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildShimmer(
                  width: double.infinity,
                  height: isMobile ? 14 : 16,
                  borderRadius: 4,
                ),
                SizedBox(height: isMobile ? 6 : 8),
                _buildShimmer(
                  width: isMobile ? 120 : 150,
                  height: isMobile ? 12 : 14,
                  borderRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer({required double width, required double height, required double borderRadius}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: GlobalColors.background,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: const _ShimmerEffect(),
    );
  }
}

class _ShimmerEffect extends StatefulWidget {
  const _ShimmerEffect();

  @override
  State<_ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<_ShimmerEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                GlobalColors.background,
                GlobalColors.border.withOpacity(0.5),
                GlobalColors.background,
              ],
              stops: [
                _controller.value - 0.3,
                _controller.value,
                _controller.value + 0.3,
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LoadingOverlaysWidget extends StatefulWidget {
  final bool isMobile;

  const _LoadingOverlaysWidget({required this.isMobile});

  @override
  State<_LoadingOverlaysWidget> createState() => _LoadingOverlaysWidgetState();
}

class _LoadingOverlaysWidgetState extends State<_LoadingOverlaysWidget> {
  bool _isLoading = false;

  void _showLoadingOverlay() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseFontSize = widget.isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(widget.isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overlay de carga que bloquea la interacción:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.isMobile ? 16 : 24),

          Stack(
            children: [
              Container(
                width: double.infinity,
                height: widget.isMobile ? 150 : 200,
                padding: EdgeInsets.all(widget.isMobile ? 16 : 24),
                decoration: BoxDecoration(
                  color: GlobalColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: GlobalColors.border),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contenido de ejemplo',
                      style: TextStyle(
                        fontSize: widget.isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: GlobalColors.text,
                      ),
                    ),
                    SizedBox(height: widget.isMobile ? 12 : 16),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _showLoadingOverlay,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.secondary,
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 20 : 32,
                          vertical: widget.isMobile ? 10 : 12,
                        ),
                      ),
                      child: Text(
                        'Mostrar Loading',
                        style: TextStyle(
                          fontSize: widget.isMobile ? 13 : 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (_isLoading)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(widget.isMobile ? 20 : 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: AlwaysStoppedAnimation<Color>(GlobalColors.secondary),
                              ),
                            ),
                            SizedBox(height: widget.isMobile ? 12 : 16),
                            Text(
                              'Cargando...',
                              style: TextStyle(
                                fontSize: widget.isMobile ? 14 : 16,
                                fontWeight: FontWeight.w500,
                                color: GlobalColors.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
