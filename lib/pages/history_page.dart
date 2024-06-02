import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> _history = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  void _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _history = prefs.getStringList('history') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        // backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) {
          return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5,bottom: 5),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(24),
                          //border: Border.all(color: Colors.grey.shade100)
            ),
              child: Center(
                child: ListTile(
                  leading: Image.network(_history[index],
                  fit: BoxFit.cover,
                  ),
                  title: Text('Dog ${index + 1}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
