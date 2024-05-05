import 'package:flutter/material.dart'; //
import 'package:foodapp/constants/colors.dart';
import 'package:foodapp/pages/adminFlow/report_review_page.dart';
import 'package:foodapp/pages/validationFlow/firebase_auth_implimentation/firebase_auth_services.dart';

class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 195, 195),
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: CustomColor.textBlack,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                _handleLogout(context);
              },
              icon: Icon(
                Icons.logout,
                color: CustomColor.textBlack,
                size: 10,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: CustomColor.textBlack),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 239, 150, 61),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: CustomColor.textWhite,
          child: Column(
            children: [
              SizedBox(height: 25),
              _buildReportCard(
                name: 'Chathurika Alwis',
                reason: 'Poor Food Quality',
                reportType: 'User Report',
                onTap: () {
                  _navigateToReportReview(context, 'Report 1');
                },
              ),
              SizedBox(height: 8),
              _buildReportCard(
                name: 'GH Reshan',
                reason: 'Item Unavailability',
                reportType: 'User Report',
                onTap: () {
                  _navigateToReportReview(context, 'Report 2');
                },
              ),
              SizedBox(height: 8),
              _buildReportCard(
                name: 'Green House',
                reason: 'Unnecessary Order Reserves',
                reportType: 'Supplier Report',
                onTap: () {
                  _navigateToReportReview(context, 'Report 3');
                },
              ),
              SizedBox(height: 8),
              _buildReportCard(
                name: 'HYG Amalkith',
                reason: 'Unsatisfactory Packaging',
                reportType: 'User Report',
                onTap: () {
                  _navigateToReportReview(context, 'Report 4');
                },
              ),
              SizedBox(height: 8),
              _buildReportCard(
                name: 'YG Achintha',
                reason: 'Poor Customer Service Response',
                reportType: 'User Report',
                onTap: () {
                  _navigateToReportReview(context, 'Report 5');
                },
              ),
              SizedBox(height: 8),
              _buildReportCard(
                name: 'NN Tennakoon',
                reason: 'Health and Safety Concerns',
                reportType: 'User Report',
                onTap: () {
                  _navigateToReportReview(context, 'Report 6');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard({
    required String name,
    required String reason,
    required String reportType,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Reason: $reason',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: CustomColor.textBlack,
                    ),
                  ),
                  Text(
                    reportType,
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

  void _navigateToReportReview(BuildContext context, String report) {
    // Navigate to ReportReviewPage with the selected report
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReporReviewPage(),
      ),
    );
  }

  void _handleLogout(BuildContext context) async {
    await _authService.signOut(context); // Call the signOut method
  }
}
