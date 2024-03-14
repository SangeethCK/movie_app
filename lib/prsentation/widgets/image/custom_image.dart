import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/prsentation/widgets/shimmer/shimmer_widget.dart';


class CustomImages extends StatelessWidget {
  const CustomImages({
    super.key,
    required this.url,
    this.appendBaseUrl = true,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.borderRadius = BorderRadius.zero,
    this.placeHolder,
    this.local = false,
    this.fit = BoxFit.cover,
    this.isLoading = false,
  });

  final String? url;
  final bool local;
  final String? placeHolder;
  final double? width, height;
  final int? cacheWidth, cacheHeight;
  final BorderRadius borderRadius;
  final BoxFit? fit;
  final bool appendBaseUrl;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: isLoading
          ? ShimmerWidget(width: width, height: height)
          : local
              ? Image.asset(
                  (url ?? ''),
                  fit: fit,
                  width: width,
                  height: height,
                  cacheHeight: cacheHeight,
                  cacheWidth: cacheWidth,
                )
              : Builder(
                  builder: (context) {
                    final String imageUrl = appendBaseUrl
                        ? ((url ?? ''))
                        : (url ?? '');
// imageBaseUrl + 
                    return CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: fit,
                      width: width,
                      height: height,
                      memCacheWidth: cacheWidth?.toInt(),
                      memCacheHeight: cacheHeight?.toInt(),
                      progressIndicatorBuilder:
                          (context, child, downloadProgress) {
                        return ShimmerWidget(width: width, height: height);
                      },
                      errorWidget: (context, error, stackTrace) {
                        if (placeHolder != null) {
                          return Image.asset(
                            placeHolder!,
                            fit: BoxFit.cover,
                            width: width,
                            height: height,
                            cacheHeight: cacheHeight,
                            cacheWidth: cacheWidth,
                          );
                        }
                        return SizedBox(
                          width: width,
                          height: height,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Transform.scale(
                              scale: .6,
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
