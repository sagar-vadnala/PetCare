import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> _cart = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final List<Map<String, dynamic>>? cart = ModalRoute.of(context)
        ?.settings
        .arguments as List<Map<String, dynamic>>?;
    if (cart != null) {
      _cart = cart;
    }
  }

  double get _totalPrice => _cart.fold(0, (sum, item) => sum + item['price']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(24),
                      //border: Border.all(color: Colors.grey.shade100)
                    ),
                    child: ListTile(
                      leading: Image.network(_cart[index]['imageUrl']),
                      title: Text('Dog ${index + 1}'),
                      subtitle: Text('\$${_cart[index]['price']}'),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: \$$_totalPrice'),
          ),
        ],
      ),
    );
  }
}
