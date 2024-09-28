import 'package:flutter/material.dart';

void main() {
  runApp(BakomKulissernaApp());
}

class BakomKulissernaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FashionStorePage(),
    );
  }
}

class FashionStorePage extends StatefulWidget {
  @override
  _FashionStorePageState createState() => _FashionStorePageState();
}

class _FashionStorePageState extends State<FashionStorePage> {
  bool showReality = false;

  void toggleReality() {
    setState(() {
      showReality = !showReality;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bakom Kulisserna',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.visibility),
            onPressed: toggleReality,
            tooltip: showReality ? 'Switch to Store View' : 'Reveal Reality',
          ),
        ],
      ),
      body: showReality
          ? buildRealityView(context)
          : buildFashionStoreView(context),
    );
  }

  Widget buildFashionStoreView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(
              'HETASTE REA JUST NU', 'UPP TILL 70% RABATT', Colors.redAccent),
          buildCategorySection(
              context, 'Nyheter', 'Upptäck säsongens trendigaste plagg.'),
          buildBannerSection(
              'assets/fashion_sale.jpg', 'Shoppa Nu', Colors.orange),
          buildCategorySection(
              context, 'Beauty', 'Skönhetsprodukter du inte kan vara utan.'),
          buildBannerSection(
              'assets/fashion_banner.jpg', 'Betala senare', Colors.green),
        ],
      ),
    );
  }

  Widget buildRealityView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader('VERKLIGHETEN BAKOM MODET',
              'SVETTFABRIKER OCH EXPLOATERING', Colors.black),
          buildCategorySection(context, 'Influencers',
              'De döljer verkligheten bakom sponsrade inlägg.'),
          buildBannerSection(
              'assets/fashion_reality.jpg', 'Läs mer', Colors.redAccent),
          buildCategorySection(
              context, 'Greenwashing', 'Hur hållbart är det egentligen?'),
          buildBannerSection('assets/fashion_exploitation.jpg',
              'Se hela sanningen', Colors.deepPurple),
        ],
      ),
    );
  }

  Widget buildHeader(String title, String subtitle, Color color) {
    return Container(
      width: double.infinity,
      color: color,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategorySection(
      BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Handle navigation to a more detailed page
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  'Utforska',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBannerSection(
      String imagePath, String buttonText, Color buttonColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(imagePath,
              fit: BoxFit.cover, width: double.infinity, height: 200),
          Positioned(
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: buttonColor.withOpacity(0.8),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
