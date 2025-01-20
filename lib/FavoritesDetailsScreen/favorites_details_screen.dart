import 'package:aa_travel_planner/FavoritesRepository/favorites_repository.dart';
import 'package:aa_travel_planner/main.dart';
import 'package:flutter/material.dart';

class FavoritesDetailsScreen extends StatelessWidget {
  final Destination destination;
  final FavoritesRepository favoritesRepository;

  const FavoritesDetailsScreen({
    super.key,
    required this.destination,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${destination.name} - Favorite Destination'),
        backgroundColor: Colors.amber[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/${destination.imageUrl}",
                    fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[200],
                  ),
                  child: const Text(
                    'FAVORITE DESTINATION',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                destination.name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900]),
              ),
              const SizedBox(height: 8),
              Text(
                destination.country,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
              Divider(height: 30, color: Colors.amber[700]),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                destination.description,
                style: TextStyle(
                    fontSize: 16, height: 1.5, color: Colors.grey[700]),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  favoritesRepository.removeFavorite(destination);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Remove from Favorites',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
