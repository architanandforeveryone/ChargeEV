import 'package:ev/homescreen.dart';
import 'package:flutter/material.dart';

class YourOrdersPage extends StatefulWidget {
  final String vehicleType;
  final String vehicleModel;
  final String connectionType;
  final String date;
  final String time;
  final double price;

  YourOrdersPage({
    required this.vehicleType,
    required this.vehicleModel,
    required this.connectionType,
    required this.date,
    required this.time,
    required this.price,
  });

  @override
  _YourOrdersPageState createState() => _YourOrdersPageState();
}

class _YourOrdersPageState extends State<YourOrdersPage> {
  List<Map<String, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    _addNewOrder();
  }

  void _addNewOrder() {
    setState(() {
      orders.insert(0, {
        'vehicleType': widget.vehicleType,
        'vehicleModel': widget.vehicleModel,
        'connectionType': widget.connectionType,
        'date': widget.date,
        'time': widget.time,
        'price': widget.price,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homescreen()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vehicle Type: ${order['vehicleType']}',
                      style: TextStyle(fontSize: 18)),
                  Text('Vehicle Model: ${order['vehicleModel']}',
                      style: TextStyle(fontSize: 18)),
                  Text('Connection Type: ${order['connectionType']}',
                      style: TextStyle(fontSize: 18)),
                  Text('Date: ${order['date']}',
                      style: TextStyle(fontSize: 18)),
                  Text('Time: ${order['time']}',
                      style: TextStyle(fontSize: 18)),
                  Text(
                    'Price: ₹${order['price']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Pending',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
