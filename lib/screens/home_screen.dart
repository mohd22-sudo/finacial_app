import 'package:finacial_app/screens/stock_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showShariahStocks = false;

  List<Map<String, dynamic>> allStocks = [
    {"name": "Omantel", "symbol": "OMTL", "price": 333.13, "change": "+1.14%", "color": Colors.green, "logo": "assets/images/omantel.png", "shariah": true},
    {"name": "Bank Muscut", "symbol": "BMSCT", "price": 150.02, "change": "+0.71%", "color": Colors.green, "logo": "assets/images/bank_mascat.jpeg", "shariah": false},
    {"name": "Ooredoo", "symbol": "OREDO", "price": 1170.0, "change": "-3.03%", "color": Colors.red, "logo": "assets/images/ooredoo.jpg", "shariah": true},
    {"name": "OQ", "symbol": "OQ", "price": 328.08, "change": "-0.22%", "color": Colors.red, "logo": "assets/images/oq.png", "shariah": false},
    {"name": "NBO", "symbol": "NBO", "price": 264.01, "change": "+2.22%", "color": Colors.green, "logo": "assets/images/nbo.png", "shariah": true},
    {"name": "OXY", "symbol": "OXY", "price": 264.01, "change": "+2.22%", "color": Colors.green, "logo": "assets/images/oxy.png", "shariah": false},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayedStocks = showShariahStocks
        ? allStocks.where((stock) => stock["shariah"] == true).toList()
        : allStocks;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(6, 48, 8, 160), Color.fromRGBO(0, 78, 91, 160)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Color.fromARGB(6, 48, 8, 180),
                elevation: 0,
                title: const Text('Markets', style: TextStyle(color: Colors.white)),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Stocks and Categories',
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.black45,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showShariahStocks = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: showShariahStocks ?  Color.fromARGB(255, 222, 136, 66) : Color(0xFF0E7B3F),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            'All Stocks',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showShariahStocks = true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: showShariahStocks ? Color(0xFF0E7B3F) : Color.fromARGB(255, 222, 136, 66),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            'Shariah-Compliant Stocks',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayedStocks.length,
                  itemBuilder: (context, index) {
                    final stock = displayedStocks[index];
                    return Card(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            stock['logo'],
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, color: Colors.white70),
                          ),
                        ),
                        title: Text(stock['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        subtitle: Text(stock['symbol'], style: TextStyle(color: Colors.white70)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$${stock['price']}',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              stock['change'],
                              style: TextStyle(color: stock['color']),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StockDetailsScreen(
                                stockName: stock['name'],
                                stockSymbol: stock['symbol'],
                                stockPrice: stock['price'],
                              ),
                            ),
                          );
                        },
                      ),
                    );
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
