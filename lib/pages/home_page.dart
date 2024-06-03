import 'package:dog_assignment/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _imageUrl;
  List<String> _history = [];
  List<Map<String, dynamic>> _cart = [];
  final ApiService _apiService = ApiService();
  final TextEditingController _priceController = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  void _fetchNewImage() async {
    setState(() {
      _loading = true;
    });
    String? imageUrl = await _apiService.fetchRandomDogImage();
    if (imageUrl != null) {
      setState(() {
        _imageUrl = imageUrl;
        _loading = false;
        _saveToHistory(imageUrl);
      });
    } else {
      setState(() {
        _loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch image. Please try again.')),
      );
    }
  }

  void _saveToHistory(String url) async {
    final prefs = await SharedPreferences.getInstance();
    _history = prefs.getStringList('history') ?? [];
    _history.add(url);
    prefs.setStringList('history', _history);
  }

  void _addToCart(String imageUrl, double price) async {
    setState(() {
      _cart.add({'imageUrl': imageUrl, 'price': price});
      _imageUrl = null;
    });
    await _saveCart();
  }

  void _onAddToCartPressed() {
    if (_imageUrl != null && _priceController.text.isNotEmpty) {
      final price = double.tryParse(_priceController.text);
      if (price != null) {
        _addToCart(_imageUrl!, price);
        _priceController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Added to cart!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid price')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a price')),
      );
    }
  }

  Future<void> _navigateToCart() async {
    await Navigator.pushNamed(context, '/cart', arguments: _cart);
    _loadCart();
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = jsonEncode(_cart);
    await prefs.setString('cart', cartString);
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      setState(() {
        _cart = List<Map<String, dynamic>>.from(jsonDecode(cartString));
      });
    }
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _navigateToCart,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                color: Colors.lightGreen,
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Enter pincode to check delivery date")
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Featured pets",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFFBEFC9),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      height: 150,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Havanese dog",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            Text("The Havanese dog, known for its charming \npersonality and silky coat, is a breed that \nspreads joy wherever it goes",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: Image.asset("assets/dog.png"))
                  ],
                ),
              ),
              SizedBox(height: 10,),
              if (_loading)
                CircularProgressIndicator(),
              if (_imageUrl != null && !_loading)
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child: Image.network(
                        _imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          labelText: 'Enter price',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _onAddToCartPressed,
                          child: Text('Add to Cart'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _fetchNewImage,
                          child: Text('Fetch New Image'),
                        ),
                      ],
                    ),
                  ],
                ),
              if (_imageUrl == null && !_loading)
                ElevatedButton(
                  onPressed: _fetchNewImage,
                  child: Text('Fetch New Image'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
