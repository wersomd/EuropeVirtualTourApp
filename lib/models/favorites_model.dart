import 'package:flutter/foundation.dart';
import 'package:wersomd_app/models/tab_bar.model.dart';

class FavoritesModel with ChangeNotifier {
  final List<TabBarModel> _favorites = [];

  List<TabBarModel> get favorites => _favorites;

  void add(TabBarModel item) {
    _favorites.add(item);
    notifyListeners();
  }

  void remove(TabBarModel item) {
    _favorites.remove(item);
    notifyListeners();
  }

  bool isFavorite(TabBarModel item) {
    return _favorites.contains(item);
  }
}
