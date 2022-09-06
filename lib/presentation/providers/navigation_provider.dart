import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, PageModel>(
  (ref) => NavigationNotifier(),
);

enum NavigationBarEvent { HOME, NEWS, LEAGUES, FOLLOWING, MORE }

class NavigationNotifier extends StateNotifier<PageModel> {
  static const defaultPage = PageModel(page: NavigationBarEvent.HOME, index: 0);
  NavigationNotifier() : super(defaultPage);

  void selectPage(int i) {
    switch (i) {
      case 0:
        state = PageModel(page: NavigationBarEvent.HOME, index: i);
        break;
      case 1:
        state = PageModel(page: NavigationBarEvent.LEAGUES, index: i);
        break;
      case 2:
        state = PageModel(page: NavigationBarEvent.NEWS, index: i);
        break;
      case 3:
        state = PageModel(page: NavigationBarEvent.FOLLOWING, index: i);
        break;
      case 4:
        state = PageModel(page: NavigationBarEvent.MORE, index: i);
        break;
    }
  }
}

class PageModel {
  final NavigationBarEvent page;
  final index;
  const PageModel({required this.index, required this.page});
}
