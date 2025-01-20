import 'dart:developer';
import 'package:aa_travel_planner/main.dart';

class FavoritesRepository {
  final List<Destination> _favoriteDestinations = [
    Destination(
      id: '4',
      name: 'Rome',
      country: 'Italy',
      description:
          'A city steeped in history, with ancient ruins and Renaissance art.',
      imageUrl: 'rome.jpeg',
    ),
    Destination(
      id: '5',
      name: 'Sydney',
      country: 'Australia',
      description:
          'Known for its Sydney Opera House, Harbour Bridge, and beautiful beaches.',
      imageUrl: 'sydney.jpeg',
    ),
    Destination(
      id: '6',
      name: 'Rio de Janeiro',
      country: 'Brazil',
      description:
          'Famous for its Carnival, Christ the Redeemer, and breathtaking beaches.',
      imageUrl: 'rio_de_janeiro.jpeg',
    ),
  ];

  List<Destination> getFavorites() {
    return _favoriteDestinations;
  }

  void addFavorite(Destination destination) {
    if (!_favoriteDestinations.contains(destination)) {
      _favoriteDestinations.add(destination);
      log('${destination.name} added to favorites');
    }
  }

  void removeFavorite(Destination destination) {
    _favoriteDestinations.remove(destination);
    log('${destination.name} removed from favorites');
  }

  bool isFavorite(Destination destination) {
    return _favoriteDestinations.contains(destination);
  }
}
