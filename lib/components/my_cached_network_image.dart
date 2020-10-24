import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String url;
  final double borderRadius;
  final double imageWidth;
  final double imageHeight;

  MyCachedNetworkImage({
    @required this.url,
    this.borderRadius = 0,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(this.borderRadius),
          topRight: Radius.circular(this.borderRadius)
      ),
      child: CachedNetworkImage(
        height: this.imageHeight,
        width: this.imageWidth,
        imageUrl: this.url,
        fit: BoxFit.cover,
        placeholder: (context, _) => Shimmer.fromColors(
          child: Container(color: Colors.white, height: 250),
          baseColor: Colors.white,
          highlightColor: Colors.grey,
        ),
        errorWidget: (context, _, __) => Icon(
          Icons.error,
          color: Color(0xFF2F8D46),
          size: 50,
        ),
      ),
    );
  }
}
