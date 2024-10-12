// Importing necessary Flutter packages and GetX for state management
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme.dart';  // theme data
import 'product.dart';  // file defines the Product model

// Main entry point of the application
void main() {
  runApp(MyApp());
}

// MyApp widget is a StatefulWidget to handle theme toggling
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// State class for MyApp, managing the theme state
class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;  // Flag to track whether dark theme is enabled

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Set light and dark themes using GetMaterialApp
      theme: AppTheme.lightTheme,  // Light theme from theme.dart
      darkTheme: AppTheme.darkTheme,  // Dark theme from theme.dart
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,  // Switch between themes based on isDarkTheme
      home: CatalogPage(toggleTheme: toggleTheme),  // CatalogPage as the home screen, passing toggleTheme callback
    );
  }

  // Method to toggle between light and dark themes
  void toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;  // Inverts the current theme state
    });
  }
}

// CatalogPage widget is a StatelessWidget that displays the product catalog
class CatalogPage extends StatelessWidget {
  final Function toggleTheme;  // Function to toggle the theme

  // Constructor to receive the toggleTheme function
  CatalogPage({required this.toggleTheme});

  // List of products to be displayed
  final List<Product> products = [
    Product(
        name: "Apple box", 
        imageUrl: "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce", 
        price: 20.0),  // Product 1: Apple box
    Product(
        name: "Large burger", 
        imageUrl: "https://images.unsplash.com/photo-1586190848861-99aa4a171e90", 
        price: 30.0),  // Product 2: Large burger
    Product(
        name: "Pasta dish", 
        imageUrl: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd", 
        price: 25.0),  // Product 3: Pasta dish
    Product(
        name: "Breakfast special", 
        imageUrl: "https://images.unsplash.com/photo-1504674900247-0877df9cc836", 
        price: 15.0),  // Product 4: Breakfast special
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Store'),  // Title of the app
        actions: [
          // Button to toggle between light and dark themes
          IconButton(
            icon: Icon(Icons.brightness_6),  // Theme icon
            onPressed: () {
              toggleTheme();  // Calls the toggleTheme function
            },
          ),
        ],
      ),
      // Body of the page, displaying products in a grid
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // Two columns in the grid
            childAspectRatio: 2 / 3,  // Aspect ratio of each grid item
          ),
          itemCount: products.length,  // Number of items in the grid
          itemBuilder: (context, index) {
            final product = products[index];  // Get the product at the current index
            return ProductCard(product: product);  // Return a ProductCard for each product
          },
        ),
      ),
    );
  }
}

// ProductCard widget to display each product in a card format
class ProductCard extends StatefulWidget {
  final Product product;  // The product to be displayed

  // Constructor to receive the product
  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

// State class for ProductCard, managing the opacity of the card
class _ProductCardState extends State<ProductCard> {
  double _opacity = 1.0;  // Initial opacity of the card

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // When the card is tapped, toggle its opacity and show a dialog
      onTap: () {
        setState(() {
          _opacity = _opacity == 1.0 ? 0.5 : 1.0;  // Toggle opacity
        });

        // Show a dialog with the product name
        Get.defaultDialog(
          title: "Product",
          middleText: widget.product.name,  // Display the product name in the dialog
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();  // Close the dialog when "OK" is pressed
            },
            child: Text("OK"),
          ),
        );
      },
      // AnimatedOpacity widget to animate the opacity changes
      child: AnimatedOpacity(
        opacity: _opacity,  // Set the opacity of the card
        duration: Duration(milliseconds: 500),  // Duration of the opacity change
        child: Card(
          elevation: 4,  // Elevation (shadow) for the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display the product image
              Image.network(
                widget.product.imageUrl,
                height: 150,
                fit: BoxFit.cover,  // Ensure the image covers the available space
              ),
              // Padding and text for the product name and price
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(widget.product.name, style: TextStyle(fontSize: 18)),  // Product name
                    SizedBox(height: 8),
                    Text('\$${widget.product.price}', style: TextStyle(fontSize: 16, color: Colors.grey)),  // Product price
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
