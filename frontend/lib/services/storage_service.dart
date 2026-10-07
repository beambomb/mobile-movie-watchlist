import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/watchlist_item.dart';

class StorageService {
  static const String storageKey = 'movie_watchlist_v1';

  final SharedPreferences? prefs;

  StorageService({this.prefs});

  Future<SharedPreferences> _getPrefs() async {
    return prefs ?? await SharedPreferences.getInstance();
  }

  Future<List<WatchlistItem>> getWatchlist() async {
    try {
      final prefs = await _getPrefs();
      final rawData = prefs.getString(storageKey);
      if (rawData == null || rawData.trim().isEmpty) {
        return [];
      }
      final decoded = jsonDecode(rawData);
      if (decoded is! List) {
        return [];
      }
      return decoded
          .whereType<Map<String, dynamic>>()
          .map((item) => WatchlistItem.fromJson(item))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<bool> saveWatchlist(List<WatchlistItem> items) async {
    try {
      final prefs = await _getPrefs();
      final encoded = jsonEncode(items.map((e) => e.toJson()).toList());
      return await prefs.setString(storageKey, encoded);
    } catch (_) {
      return false;
    }
  }

  Future<bool> addItem(WatchlistItem item) async {
    final currentList = await getWatchlist();
    final index = currentList.indexWhere((element) => element.id == item.id || element.showId == item.showId);
    if (index >= 0) {
      currentList[index] = item;
    } else {
      currentList.add(item);
    }
    return await saveWatchlist(currentList);
  }

  Future<bool> updateItem(WatchlistItem item) async {
    final currentList = await getWatchlist();
    final index = currentList.indexWhere((element) => element.id == item.id);
    if (index >= 0) {
      currentList[index] = item;
      return await saveWatchlist(currentList);
    }
    return false;
  }

  Future<bool> deleteItem(String id) async {
    final currentList = await getWatchlist();
    final initialLength = currentList.length;
    currentList.removeWhere((element) => element.id == id);
    if (currentList.length != initialLength) {
      return await saveWatchlist(currentList);
    }
    return false;
  }
}
