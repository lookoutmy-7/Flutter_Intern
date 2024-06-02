import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildImageSection(),
            Expanded(
              child: _buildBody(),
            ),
            SizedBox(height: 0), // Add a gap between the body and the bottom navigation bar
            _buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 66.0, vertical: 50.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Replace with the actual image URL
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                'Thomas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          _buildQuickActions(),
          Divider(color: Colors.grey[300]),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildGasInfo(), // Gas section
                  SizedBox(height: 20), // Add some space here if needed
                  _buildBillsInfo(), // Bills section
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Add gap to avoid overlapping with bottom navigation
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: 55,
                child: const Divider(
                  color: Colors.deepPurple,
                  thickness: 4,
                ),
              ),
            ],
          ),
          SizedBox(height: 30), // Add some space between the line and the text
          const Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align the text to the left
            children: [
              Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildQuickActionItem(Icons.receipt, 'Bills'),
              _buildQuickActionItem(Icons.power_off, 'Disconnect'),
              _buildQuickActionItem(Icons.transform, 'Transfer'),
              _buildQuickActionItem(Icons.build, 'Services'),
              _buildQuickActionItem(Icons.report_problem, 'Complaint'),
              _buildQuickActionItem(Icons.update, 'Update'),
              _buildQuickActionItem(Icons.link, 'Connection'),
              _buildQuickActionItem(Icons.wifi_off, 'Outage'),
            ],
          ),
        ],
      ),
    );
  }




  Widget _buildQuickActionItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.deepPurple.withOpacity(0.1),
          child: Icon(
            icon,
            color: Colors.deepPurple,
            size: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGasInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Gas | SA1234567',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Container(
                width: 130,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0), // Adjust the radius as needed
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Align(
                      alignment: Alignment.centerRight,  // Align text to the right
                      child: Text(
                        'Select a month', // Customize the hint text
                        style: TextStyle(
                          color: Colors.grey, // Set the text color to grey
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    items: <String>['Last Month', 'This Month'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row( // Use Row for horizontal alignment
                          mainAxisAlignment: MainAxisAlignment.start, // Align text to the right
                          children: [
                            Text(value, style: TextStyle( // Apply style to all items
                              color: Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16.0,
                            )),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 30.0,
                    isExpanded: true,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // For Build Card
  Widget _buildBillsInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 4.0,
                    percent: 0.7,
                    center: Text("70%"),
                    progressColor: Colors.deepPurple,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bills',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '20 Jan 2020',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '43\$',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard, color: Colors.deepOrange),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart, color: Colors.grey),
          label: 'Usage',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, color: Colors.grey),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support, color: Colors.grey),
          label: 'Support',
        ),
      ],
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}
