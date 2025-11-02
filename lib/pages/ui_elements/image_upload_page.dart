import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ImageUploadPage extends LayoutWidget {
  const ImageUploadPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Column(
          children: [
            TitleCard(
              title: 'Carga de Imágenes',
              childWidget: _ImageUploadDemo(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Selector de Imágenes',
              childWidget: _ImagePickerDemo(isMobile: isMobile),
            ),
            const SizedBox(height: 20),
            TitleCard(
              title: 'Drag & Drop (Web/Desktop)',
              childWidget: _DragDropDemo(isMobile: isMobile),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Subir Imágenes';
  }
}

class _ImageUploadDemo extends StatefulWidget {
  final bool isMobile;

  const _ImageUploadDemo({required this.isMobile});

  @override
  State<_ImageUploadDemo> createState() => _ImageUploadDemoState();
}

class _ImageUploadDemoState extends State<_ImageUploadDemo> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  bool _isLoading = false;

  Future<void> _pickImage(ImageSource source) async {
    setState(() => _isLoading = true);

    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() => _selectedImage = image);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al seleccionar imagen: $e'),
            backgroundColor: GlobalColors.danger,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _clearImage() {
    setState(() => _selectedImage = null);
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
            'Seleccione una imagen desde su dispositivo:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.isMobile ? 16 : 24),

          if (_selectedImage == null) ...[
            Container(
              width: double.infinity,
              height: widget.isMobile ? 200 : 300,
              decoration: BoxDecoration(
                color: GlobalColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: GlobalColors.border,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: widget.isMobile ? 60 : 80,
                    color: GlobalColors.primary,
                  ),
                  SizedBox(height: widget.isMobile ? 12 : 16),
                  Text(
                    'No hay imagen seleccionada',
                    style: TextStyle(
                      fontSize: baseFontSize,
                      color: GlobalColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: widget.isMobile ? 6 : 8),
                  Text(
                    'Haga clic en los botones de abajo para seleccionar',
                    style: TextStyle(
                      fontSize: widget.isMobile ? 12 : 14,
                      color: GlobalColors.textSecondary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            Container(
              width: double.infinity,
              height: widget.isMobile ? 200 : 300,
              decoration: BoxDecoration(
                color: GlobalColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: GlobalColors.border),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: kIsWeb
                    ? Image.network(
                        _selectedImage!.path,
                        fit: BoxFit.contain,
                      )
                    : Image.file(
                        File(_selectedImage!.path),
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            SizedBox(height: widget.isMobile ? 8 : 12),
            Text(
              'Archivo: ${_selectedImage!.name}',
              style: TextStyle(
                fontSize: widget.isMobile ? 12 : 14,
                color: GlobalColors.textSecondary,
              ),
            ),
          ],

          SizedBox(height: widget.isMobile ? 16 : 24),

          if (_isLoading)
            const Center(child: CircularProgressIndicator())
          else
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (!kIsWeb) ...[
                  ButtonWidget(
                    btnText: 'Cámara',
                    type: ButtonType.primary.type,
                    iconWidget: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                    fontSize: widget.isMobile ? 13 : 14,
                    height: widget.isMobile ? 40 : 44,
                    onTap: () => _pickImage(ImageSource.camera),
                  ),
                ],
                ButtonWidget(
                  btnText: 'Galería',
                  type: ButtonType.secondary.type,
                  iconWidget: const Icon(Icons.photo_library, color: Colors.white, size: 18),
                  fontSize: widget.isMobile ? 13 : 14,
                  height: widget.isMobile ? 40 : 44,
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
                if (_selectedImage != null)
                  ButtonWidget(
                    btnText: 'Limpiar',
                    type: ButtonType.danger.type,
                    iconWidget: const Icon(Icons.delete_outline, color: Colors.white, size: 18),
                    fontSize: widget.isMobile ? 13 : 14,
                    height: widget.isMobile ? 40 : 44,
                    onTap: _clearImage,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _ImagePickerDemo extends StatelessWidget {
  final bool isMobile;

  const _ImagePickerDemo({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double baseFontSize = isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ejemplos de diferentes tipos de selectores:',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 16 : 24),
          _buildImagePlaceholder(context, 'Foto de Perfil', Icons.account_circle, isMobile),
          SizedBox(height: isMobile ? 12 : 16),
          _buildImagePlaceholder(context, 'Banner', Icons.panorama, isMobile),
          SizedBox(height: isMobile ? 12 : 16),
          _buildImagePlaceholder(context, 'Logo', Icons.business, isMobile),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(BuildContext context, String label, IconData icon, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: GlobalColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: GlobalColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: isMobile ? 60 : 80,
            height: isMobile ? 60 : 80,
            decoration: BoxDecoration(
              color: GlobalColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: isMobile ? 30 : 40, color: GlobalColors.primary),
          ),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: GlobalColors.text,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'PNG, JPG o JPEG (max. 5MB)',
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: GlobalColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: isMobile ? 80 : 100,
            height: isMobile ? 32 : 36,
            child: ButtonWidget(
              btnText: 'Subir',
              type: ButtonType.info.type,
              fontSize: isMobile ? 12 : 13,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Funcionalidad de subir imagen')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DragDropDemo extends StatefulWidget {
  final bool isMobile;

  const _DragDropDemo({required this.isMobile});

  @override
  State<_DragDropDemo> createState() => _DragDropDemoState();
}

class _DragDropDemoState extends State<_DragDropDemo> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    double baseFontSize = widget.isMobile ? 14 : 16;

    return Padding(
      padding: EdgeInsets.all(widget.isMobile ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS
                ? 'Arrastre y suelte archivos aquí:'
                : 'Drag & Drop no disponible en dispositivos móviles',
            style: TextStyle(
              fontSize: baseFontSize,
              color: GlobalColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: widget.isMobile ? 16 : 24),
          DragTarget<String>(
            onWillAccept: (data) {
              setState(() => _isDragging = true);
              return true;
            },
            onLeave: (data) {
              setState(() => _isDragging = false);
            },
            onAccept: (data) {
              setState(() => _isDragging = false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Imagen recibida (demo)'),
                  backgroundColor: GlobalColors.success,
                ),
              );
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: double.infinity,
                height: widget.isMobile ? 150 : 200,
                decoration: BoxDecoration(
                  color: _isDragging
                      ? GlobalColors.secondary.withOpacity(0.1)
                      : GlobalColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isDragging ? GlobalColors.secondary : GlobalColors.border,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _isDragging ? Icons.file_download : Icons.cloud_upload_outlined,
                      size: widget.isMobile ? 50 : 60,
                      color: _isDragging ? GlobalColors.secondary : GlobalColors.primary,
                    ),
                    SizedBox(height: widget.isMobile ? 10 : 12),
                    Text(
                      _isDragging
                          ? 'Suelte el archivo aquí'
                          : 'Arrastre archivos aquí',
                      style: TextStyle(
                        fontSize: baseFontSize,
                        color: GlobalColors.text,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'o haga clic para seleccionar',
                      style: TextStyle(
                        fontSize: widget.isMobile ? 12 : 14,
                        color: GlobalColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
