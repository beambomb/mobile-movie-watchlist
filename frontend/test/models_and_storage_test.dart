import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_watchlist/models/show.dart';
import 'package:movie_watchlist/models/watchlist_item.dart';
import 'package:movie_watchlist/services/storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Show Model Tests', () {
    test('Show.fromJson parses normal TVMaze JSON correctly', () {
      final json = {
        'id': 123,
        'name': 'Breaking Bad',
        'summary': '<p>A high school chemistry teacher turned <b>meth producer</b>.&nbsp;</p>',
        'genres': ['Drama', 'Crime', 'Thriller'],
        'rating': {'average': 9.5},
        'image': {
          'medium': 'https://static.tvmaze.com/uploads/images/medium_portrait/0/2400.jpg',
          'original': 'https://static.tvmaze.com/uploads/images/original_untouched/0/2400.jpg',
        },
        'premiered': '2008-01-20',
        'status': 'Ended',
      };

      final show = Show.fromJson(json);

      expect(show.id, 123);
      expect(show.name, 'Breaking Bad');
      expect(show.summary, 'A high school chemistry teacher turned meth producer.');
      expect(show.genres, ['Drama', 'Crime', 'Thriller']);
      expect(show.rating, 9.5);
      expect(show.imageUrl, 'https://static.tvmaze.com/uploads/images/medium_portrait/0/2400.jpg');
      expect(show.premiered, '2008-01-20');
      expect(show.status, 'Ended');
    });

    test('Show.fromJson handles null or missing optional fields gracefully', () {
      final json = <String, dynamic>{
        'id': 456,
        'name': 'Unknown Show',
      };

      final show = Show.fromJson(json);

      expect(show.id, 456);
      expect(show.name, 'Unknown Show');
      expect(show.summary, isNull);
      expect(show.genres, isEmpty);
      expect(show.rating, isNull);
      expect(show.imageUrl, isNull);
      expect(show.premiered, isNull);
      expect(show.status, isNull);
    });
  });

  group('WatchlistItem Model Tests', () {
    test('WatchlistItem serialization and deserialization', () {
      final item = WatchlistItem(
        id: 'item-1',
        showId: 101,
        title: 'Better Call Saul',
        imageUrl: 'https://example.com/poster.jpg',
        genres: const ['Crime', 'Drama'],
        status: 'Watching',
        userRating: 4.5,
        userNotes: 'Sangat bagus!',
        addedAt: DateTime.parse('2026-10-01T10:00:00Z'),
        updatedAt: DateTime.parse('2026-10-02T12:00:00Z'),
      );

      final json = item.toJson();
      final fromJsonItem = WatchlistItem.fromJson(json);

      expect(fromJsonItem.id, 'item-1');
      expect(fromJsonItem.showId, 101);
      expect(fromJsonItem.title, 'Better Call Saul');
      expect(fromJsonItem.imageUrl, 'https://example.com/poster.jpg');
      expect(fromJsonItem.genres, ['Crime', 'Drama']);
      expect(fromJsonItem.status, 'Watching');
      expect(fromJsonItem.userRating, 4.5);
      expect(fromJsonItem.userNotes, 'Sangat bagus!');
      expect(fromJsonItem.addedAt, DateTime.parse('2026-10-01T10:00:00Z'));
      expect(fromJsonItem.updatedAt, DateTime.parse('2026-10-02T12:00:00Z'));
    });

    test('WatchlistItem copyWith produces updated clone', () {
      final original = WatchlistItem(
        id: 'item-2',
        showId: 202,
        title: 'Stranger Things',
        addedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final updated = original.copyWith(
        status: 'Completed',
        userRating: 5.0,
        userNotes: 'Masterpiece',
      );

      expect(updated.id, 'item-2');
      expect(updated.title, 'Stranger Things');
      expect(updated.status, 'Completed');
      expect(updated.userRating, 5.0);
      expect(updated.userNotes, 'Masterpiece');
    });
  });

  group('StorageService CRUD Tests', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    test('StorageService returns empty list when key is not set', () async {
      final storage = StorageService();
      final items = await storage.getWatchlist();
      expect(items, isEmpty);
    });

    test('StorageService handles invalid/corrupt JSON safely', () async {
      SharedPreferences.setMockInitialValues({
        StorageService.storageKey: 'invalid-json-string',
      });
      final storage = StorageService();
      final items = await storage.getWatchlist();
      expect(items, isEmpty);
    });

    test('StorageService can add, read, update, and delete items', () async {
      final storage = StorageService();

      final item1 = WatchlistItem(
        id: 'id-1',
        showId: 10,
        title: 'Show 1',
        addedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final item2 = WatchlistItem(
        id: 'id-2',
        showId: 20,
        title: 'Show 2',
        addedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // 1. Add item1 and item2
      expect(await storage.addItem(item1), isTrue);
      expect(await storage.addItem(item2), isTrue);

      var list = await storage.getWatchlist();
      expect(list.length, 2);
      expect(list[0].id, 'id-1');
      expect(list[1].id, 'id-2');

      // 2. Update item1
      final updatedItem1 = item1.copyWith(
        status: 'Completed',
        userRating: 5.0,
      );
      expect(await storage.updateItem(updatedItem1), isTrue);

      list = await storage.getWatchlist();
      expect(list.firstWhere((e) => e.id == 'id-1').status, 'Completed');
      expect(list.firstWhere((e) => e.id == 'id-1').userRating, 5.0);

      // 3. Delete item2
      expect(await storage.deleteItem('id-2'), isTrue);

      list = await storage.getWatchlist();
      expect(list.length, 1);
      expect(list[0].id, 'id-1');

      // 4. Delete non-existent returns false
      expect(await storage.deleteItem('non-existent-id'), isFalse);
    });
  });
}
