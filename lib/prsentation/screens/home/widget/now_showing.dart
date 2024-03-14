// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movie_app/application/home/home_controller.dart';
import 'package:movie_app/application/movie_detail_controller.dart/movie_details_controller.dart';
import 'package:movie_app/prsentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/prsentation/widgets/image/custom_image.dart';
import 'package:movie_app/prsentation/widgets/shimmer/shimmer_widget.dart';
import 'package:movie_app/prsentation/widgets/style/styles.dart';
import 'package:provider/provider.dart';

Widget nowShowing() {
  return SizedBox(
    height: 220,
    child: Consumer<HomeController>(
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.homeList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: CustomImages(
                        height: 170,
                        width: 150,
                        borderRadius: BorderRadius.circular(10),
                        url: data.image?.medium ?? '',
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      data.name ?? '',
                      style: titleName
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 15),
                        Icon(Icons.star, color: Colors.amber, size: 15),
                        Text(
                          '9.1/10 IMDb',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
