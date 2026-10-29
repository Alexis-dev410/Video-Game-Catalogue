// ----- Game class -----

class Game {
  final String title;
  final int year;
  final double rating;
  final String genre;
  final String? description;

  Game({
    required this.title,
    required this.year,
    required this.rating,
    required this.genre,
    this.description,
  });

  String getSummary() {
    return "$title ($year) — $rating ⭐";
  }

  String getRatingLabel() {
    if (rating >= 9) {
      return "Masterpiece";
    } else if (rating >= 8) {
      return "Excellent";
    } else if (rating >= 7) {
      return "Good";
    } else if (rating >= 5) {
      return "Average";
    } else {
      return "Poor";
    }
  }

  String getDescription() {
    return description ?? "No description available.";
  }
}

// ----- Game catalog -----

final List<Game> catalog = [
  Game(
    title: 'Elden Ring',
    year: 2022,
    rating: 9.5,
    genre: 'RPG',
    description: 'An open world fantasy RPG created by FromSoftware.'
  ),
  Game(
    title: 'The Witcher 3',
    year: 2015,
    rating: 9.3,
    genre: 'RPG',
    description: 'A story-driven open world RPG.'
  ),
  Game(
    title: 'Minecraft',
    year: 2011,
    rating: 8.7,
    genre: 'Sandbox',
    description: 'A sandbox game about placing blocks and exploring.'
  ),
  Game(
    title: 'Grand Theft Auto V',
    year: 2013,
    rating: 8.9,
    genre: 'Action',
    description: 'An open world crime adventure game.'
  ),
  Game(
    title: 'Stardew Valley',
    year: 2016,
    rating: 8.8,
    genre: 'Simulation',
    description: null
  ),
  Game(
    title: 'Cyberpunk 2077',
    year: 2020,
    rating: 7.5,
    genre: 'RPG',
    description: 'A futuristic open world RPG set in Night City.'
  )
];

void main() {

  // ----- Print catalog stats -----

  print("🎮 Game Library\n");

  print("Total games: ${catalog.length}");
  print("First game: ${catalog.first.title}");
  print("Last game: ${catalog.last.title}\n");

  // ----- Print all games -----

  for (var game in catalog) {
    print("${game.getSummary()} [${game.getRatingLabel()}]");
  }

  print("");

  // ----- map() transformations -----

  List<String> titles = catalog.map((g) => g.title).toList();
  List<int> years = catalog.map((g) => g.year).toList();
  List<String> genres = catalog.map((g) => g.genre).toList();

  print("Titles: $titles");
  print("Years: $years");
  print("Genres: $genres\n");

  // ----- Filtering games -----

  var topRated = catalog.where((g) => g.rating >= 8).map((g) => g.title).toList();
  var recent = catalog.where((g) => g.year >= 2020).map((g) => g.title).toList();
  var topAndRecent = catalog
      .where((g) => g.rating >= 8 && g.year >= 2020)
      .map((g) => g.title)
      .toList();

  print("Top Rated: $topRated");
  print("Recent: $recent");
  print("Top & Recent: $topAndRecent\n");

  // ----- Group games by genre -----

  Map<String, List<Game>> byGenre = {};

  for (var game in catalog) {
    byGenre.putIfAbsent(game.genre, () => []);
    byGenre[game.genre]!.add(game);
  }

  byGenre.forEach((genre, games) {
    var titles = games.map((g) => g.title).join(", ");
    print("$genre: $titles");
  });

  print("");

  // ----- Best game -----

  Game bestGame = catalog.first;

  for (var game in catalog) {
    if (game.rating > bestGame.rating) {
      bestGame = game;
    }
  }

  print("🏆 Best Game: ${bestGame.title} — ${bestGame.rating}");
}