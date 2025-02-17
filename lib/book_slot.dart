import 'package:ev/receipt.dart';
import 'package:flutter/material.dart';

class makepayment extends StatefulWidget {
  final String date;
  final String time;
  final String connectionType;
  final double price;

  makepayment({
    required this.date,
    required this.time,
    required this.connectionType,
    required this.price,
  });

  @override
  State<makepayment> createState() => _makepaymentState();
}

class _makepaymentState extends State<makepayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Book Slot"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(height: 10),
            _buildStationInfo(),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(height: 10),
            SizedBox(height: 70),
            _buildVehicleInfo(),
            SizedBox(height: 20),
            _buildBookingDetails(),
            Spacer(),
            _buildPaymentButton(context), // Pass context to payment button
          ],
        ),
      ),
    );
  }

  Widget _buildStationInfo() {
    return Row(
      children: [
        Image.network(
          'https://cdn-icons-png.flaticon.com/128/7787/7787240.png',
          width: 100,
          height: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Broome Station",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
                children: List.generate(
                    5,
                    (index) =>
                        Icon(Icons.star, color: Colors.orange, size: 16))),
            Text("Sec -62 Noid , UP",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildVehicleInfo() {
    return Row(
      children: [
        Image.network(
          'https://cdn-icons-png.flaticon.com/128/3085/3085411.png',
          width: 100,
          height: 60,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Volvo XC40 Recharge",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("4 Wheeler",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildBookingDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Date", widget.date),
          _buildDetailRow("Slot Time", widget.time),
          _buildDetailRow("Connection Type", widget.connectionType),
          _buildDetailRow("Price", "\$${widget.price.toStringAsFixed(2)}/kw"),
          Divider(),
          _buildDetailRow("Total Pay", "\$100", isBold: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildPaymentButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the BookingReceiptPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingReceiptPage(
                vehicleType: "XC40 Recharge",
                vehicleModel: "Volvo XC40 Recharge",
                connectionType: widget.connectionType,
                date: widget.date,
                time: widget.time,
                price: widget.price,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          "Make Payment",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
