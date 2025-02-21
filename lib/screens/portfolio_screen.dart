
import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> portfolioStocks = [
      {"name": "Omantel", "symbol": "OMTL","shares": 10, "price": 333.13, "change": "+1.14%", "color": Colors.green},
      {"name": "Bank Muscut", "symbol": "BMSCT","shares": 5, "price": 150.02, "change": "+0.71%", "color": Colors.green},
      {"name": "Ooredoo", "symbol": "OREDO", "shares": 2,"price": 1170.0, "change": "-3.03%", "color": Colors.red},
      {"name": "OQ", "symbol": "OQ","shares": 8, "price": 328.08, "change": "-0.22%", "color": Colors.red},
      {"name": "NBO", "symbol": "NBO", "shares": 12,"price": 264.01, "change": "+2.22%", "color": Colors.green},
      {"name": "OXY", "symbol": "OXY","shares": 9, "price": 264.01, "change": "+2.22%", "color": Colors.green},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromRGBO(22, 65, 24, 0.291),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(6, 48, 8, 160), Color.fromRGBO(0, 78, 91, 160)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Portfolio Value',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              Text(
                '\$15,340.58',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(
                            'assets/images/stock.jpg',
                            width: 360,
                            height: 360,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, color: Colors.white70),
                          ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: portfolioStocks.length,
                  itemBuilder: (context, index) {
                    final stock = portfolioStocks[index];
                    return Card(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        title: Text(stock['name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        subtitle: Text('${stock['shares']} Shares - ${stock['symbol']}', style: TextStyle(color: Colors.white70)),
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