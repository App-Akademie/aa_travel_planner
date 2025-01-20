import 'dart:developer';

import 'package:aa_travel_planner/FavoriteCard/favorite_card.dart';
import 'package:aa_travel_planner/FavoritesDetailsScreen/favorites_details_screen.dart';
import 'package:aa_travel_planner/FavoritesRepository/favorites_repository.dart';
import 'package:aa_travel_planner/FavoritesScreen/favorites_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AA Travel Planner',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class Destination {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;

  Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
  });

  // Damit zwei Objekte mit den selben Daten als gleich angesehen werden.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Destination) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

class Trip {
  final String id;
  final Destination destination;
  final String dateRange;
  final String itinerary;

  Trip({
    required this.id,
    required this.destination,
    required this.dateRange,
    required this.itinerary,
  });

  // Damit zwei Objekte mit den selben Daten als gleich angesehen werden.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Trip) return false;
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}

class DestinationRepository {
  final List<Destination> _destinations = [
    Destination(
      id: '1',
      name: 'Paris',
      country: 'France',
      description:
          'The City of Lights, famous for its culture and architecture.',
      imageUrl: 'paris.jpeg',
    ),
    Destination(
      id: '2',
      name: 'Tokyo',
      country: 'Japan',
      description:
          'A city blending tradition with modern technology, and full of vibrant districts.',
      imageUrl: 'tokyo.jpeg',
    ),
    Destination(
      id: '3',
      name: 'New York',
      country: 'USA',
      description:
          'The city that never sleeps, known for its iconic skyline and landmarks.',
      imageUrl: 'new_york.jpeg',
    ),
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
    Destination(
      id: '7',
      name: 'Cape Town',
      country: 'South Africa',
      description:
          'A port city beneath Table Mountain, known for its stunning landscapes.',
      imageUrl: 'cape_town.jpeg',
    ),
  ];

  List<Destination> getAllDestinations() {
    return _destinations;
  }
}

class TripRepository {
  final List<Trip> _trips = [
    Trip(
      id: '101',
      destination: Destination(
        id: '1',
        name: 'Paris',
        country: 'France',
        description:
            'The City of Lights, famous for its culture and architecture.',
        imageUrl: 'paris.jpeg',
      ),
      dateRange: '10-15 Oct 2024',
      itinerary:
          'Visit Eiffel Tower, Louvre Museum, and stroll through Montmartre.',
    ),
    Trip(
      id: '102',
      destination: Destination(
        id: '2',
        name: 'Tokyo',
        country: 'Japan',
        description:
            'A vibrant city blending tradition with modern technology, and full of vibrant districts.',
        imageUrl: 'tokyo.jpeg',
      ),
      dateRange: '20-25 Nov 2024',
      itinerary: 'See Shibuya Crossing, visit Senso-ji, and explore Harajuku.',
    ),
    Trip(
      id: '103',
      destination: Destination(
        id: '3',
        name: 'New York',
        country: 'USA',
        description:
            'The city that never sleeps, known for its iconic skyline and landmarks.',
        imageUrl: 'new_york.jpeg',
      ),
      dateRange: '5-10 Dec 2024',
      itinerary: 'Visit Central Park, Statue of Liberty, and Times Square.',
    ),
    Trip(
      id: '104',
      destination: Destination(
        id: '4',
        name: 'Rome',
        country: 'Italy',
        description:
            'A city steeped in history, with ancient ruins and Renaissance art.',
        imageUrl: 'rome.jpeg',
      ),
      dateRange: '15-20 Jan 2025',
      itinerary: 'Tour the Colosseum, Roman Forum, and Vatican City.',
    ),
    Trip(
      id: '105',
      destination: Destination(
        id: '5',
        name: 'Sydney',
        country: 'Australia',
        description:
            'Known for its Sydney Opera House, Harbour Bridge, and beautiful beaches.',
        imageUrl: 'sydney.jpeg',
      ),
      dateRange: '25-30 Feb 2025',
      itinerary:
          'See the Opera House, climb the Harbour Bridge, and relax at Bondi Beach.',
    ),
    Trip(
      id: '106',
      destination: Destination(
        id: '6',
        name: 'Rio de Janeiro',
        country: 'Brazil',
        description:
            'Famous for its Carnival, Christ the Redeemer, and breathtaking beaches.',
        imageUrl: 'rio_de_janeiro.jpeg',
      ),
      dateRange: '10-15 Mar 2025',
      itinerary:
          'Visit Christ the Redeemer, Sugarloaf Mountain, and Copacabana Beach.',
    ),
    Trip(
      id: '107',
      destination: Destination(
        id: '7',
        name: 'Cape Town',
        country: 'South Africa',
        description:
            'A port city beneath Table Mountain, known for its stunning landscapes.',
        imageUrl: 'cape_town.jpeg',
      ),
      dateRange: '20-25 Apr 2025',
      itinerary: 'Explore Table Mountain, V&A Waterfront, and Robben Island.',
    ),
  ];

