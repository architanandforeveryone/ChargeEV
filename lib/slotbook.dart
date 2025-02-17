import 'package:ev/book_slot.dart';
import 'package:ev/receipt.dart';
import 'package:flutter/material.dart';

class BookSlotScreen extends StatefulWidget {
  @override
  _BookSlotScreenState createState() => _BookSlotScreenState();
}

class _BookSlotScreenState extends State<BookSlotScreen> {
  String selectedVehicle = "Select vehicle type";
  String selectedVehicleModel = "Select vehicle model";
  String selectedConnection = "Select connection type";
  String selectedDate = "Select date";
  String selectedTime = "Select time";
  double selectedPrice = 600;

  final List<String> vehicleOptions = ["2 Wheeler", "3 Wheeler", "4 Wheeler"];
  final List<String> vehicleModelOptions = [
    "Model X",
    "Model Y",
    "Swift EV",
    "Tata Nexon EV",
    "Honda E"
  ];
  final List<String> connectionOptions = ["CCS2", "CCS", "Mennekes"];

  void _showDropdown(
      String title, List<String> options, Function(String) onSelect) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ...options.map((option) => ListTile(
                    title: Text(option, style: TextStyle(fontSize: 16)),
                    onTap: () {
                      onSelect(option);
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  void _showVehicleTypeSelector() {
    _showDropdown("Select Vehicle Type", vehicleOptions, (value) {
      setState(() => selectedVehicle = value);
    });
  }

  void _showVehicleModelSelector() {
    _showDropdown("Select Vehicle Model", vehicleModelOptions, (value) {
      setState(() => selectedVehicleModel = value);
    });
  }

  void _showConnectionTypeSelector() {
    _showDropdown("Select Connection Type", connectionOptions, (value) {
      setState(() => selectedConnection = value);
    });
  }

  void _showDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            colorScheme: ColorScheme.light(primary: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(
          () => selectedDate = "${picked.day}/${picked.month}/${picked.year}");
    }
  }

  void _showTimePicker() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.black,
            colorScheme: ColorScheme.light(primary: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => selectedTime = picked.format(context));
    }
  }

  void _navigateToBookingReceipt() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => makepayment(
          //vehicleType: selectedVehicle,
          //vehicleModel: selectedVehicleModel,
          connectionType: selectedConnection,
          date: selectedDate,
          time: selectedTime,
          price: selectedPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Book Slot"),
          backgroundColor: Colors.white,
          elevation: 0),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSelectorTile(
                "Vehicle Type", selectedVehicle, _showVehicleTypeSelector),
            _buildSelectorTile("Vehicle Model", selectedVehicleModel,
                _showVehicleModelSelector),
            _buildSelectorTile("Connection Type", selectedConnection,
                _showConnectionTypeSelector),
            _buildSelectorTile("Date", selectedDate, _showDatePicker),
            _buildSelectorTile("Time", selectedTime, _showTimePicker),
            _buildPriceSlider(),
            SizedBox(height: 20),
            _buildBookSlotButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectorTile(String label, String value, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: TextStyle(fontSize: 16)),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Slider(
          value: selectedPrice,
          min: 400,
          max: 800,
          divisions: 8,
          label: selectedPrice.round().toString(),
          onChanged: (value) {
            setState(() {
              selectedPrice = value;
            });
          },
        ),
        Center(
          child: Text("₹${selectedPrice.round()}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildBookSlotButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _navigateToBookingReceipt, // Navigate on button press
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text("Book Slot",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
