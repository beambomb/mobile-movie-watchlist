class WatchlistItem {
  final String id;
  final int showId;
  final String title;
  final String? imageUrl;
  final List<String> genres;
  final String status;
  final double userRating;
  final String userNotes;
  final DateTime addedAt;
  final DateTime updatedAt;

  const WatchlistItem({
    required this.id,
    required this.showId,
    required this.title,
    this.imageUrl,
    this.genres = const [],
    this.status = 'Plan to Watch',
    this.userRating = 0.0,
    this.userNotes = '',
    required this.addedAt,
    required this.updatedAt,
  });

  factory WatchlistItem.fromJson(Map<String, dynamic> json) {
    return WatchlistItem(
      id: json['id'] as String? ?? '',
      showId: (json['showId'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      genres: json['genres'] is List
          ? (json['genres'] as List).map((e) => e.toString()).toList()
          : const [],
      status: json['status'] as String? ?? 'Plan to Watch',
      userRating: (json['userRating'] as num?)?.toDouble() ?? 0.0,
      userNotes: json['userNotes'] as String? ?? '',
      addedAt: json['addedAt'] != null
          ? DateTime.tryParse(json['addedAt'] as String) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'showId': showId,
      'title': title,
      'imageUrl': imageUrl,
      'genres': genres,
      'status': status,
      'userRating': userRating,
      'userNotes': userNotes,
      'addedAt': addedAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  WatchlistItem copyWith({
    String? id,
    int? showId,
    String? title,
    String? imageUrl,
    List<String>? genres,
    String? status,
    double? userRating,
    String? userNotes,
    DateTime? addedAt,
    DateTime? updatedAt,
  }) {
    return WatchlistItem(
      id: id ?? this.id,
      showId: showId ?? this.showId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      userRating: userRating ?? this.userRating,
      userNotes: userNotes ?? this.userNotes,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
