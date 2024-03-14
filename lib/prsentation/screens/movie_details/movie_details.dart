import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/application/home/home_controller.dart';
import 'package:movie_app/application/movie_detail_controller.dart/movie_details_controller.dart';
import 'package:movie_app/prsentation/widgets/image/custom_image.dart';
import 'package:movie_app/prsentation/widgets/sizes.dart';
import 'package:provider/provider.dart';

class ScreenMovieDetails extends StatelessWidget {
  final int id;

  const ScreenMovieDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie Details'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<MovieDetailController>(
            builder: (context, value, child) {
              log("${value.movieDetail?.summary}");
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomImages(
                        fit: BoxFit.fill,
                        height: MediaQuery.sizeOf(context).height * .30,
                        width: MediaQuery.sizeOf(context).width * .80,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        url: value.movieDetail?.image?.original),
                  ),
                  kHeight15,
                  Text(
                    context.read<MovieDetailController>().movieDetail?.name ??
                        '',
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Rating',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      kWidth10,
                      Text(value.movieDetail?.rating?.average.toString() ?? ''),
                      kWidth10,
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      )
                    ],
                  ),
                  Text(extractTextFromHtml(value.movieDetail?.summary ?? '')),
                  Text(value.movieDetail?.language ?? ''),
                  kHeight15,
                  const Text(
                    'Cast Details',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 220,
                    child: Consumer<MovieDetailController>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: value.castList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = value.castList[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(right: 5, left: 5),
                                  child: CustomImages(
                                    height: 170,
                                    width: 150,
                                    borderRadius: BorderRadius.circular(10),
                                    url: data.person?.image?.medium ?? '',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  data.person?.name ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}

String extractTextFromHtml(String htmlString) {
  RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
  return htmlString.replaceAll(exp, '');
}
