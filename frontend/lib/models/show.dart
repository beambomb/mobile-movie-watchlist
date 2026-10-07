class Show {
  final int id;
  final String name;
  final String? summary;
  final List<String> genres;
  final double? rating;
  final String? imageUrl;
  final String? premiered;
  final String? status;

  const Show({
    required this.id,
    required this.name,
    this.summary,
    this.genres = const [],
    this.rating,
    this.imageUrl,
    this.premiered,
    this.status,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    String? cleanedSummary;
    if (json['summary'] != null) {
      cleanedSummary = (json['summary'] as String)
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .replaceAll('&nbsp;', ' ')
          .replaceAll('&amp;', '&')
          .replaceAll('&quot;', '"')
          .replaceAll('&#39;', "'")
          .trim();
      if (cleanedSummary.isEmpty) {
        cleanedSummary = null;
      }
    }

    List<String> parsedGenres = [];
    if (json['genres'] is List) {
      parsedGenres = (json['genres'] as List)
          .map((e) => e.toString())
          .toList();
    }

    double? parsedRating;
    final ratingObj = json['rating'];
    if (ratingObj is Map && ratingObj['average'] != null) {
      final avg = ratingObj['average'];
      if (avg is num) {
        parsedRating = avg.toDouble();
      }
    }

    String? parsedImageUrl;
    final imageObj = json['image'];
    if (imageObj is Map) {
      parsedImageUrl = imageObj['medium'] as String? ?? imageObj['original'] as String?;
    }

    return Show(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      summary: cleanedSummary,
      genres: parsedGenres,
      rating: parsedRating,
      imageUrl: parsedImageUrl,
      premiered: json['premiered'] as String?,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'summary': summary,
      'genres': genres,
      'rating': rating != null ? {'average': rating} : null,
      'image': imageUrl != null ? {'medium': imageUrl} : null,
      'premiered': premiered,
      'status': status,
    };
  }
}
