import 'dart:math';
import 'package:ev/myorders.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class BookingReceiptPage extends StatelessWidget {
  final String vehicleType;
  final String vehicleModel;
  final String connectionType;
  final String date;
  final String time;
  final double price;

  BookingReceiptPage({
    required this.vehicleType,
    required this.vehicleModel,
    required this.connectionType,
    required this.date,
    required this.time,
    required this.price,
  });

  String generateRandomId() {
    return Random().nextInt(999999).toString().padLeft(6, '0');
  }

  @override
  Widget build(BuildContext context) {
    String bookingId = generateRandomId();
    String qrData =
        'Booking ID: $bookingId\nVehicle: $vehicleType\nModel: $vehicleModel\nConnection: $connectionType\nDate: $date\nTime: $time\nPrice: ₹$price';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Receipt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
              SizedBox(height: 20),
              Text(
                'Scan this QR code to make payment from UPI',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Text(
                'Booking Confirmation',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Booking ID: $bookingId',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vehicle Type: $vehicleType',
                        style: TextStyle(fontSize: 18)),
                    Text('Vehicle Model: $vehicleModel',
                        style: TextStyle(fontSize: 18)),
                    Text('Connection Type: $connectionType',
                        style: TextStyle(fontSize: 18)),
                    Text('Date: $date', style: TextStyle(fontSize: 18)),
                    Text('Time: $time', style: TextStyle(fontSize: 18)),
                    Text(
                      'Price: ₹$price',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YourOrdersPage(
                              vehicleType: vehicleType,
                              vehicleModel: vehicleModel,
                              connectionType: connectionType,
                              date: date,
                              time: time,
                              price: price)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
