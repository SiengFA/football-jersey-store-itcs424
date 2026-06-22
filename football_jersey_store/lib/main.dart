import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const FootballJerseyApp());
}

class FootballJerseyApp extends StatelessWidget {
  const FootballJerseyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Jersey Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: ProductListScreen(products: _getSampleProducts()),
    );
  }

  List<Product> _getSampleProducts() {
    return [
      Product(
        id: '1',
        name: 'Manchester United',
        description: 'Official match jersey from Old Trafford, the Theatre of Dreams.',
        team: 'Manchester United',
        season: '2024/25',
        material: '100% Recycled Polyester',
        features: ['Dri-FIT ADV Technology', 'Heat-sealed badge', 'Slim fit'],
        home: const JerseyVariant(
          primaryColor: Color(0xFFCC0000),
          secondaryColor: Colors.white,
          accentColor: Color(0xFFFFD700),
          playerName: 'RASHFORD',
          jerseyType: 'Home',
          jerseyNumber: 10,
          price: 89.99,
          stockQuantity: 10,
        ),
        away: const JerseyVariant(
          primaryColor: Color(0xFF1a1a2e),
          secondaryColor: Color(0xFFCC0000),
          accentColor: Colors.white,
          playerName: 'RASHFORD',
          jerseyType: 'Away',
          jerseyNumber: 10,
          price: 84.99,
          stockQuantity: 7,
        ),
      ),
      Product(
        id: '2',
        name: 'Real Madrid',
        description: 'The iconic all-white kit of the most successful club in history.',
        team: 'Real Madrid',
        season: '2024/25',
        material: '96% Polyester, 4% Elastane',
        features: ['AEROREADY Technology', 'Climacool ventilation', 'Regular fit'],
        home: const JerseyVariant(
          primaryColor: Colors.white,
          secondaryColor: Color(0xFF00529F),
          accentColor: Color(0xFFFFD700),
          playerName: 'BELLINGHAM',
          jerseyType: 'Home',
          jerseyNumber: 5,
          price: 94.99,
          stockQuantity: 12,
        ),
        away: const JerseyVariant(
          primaryColor: Color(0xFF6B3FA0),
          secondaryColor: Colors.white,
          accentColor: Color(0xFFFFD700),
          playerName: 'BELLINGHAM',
          jerseyType: 'Away',
          jerseyNumber: 5,
          price: 92.99,
          stockQuantity: 8,
        ),
      ),
      Product(
        id: '3',
        name: 'FC Barcelona',
        description: 'Més que un club — the Blaugrana jersey representing Catalan pride.',
        team: 'FC Barcelona',
        season: '2024/25',
        material: '100% Recycled Polyester',
        features: ['DryCell Technology', 'Lockdown collar', 'Athletic fit'],
        home: const JerseyVariant(
          primaryColor: Color(0xFF004D98),
          secondaryColor: Color(0xFFA50044),
          accentColor: Color(0xFFFFD700),
          playerName: 'GAVI',
          jerseyType: 'Home',
          jerseyNumber: 6,
          price: 92.99,
          stockQuantity: 15,
        ),
        away: const JerseyVariant(
          primaryColor: Color(0xFFFFD700),
          secondaryColor: Color(0xFF004D98),
          accentColor: Color(0xFFA50044),
          playerName: 'GAVI',
          jerseyType: 'Away',
          jerseyNumber: 6,
          price: 89.99,
          stockQuantity: 5,
        ),
      ),
      Product(
        id: '4',
        name: 'Liverpool FC',
        description: 'You\'ll Never Walk Alone — the famous Anfield red.',
        team: 'Liverpool FC',
        season: '2024/25',
        material: '100% Recycled Polyester',
        features: ['VaporKnit Technology', 'Dynamic Fit collar', 'Body-mapped design'],
        home: const JerseyVariant(
          primaryColor: Color(0xFFC8102E),
          secondaryColor: Color(0xFFFFD700),
          accentColor: Colors.white,
          playerName: 'SALAH',
          jerseyType: 'Home',
          jerseyNumber: 11,
          price: 87.99,
          stockQuantity: 20,
        ),
        away: const JerseyVariant(
          primaryColor: Color(0xFF2ECC71),
          secondaryColor: Color(0xFFC8102E),
          accentColor: Colors.white,
          playerName: 'SALAH',
          jerseyType: 'Away',
          jerseyNumber: 11,
          price: 85.99,
          stockQuantity: 0,
        ),
      ),
      Product(
        id: '5',
        name: 'Bayern Munich',
        description: 'German engineering meets football excellence from the Allianz Arena.',
        team: 'Bayern Munich',
        season: '2024/25',
        material: '95% Polyester, 5% Elastane',
        features: ['AEROREADY Technology', 'Slim-fit design', 'Moisture wicking'],
        home: const JerseyVariant(
          primaryColor: Color(0xFFDC052D),
          secondaryColor: Colors.white,
          accentColor: Color(0xFF003366),
          playerName: 'KANE',
          jerseyType: 'Home',
          jerseyNumber: 9,
          price: 91.99,
          stockQuantity: 8,
        ),
        away: const JerseyVariant(
          primaryColor: Color(0xFF003366),
          secondaryColor: Color(0xFFDC052D),
          accentColor: Colors.white,
          playerName: 'KANE',
          jerseyType: 'Away',
          jerseyNumber: 9,
          price: 89.99,
          stockQuantity: 4,
        ),
      ),
      Product(
        id: '6',
        name: 'Paris Saint-Germain',
        description: 'Parisian elegance meets football at the Parc des Princes.',
        team: 'Paris Saint-Germain',
        season: '2024/25',
        material: '100% Recycled Polyester',
        features: ['Jordan x PSG collaboration', 'Breathable mesh', 'Standard fit'],
        home: const JerseyVariant(
          primaryColor: Color(0xFF003399),
          secondaryColor: Color(0xFFCC0000),
          accentColor: Color(0xFFFFD700),
          playerName: 'MBAPPÉ',
          jerseyType: 'Home',
          jerseyNumber: 7,
          price: 95.99,
          stockQuantity: 6,
        ),
        away: const JerseyVariant(
          primaryColor: Color(0xFF1a1a1a),
          secondaryColor: Color(0xFF003399),
          accentColor: Color(0xFFCC0000),
          playerName: 'MBAPPÉ',
          jerseyType: 'Away',
          jerseyNumber: 7,
          price: 93.99,
          stockQuantity: 0,
        ),
      ),
    ];
  }
}
