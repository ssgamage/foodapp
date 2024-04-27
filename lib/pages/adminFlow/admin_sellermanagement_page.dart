import 'package:flutter/material.dart';
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/adminFlow/seller_details_page.dart';

class SupplierManagement extends StatefulWidget {
  @override
  _SupplierManagementState createState() => _SupplierManagementState();
}

class _SupplierManagementState extends State<SupplierManagement> {
  List<SupplierData> suppliers = [
    SupplierData(
      name: 'Green House',
      email: 'chathurikaalwis@gmail.com',
      imagePath: 'https://example.com/assets/GreenHouse_image.jpg',
    ),
    SupplierData(
      name: 'M&D Shop',
      email: 'MDShop@gmail.com',
      imagePath: 'https://example.com/assets/M&DShop_image.jpg',
    ),
    SupplierData(
      name: 'Gam madda',
      email: 'Gam madda@gmail.com',
      imagePath: 'https://example.com/assets/Gammadda_image.jpg',
    ),
    SupplierData(
      name: 'Rivirasa Bojun',
      email: 'Rivirasa@gmail.com',
      imagePath: 'https://example.com/assets/Rivirasa_image.jpg',
    ),
    SupplierData(
      name: 'Awanhala',
      email: 'Awanhala@gmail.com',
      imagePath: 'https://example.com/assets/Awanhala_image.jpg',
    ),
  ];

  List<SupplierData> filteredSuppliers = [];

  double verticalPadding = 10.0; // Adjust the vertical padding here

  @override
  void initState() {
    super.initState();
    filteredSuppliers = suppliers;
  }

  void filterSuppliers(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSuppliers = suppliers;
      } else {
        filteredSuppliers = suppliers
            .where((supplier) =>
                supplier.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 218, 218),
      appBar: AppBar(
        title: Text(
          'Supplier Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: CustomColor.textBlack,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 219, 218, 218),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search here...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (value) {
                filterSuppliers(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding, horizontal: 20),
              itemCount: filteredSuppliers.length,
              itemBuilder: (BuildContext context, int index) {
                return SupplierCard(
                  supplierData: filteredSuppliers[index],
                  onTap: () {
                    // Navigate to SellerDetails page when a card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellerDetails(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SupplierData {
  final String name;
  final String email;
  final String imagePath;

  SupplierData({
    required this.name,
    required this.email,
    required this.imagePath,
  });
}

class SupplierCard extends StatelessWidget {
  final SupplierData supplierData;
  final VoidCallback onTap;

  const SupplierCard({
    required this.supplierData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(supplierData.imagePath),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    supplierData.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    supplierData.email,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: CustomColor.textBlack,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.chevron_right,
                    color: CustomColor.textBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
