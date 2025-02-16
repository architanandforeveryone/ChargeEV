import 'package:ev/12A.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isFiltered = false;

  List<Map<String, String>> trendingSearches = [
    {
      "title": "Broome charging hub",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuq94E8OJVLf9T7Nu6AV19ygCe-PjxJwJVqg&s"
    },
    {
      "title": "Tata power charging hub",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuq94E8OJVLf9T7Nu6AV19ygCe-PjxJwJVqg&s"
    },
    {
      "title": "Dc ev charging hub",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuq94E8OJVLf9T7Nu6AV19ygCe-PjxJwJVqg&s"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.grey),
                  onPressed: () {
                    _showFilterOptions(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            if (isFiltered)
              ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuq94E8OJVLf9T7Nu6AV19ygCe-PjxJwJVqg&s"),
                  ),
                  title: Text("Broome charging hub",
                      style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChargingStation()));
                  })
            else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recently searched",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isFiltered = true;
                      });
                    },
                    child: Text("Clear", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("# Broome charging station",
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
              Text("# Hp charging station",
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
              Text("# Dc ev charging station",
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
              SizedBox(height: 30),
              Text("Trending search",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: trendingSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(trendingSearches[index]["image"]!),
                      ),
                      title: Text(trendingSearches[index]["title"]!,
                          style: TextStyle(fontSize: 16)),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Filter",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 16),
                    _buildFilterSection("By distance", [
                      "500M",
                      "1 KM",
                      "2 KM",
                      "5 KM",
                      "10 KM",
                      "20 KM",
                      "50 KM",
                      "100 KM"
                    ]),
                    _buildFilterSection("Connection type", [
                      "J-1772",
                      "Tesla",
                      "Mennekers",
                      "CCS2",
                      "Chademo",
                      "CCS"
                    ]),
                    _buildFilterSection("By vehicle type",
                        ["2 wheeler", "3 wheeler", "4 wheeler"]),
                    _buildFilterSection("Speed", [
                      "Standard (3.7 kw)",
                      "Semi fast (3.7 - 20 kw)",
                      "Fast (20 - 73 kw)",
                      "Ultra fast (>43 kw)"
                    ]),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFiltered = true;
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text("Filter",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Wrap(
          spacing: 8,
          children: options.map((option) {
            return ChoiceChip(
              label: Text(option),
              selected: false,
              onSelected: (selected) {},
              selectedColor: Colors.blue.shade100,
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