  List<Trip> getAllTrips() {
    return _trips;
  }
}

class SettingsRepository {
  bool _darkMode = false;
  String _fontSize = 'Medium';
  String _language = 'English';
  bool _privacyMode = true;
  String _distanceUnit = 'Kilometers';

  bool getDarkMode() => _darkMode;
  String getFontSize() => _fontSize;
  String getLanguage() => _language;
  bool getPrivacyMode() => _privacyMode;
  String getDistanceUnit() => _distanceUnit;

  void setDarkMode(bool value) {
    _darkMode = value;
    log('Dark Mode set to: $_darkMode');
  }

  void setFontSize(String value) {
    _fontSize = value;
    log('Font Size set to: $_fontSize');
  }

  void setLanguage(String value) {
    _language = value;
    log('Language set to: $_language');
  }

  void setPrivacyMode(bool value) {
    _privacyMode = value;
    log('Privacy Mode set to: $_privacyMode');
  }

  void setDistanceUnit(String value) {
    _distanceUnit = value;
    log('Distance Unit set to: $_distanceUnit');
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final DestinationRepository destinationRepository = DestinationRepository();
  final TripRepository tripRepository = TripRepository();
  final FavoritesRepository favoritesRepository = FavoritesRepository();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(
        destinationRepository: widget.destinationRepository,
        tripRepository: widget.tripRepository,
        favoritesRepository: widget.favoritesRepository,
      ),
      ExploreTripsScreen(tripRepository: widget.tripRepository),
      ExploreDestinationsScreen(
        destinationRepository: widget.destinationRepository,
        favoritesRepository: widget.favoritesRepository,
      ),
      FavoritesScreen(
        favoritesRepository: widget.favoritesRepository,
      ),
      const SettingsScreen(),
    ];
  }

  final List<String> _appBarTitles = [
    'Home',
    'Explore Trips',
    'Explore Destinations',
    'Favorite Destinations',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitles[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[700],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => const TextStyle(color: Colors.white),
          ),
          indicatorColor: Colors.teal,
        ),
        child: NavigationBar(
          backgroundColor: Colors.teal[800],
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onItemTapped,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home, color: Colors.white70),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.airplane_ticket, color: Colors.white70),
              selectedIcon: Icon(Icons.airplane_ticket, color: Colors.white),
              label: 'Trips',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore, color: Colors.white70),
              selectedIcon: Icon(Icons.explore, color: Colors.white),
              label: 'Destina...',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite, color: Colors.white70),
              selectedIcon: Icon(Icons.favorite, color: Colors.white),
              label: 'Favorites',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings, color: Colors.white70),
              selectedIcon: Icon(Icons.settings, color: Colors.white),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final DestinationRepository destinationRepository;
  final TripRepository tripRepository;
  final FavoritesRepository favoritesRepository;

  const HomeScreen({
    super.key,
    required this.tripRepository,
    required this.favoritesRepository,
    required this.destinationRepository,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final trips = widget.tripRepository.getAllTrips();
    final favoriteDestinations = widget.favoritesRepository.getFavorites();
    final secretTip = trips.isNotEmpty ? trips[0] : null;
    final destinations = widget.destinationRepository.getAllDestinations();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recommended Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Carousel(
            favoritesRepository: widget.favoritesRepository,
            trips: trips,
            secretTip: secretTip,
            favoriteDestination: favoriteDestinations.isNotEmpty
                ? favoriteDestinations[0]
                : null,
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Explore Popular Destinations',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: destinations.length > 3 ? 3 : destinations.length,
            itemBuilder: (context, index) {
              final destination = destinations[index];

              return PopularDestinationCard(
                destination: destination,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DestinationDetailsScreen(
                        favoritesRepository: widget.favoritesRepository,
                        destination: destination,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trips.length > 5 ? 5 : trips.length,
            itemBuilder: (context, index) {
              final Trip trip = trips[index];

              return ListTile(
                title: Text(trip.destination.name),
                subtitle: Text(trip.dateRange),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/${trip.destination.imageUrl}"),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TripDetailsScreen(trip: trip)),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final FavoritesRepository favoritesRepository;
  final List<Trip> trips;
  final Trip? secretTip;
  final Destination? favoriteDestination;

  const Carousel({
    super.key,
    required this.favoritesRepository,
    required this.trips,
    this.secretTip,
    this.favoriteDestination,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        children: [
          if (secretTip != null)
            CarouselItem(trip: secretTip!, label: 'Secret Tip!'),
          if (favoriteDestination != null)
            CarouselItem(
                favoritesRepository: favoritesRepository,
                destination: favoriteDestination!,
                label: 'From Your Favorites'),
          ...trips.map((trip) => CarouselItem(trip: trip)),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final FavoritesRepository? favoritesRepository;
  final Trip? trip;
  final Destination? destination;
  final String? label;

  const CarouselItem({
    super.key,
    this.trip,
    this.destination,
    this.label,
    this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        trip != null ? trip!.destination.imageUrl : destination!.imageUrl;
    final String title =
        trip != null ? trip!.destination.name : destination!.name;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => trip == null
            ? DestinationDetailsScreen(
                destination: destination!,
                favoritesRepository: favoritesRepository!,
              )
            : TripDetailsScreen(trip: trip!),
      )),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage("assets/images/$imageUrl"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (label != null)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  label!,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreDestinationsScreen extends StatelessWidget {
  final DestinationRepository destinationRepository;
  final FavoritesRepository favoritesRepository;

  const ExploreDestinationsScreen({
    super.key,
    required this.destinationRepository,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = destinationRepository.getAllDestinations();

    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        final destination = destinations[index];
        return DestinationCard(
          destination: destination,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DestinationDetailsScreen(
                  destination: destination,
                  favoritesRepository: favoritesRepository,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsRepository settingsRepository = SettingsRepository();

  @override
  Widget build(BuildContext context) {
    bool darkMode = settingsRepository.getDarkMode();
    String fontSize = settingsRepository.getFontSize();
    String language = settingsRepository.getLanguage();
    bool privacyMode = settingsRepository.getPrivacyMode();
    String distanceUnit = settingsRepository.getDistanceUnit();

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Settings',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              SwitchListTile(
                title: const Text('Dark Mode'),
                subtitle: const Text('Enable dark theme for the app'),
                value: darkMode,
                onChanged: (bool value) {
                  setState(() {
                    settingsRepository.setDarkMode(value);
                  });
                },
                activeColor: Colors.teal,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Font Size'),
                subtitle: const Text('Adjust the font size in the app'),
                trailing: DropdownButton<String>(
                  value: fontSize,
                  items:
                      <String>['Small', 'Medium', 'Large'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      settingsRepository.setFontSize(newValue!);
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Language'),
                subtitle: const Text('Choose app language'),
                trailing: DropdownButton<String>(
                  value: language,
                  items: <String>['English', 'Spanish', 'French', 'German']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      settingsRepository.setLanguage(newValue!);
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Privacy Mode'),
                subtitle: const Text('Hide sensitive trip details'),
                value: privacyMode,
                onChanged: (bool value) {
                  setState(() {
                    settingsRepository.setPrivacyMode(value);
                  });
                },
                activeColor: Colors.teal,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Distance Unit'),
                subtitle: const Text('Choose between kilometers or miles'),
                trailing: DropdownButton<String>(
                  value: distanceUnit,
                  items: <String>['Kilometers', 'Miles'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      settingsRepository.setDistanceUnit(newValue!);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TripDetailsScreen extends StatelessWidget {
  final Trip trip;

  const TripDetailsScreen({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trip.destination.name),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/${trip.destination.imageUrl}",
                    fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Text('Dates: ${trip.dateRange}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Itinerary:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(trip.itinerary, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.teal[600]),
                child: const Text(
                  'Go Back',
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

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;
  final FavoritesRepository favoritesRepository;

  const DestinationDetailsScreen({
    super.key,
    required this.destination,
    required this.favoritesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/${destination.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text('Country: ${destination.country}',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 16),
              const Text('Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(destination.description,
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[600]),
                    child: const Text(
                      'Go Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      favoritesRepository.addFavorite(destination);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[600]),
                    child: const Text(
                      'Add to favorites',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularDestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;

  const PopularDestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      color: Colors.blueGrey[50],
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/${destination.imageUrl}",
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      destination.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.teal.shade300, width: 2),
      ),
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/${destination.imageUrl}",
                    width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(destination.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(destination.country,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreTripsScreen extends StatelessWidget {
  final TripRepository tripRepository;

  const ExploreTripsScreen({super.key, required this.tripRepository});

  @override
  Widget build(BuildContext context) {
    final trips = tripRepository.getAllTrips();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return TripCardHorizontal(trip: trip);
              },
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All Trips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: trips.length,
            itemBuilder: (context, index) {
              final trip = trips[index];
              return TripCardVertical(trip: trip);
            },
          ),
        ],
      ),
    );
  }
}

class TripCardHorizontal extends StatelessWidget {
  final Trip trip;

  const TripCardHorizontal({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TripDetailsScreen(trip: trip)),
        );
      },
      child: Container(
        width: 300,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage("assets/images/${trip.destination.imageUrl}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  trip.destination.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  trip.dateRange,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TripDetailsScreen(trip: trip)),
                    );
                  },
                  child: const Text('View Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TripCardVertical extends StatelessWidget {
  final Trip trip;

  const TripCardVertical({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TripDetailsScreen(trip: trip)),
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                "assets/images/${trip.destination.imageUrl}",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.destination.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Dates: ${trip.dateRange}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    trip.itinerary,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TripDetailsScreen(trip: trip)),
                      );
                    },
                    child: const Text('View Trip Details'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
