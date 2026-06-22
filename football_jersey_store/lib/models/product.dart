import 'package:flutter/material.dart';

class JerseyVariant {
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;
  final String playerName;
  final String jerseyType;
  final int jerseyNumber;
  final double price;
  final int stockQuantity;

  const JerseyVariant({
    required this.primaryColor,
    required this.secondaryColor,
    this.accentColor = Colors.white,
    required this.playerName,
    required this.jerseyType,
    required this.jerseyNumber,
    required this.price,
    required this.stockQuantity,
  });
}

class Product {
  final String id;
  final String name;
  final String description;
  final String team;
  final String season;
  final String material;
  final List<String> features;
  final List<String> availableSizes;
  final bool isAuthentic;
  final JerseyVariant home;
  final JerseyVariant away;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.team,
    required this.season,
    required this.material,
    required this.home,
    required this.away,
    this.features = const [],
    this.isAuthentic = true,
    this.isFavorite = false,
    this.availableSizes = const ['S', 'M', 'L', 'XL', 'XXL'],
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
