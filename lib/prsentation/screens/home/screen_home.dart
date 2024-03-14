// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movie_app/application/home/home_controller.dart';
import 'package:movie_app/application/movie_detail_controller.dart/movie_details_controller.dart';
import 'package:movie_app/prsentation/screens/movie_details/movie_details.dart';
import 'package:movie_app/prsentation/widgets/appbar_widgets.dart';
import 'package:movie_app/prsentation/widgets/image/custom_image.dart';
import 'package:movie_app/prsentation/widgets/padding/main_padding.dart';
import 'package:movie_app/prsentation/widgets/sizes.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeController>().loadHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppbarWidget(title: 'Film Show',isLeading: true,),
      body: MainPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Now Showing',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('See More'),
                ),
              ],
            ),
            kHeight10,
            SizedBox(
              height: 220,
              child: Consumer<HomeController>(
                builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.homeList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = value.homeList[index];
                      return InkWell(
                        onTap: () async{
                             await context
                              .read<MovieDetailController>()
                              .initstateOfMovieDetails(data.id ?? 0);
                          await context
                              .read<MovieDetailController>()
                              .initStateCast(data.id ?? 0);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScreenMovieDetails(id: data.id!),
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
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
                      );
                    },
                  );
                },
              ),
            ),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('See More'))
              ],
            ),
            kHeight10,
            Expanded(
              child: Consumer<HomeController>(
                builder: (context, value, child) {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: value.homeList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 2 : 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final data = value.homeList[index];
                      return InkWell(
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
                              builder: (context) =>
                                  ScreenMovieDetails(id: data.id!),
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
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
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
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
