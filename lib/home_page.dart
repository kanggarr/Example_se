import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage_demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.account_circle, size: 48),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'สวัสดีวิชากร',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'มาเริ่มทำข้อสอบกันเถอะ!',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          // centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BannerWidget(),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'วิชา',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildCategory('En', Icons.science, Color(0xFF9184CC)),
                    SizedBox(width: 8),
                    _buildCategory(
                        'เคมี', Icons.auto_awesome_mosaic, Color(0xFFE0DFFD)),
                    SizedBox(width: 8),
                    _buildCategory(
                        'ชีววิทยา', Icons.biotech, Color(0xFFFFC212)),
                    SizedBox(width: 8),
                    _buildCategory(
                        'คณิตศาสตร์', Icons.calculate, Color(0xFFF9B0C3)),
                    SizedBox(width: 8),
                    _buildCategory('ฟิสิกส์', Icons.biotech, Color(0xFF9184CC)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      'ข้อสอบแนะนำ',
                      'ข้อสอบที่เหมาะสำหรับคุณ',
                      Icons.book,
                      Colors.white,
                      Colors.black,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoCard(
                      'ข้อสอบแก้ตัว',
                      'รวมข้อสอบทุกวิชาที่คุณเคยตอบผิด',
                      Icons.access_alarm,
                      Colors.white,
                      Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SecondBannerWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'เป้าหมาย',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'วิเคราะห์',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'โปรไฟล์',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF9B0C3),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategory(String text, IconData icon, Color color) {
    return Container(
      width: 69,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle, IconData icon,
      Color bgColor, Color textColor) {
    return Container(
      height: 200,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(icon, size: 28, color: textColor),
              Text(title,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              Text(subtitle,
                  style: TextStyle(
                      color: textColor.withOpacity(0.7), fontSize: 12)),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text('เริ่มต้น'),
                style: ElevatedButton.styleFrom(
                  primary: bgColor,
                  onPrimary: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFE0DFFD),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 30.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'เป้าหมายประจำวันนี้คือ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'ทำข้อสอบ 1 วิชา',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0xFFE0DFFD),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 30.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'หลักสูตรเร่งรัด',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'หลักสูตรเร่งรัดสำหรับผู้เร่งรีบต้องการการเรียนรู้แบบรวดเร็วทันใจ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text('เริ่มต้น'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
