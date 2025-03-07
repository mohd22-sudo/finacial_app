
import 'package:fl_chart/fl_chart.dart';
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
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LineChart(
                    LineChartData(
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40, 
                            getTitlesWidget: (value, meta) {
                              return Text(
                                '\$${value.toStringAsFixed(0)}',
                                style: TextStyle(color: Colors.white70, fontSize: 12),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 22, 
                            getTitlesWidget: (value, meta) {
                              List<String> labels = ['1D', '1W', '1M', '1Y', 'ALL'];
                              return Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  labels[value.toInt() % labels.length],
                                  style: TextStyle(color: Colors.white70, fontSize: 12),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 320),
                            FlSpot(1, 340),
                            FlSpot(2, 300),
                            FlSpot(3, 380),
                            FlSpot(4, 360),
                          ],
                          isCurved: true,
                          color: Colors.green,
                          barWidth: 3,
                          belowBarData: BarAreaData(show: false),
                          dotData: FlDotData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
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
