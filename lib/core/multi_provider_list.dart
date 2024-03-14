import 'package:movie_app/application/home/home_controller.dart';
import 'package:movie_app/application/movie_detail_controller.dart/movie_details_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderList {
  static List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(create: (_) => HomeController()),
    ChangeNotifierProvider(create: (_) => MovieDetailController()),
  ];
}
