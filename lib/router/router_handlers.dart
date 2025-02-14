import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: (context, params) {
    final page = params['page']!.first;

    if (page != '/') {
      return const HomePage();
    }
    return null;
  },
);
