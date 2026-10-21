import 'package:flutter/material.dart';
import 'base_url.dart';

Widget moduleImage(String imagePath,
    {Color color, double height, double width}) {
  final path = imagePath?.trim() ?? '';

  Widget fallback() => SizedBox(
        height: height,
        width: width,
        child: Center(
          widthFactor: 1,
          heightFactor: 1,
          child: Icon(Icons.broken_image, color: color),
        ),
      );

  if (path.isEmpty) return fallback();

  final uri = Uri.tryParse(path);
  final relativePath = path.replaceFirst(RegExp(r'^/+'), '');
  final url = uri != null && (uri.hasScheme || uri.hasAuthority)
      ? path
      : AppUrl.base_url.replaceFirst(RegExp(r'/+$'), '') +
          '/' +
          (relativePath.startsWith('ModuleImages/')
              ? relativePath
              : 'ModuleImages/$relativePath');

  return Image.network(
    url,
    color: color,
    height: height,
    width: width,
    errorBuilder: (context, error, stackTrace) => fallback(),
  );
}
