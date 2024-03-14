// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movie_app/application/home/home_controller.dart';
import 'package:movie_app/application/movie_detail_controller.dart/movie_details_controller.dart';
import 'package:movie_app/prsentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/prsentation/widgets/image/custom_image.dart';
import 'package:movie_app/prsentation/widgets/shimmer/shimmer_widget.dart';
import 'package:provider/provider.dart';

Widget popularWidget(BuildContext context) {
      final orientation = MediaQuery.of(context).orientation;

  return Expanded(
    child: Consumer<HomeController>(
      builder: (context, value, child) {
        return GridView.builder(
          shrinkWrap: true,
          itemCount: value.homeList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            final data = value.homeList[index];
            return ShimmerWidget(
              isLoading: value.isLoading,
              child: InkWell(
                onTap: () async {
                  await context
                      .read<MovieDetailController>()
                      .initstateOfMovieDetails(data.id ?? 0);
                  await context
                      .read<MovieDetailController>()
                      .initStateCast(data.id ?? 0);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenMovieDetails(id: data.id!),
                    ),
                  );
                },
                child: Card(
                  child: GridTile(
                    footer: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        data.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, color: Colors.white),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: CustomImages(
                        borderRadius: BorderRadius.circular(10),
                        url: data.image?.medium ?? '',
                      ),
                    ),
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
