// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movie_app/prsentation/screens/home/widget/now_showing.dart';
import 'package:movie_app/prsentation/screens/home/widget/popular_widget.dart';
import 'package:movie_app/prsentation/widgets/appbar_widgets.dart';
import 'package:movie_app/prsentation/widgets/button/button.dart';
import 'package:movie_app/prsentation/widgets/padding/main_padding.dart';
import 'package:movie_app/prsentation/widgets/sizes.dart';
import 'package:movie_app/prsentation/widgets/style/styles.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        
        title: 'Film Show',
        isLeading: true,
      ),
      body: MainPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Now Showing',
                  style: normalHeadStyle,
                ),
                button('See More')
    
              ],
            ),
            kHeight10,
            nowShowing(),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'Popular',
                  style: normalHeadStyle,
                ),
                      button('See More')
              ],
            ),
            kHeight10,
            popularWidget(context),

          ],
        ),
      ),
    );
  }
}
