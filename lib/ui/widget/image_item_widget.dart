import 'package:flutter/material.dart';

import '../../data/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  final double borderValue;
  final ImageItem imageItem;

  const ImageItemWidget({
    super.key,
    required this.borderValue,
    required this.imageItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderValue),
      child: Image.network(
        imageItem.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
