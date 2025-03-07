
import 'package:fl_chart/fl_chart.dart';
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