
import 'package:flutter/material.dart';

class StockDetailsScreen extends StatelessWidget {
  final String stockName;
  final String stockSymbol;
  final double stockPrice;

  const StockDetailsScreen({
    super.key,
    required this.stockName,
    required this.stockSymbol,
    required this.stockPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(22, 65, 24, 0.291),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(6, 48, 8, 170), Color.fromRGBO(0, 78, 91, 170)],
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
                '\$${stockPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Stock Symbol: $stockSymbol',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child:  Image.asset(
                            'assets/images/stock.jpg',
                            width: 360,
                            height: 360,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, color: Colors.white70),
                          ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1D', style: TextStyle(color: Colors.white70)),
                  Text('1W', style: TextStyle(color: Colors.white70)),
                  Text('1M', style: TextStyle(color: Colors.white70)),
                  Text('1Y', style: TextStyle(color: Colors.white70)),
                  Text('ALL', style: TextStyle(color: Color.fromARGB(255, 66, 144, 69))),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Icon(Icons.article, color: Colors.white70),
                        title: Text('MarketWatch', style: TextStyle(color: Colors.white)),
                        subtitle: Text('Latest stock news and updates...', style: TextStyle(color: Colors.white70)),
                      ),
                    ),
                    Card(
                      color:  Colors.black54,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Icon(Icons.trending_up, color: Colors.white70),
                        title: Text('Investment Insights', style: TextStyle(color: Colors.white)),
                        subtitle: Text('Stock performance predictions...', style: TextStyle(color: Colors.white70)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 201, 57, 47),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {},
                    child: Text('Sell', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const  Color.fromARGB(255, 33, 96, 56),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {},
                    child: Text('Buy', style: TextStyle(color: Colors.white, fontSize: 18)),
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
