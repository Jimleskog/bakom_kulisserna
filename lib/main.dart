import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const BakomKulissernaApp());
}

const Color flashColor = Color.fromARGB(255, 108, 255, 221);

class BakomKulissernaApp extends StatelessWidget {
  const BakomKulissernaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FashionStorePage(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            backgroundColor: Colors.white, // Background color
            foregroundColor: Colors.black, // Text color
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}

class FashionStorePage extends StatefulWidget {
  @override
  _FashionStorePageState createState() => _FashionStorePageState();
}

class _FashionStorePageState extends State<FashionStorePage>
    with SingleTickerProviderStateMixin {
  bool showReality = false;
  late final AnimationController _animationController;
  late final Animation<double> _flipAnimation;
  late final PageController _bannerController;
  Timer? _bannerTimer;

  @override
  void initState() {
    super.initState();

    // Initialize the page flip animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _flipAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Initialize banner controller and auto-scroll timer
    _bannerController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _bannerController.dispose();
    _bannerTimer?.cancel();
    super.dispose();
  }

  void toggleReality() {
    if (showReality) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      showReality = !showReality;
    });
  }

  // Start a smooth, continuous auto-scroll effect
  void _startAutoScroll() {
    const double scrollSpeed = 2.0; // Adjust speed for smoothness
    _bannerTimer =
        Timer.periodic(const Duration(milliseconds: 30), (Timer timer) {
      if (_bannerController.hasClients) {
        _bannerController.jumpTo(_bannerController.offset + scrollSpeed);

        // Loop the banner when reaching the end
        if (_bannerController.position.pixels >=
            _bannerController.position.maxScrollExtent) {
          _bannerController.jumpTo(0.0);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bakom Kulisserna',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: toggleReality,
            tooltip: showReality ? 'Switch to Store View' : 'Reveal Reality',
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective effect
              ..rotateY(pi * _flipAnimation.value),
            alignment: Alignment.center,
            child: _flipAnimation.value < 0.5
                ? buildFashionStoreView(context)
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: buildRealityView(context),
                  ),
          );
        },
      ),
    );
  }

  Widget buildFashionStoreView(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(logo: buildAssetString('logo.png')),
          buildRollingBanner(fashionBannerTexts),
          buildPictureWholeScreeenWidget(
              buildAssetString('pic.jpg'),
              'SWEATER VIBES',
              'Mjukt, nyttigt oversize - årets skönaste trend för sommaren',
              'SHOPPA NU'),
          buildsmallContainerBanner('Köp nu - betala senare'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildPictureWithButton(buildAssetString('pic.jpg'), 'BEAUTY'),
                buildPictureWithButton(
                    buildAssetString('pic.jpg'), 'CNSQNS x Liza'),
                buildPictureWithButton(buildAssetString('pic.jpg'), 'STICKAT'),
              ],
            ),
          ),
          buildCategorySection(
              'SUPER SALE', 'Passa på 50 - 70% rabatt på allt.', 'SHOPPA REA'),
          const SizedBox(height: 16),
          buildPictureWholeScreeenWidget(
              buildAssetString('pic.jpg'),
              'RECYCLED',
              'Vår planet, vårt ansvar. Återvunna fibrer och skarba siluetter.',
              'SHOPPA NU'),
          const SizedBox(height: 16),
          buildSubscriptionSection(
            headerText: 'Få 10% rabatt & massa inspo!',
            descriptionText:
                'Missa inga erbjudanden - prenumerera på vårt nyhetsbrev och få 10% rabatt på ditt första köp.',
            buttonText: 'PRENUMERERA',
            shopSectionHeader: 'Shop',
            shopLinks: ['Nyheter', 'Kläder', 'Beauty'],
            aboutSectionHeader: 'Om oss',
            aboutLinks: ['Hållbarhet', 'Frakt & Retur', 'Influencers'],
            legalSectionHeader: 'Legal',
            legalLinks: ['Cookies', 'Integritetspolicy', 'Kontakta oss'],
          )
        ],
      ),
    );
  }

  String buildAssetString(String assetString) {
    return 'assets/images/$assetString';
  }

  Widget buildRealityView(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(logo: buildAssetString('logo.png')),
          buildRollingBanner(realityBannerTexts),
          buildPictureWholeScreeenWidget(
              buildAssetString('dark.jpg'),
              'SWEATSHOP LIVES',
              'Långa dagar, låg lön - så ser verkligheten ut bakom modeindustrin.',
              'LÄS MER'),
          buildsmallContainerBanner('Köp nu - betala med pengar du inte har'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildPictureWithButton(
                    buildAssetString('dark.jpg'), 'FALSKA IDEAL'),
                buildPictureWithButton(
                    buildAssetString('dark.jpg'), 'INFLUENCER CULTURE'),
                buildPictureWithButton(
                    buildAssetString('dark.jpg'), 'BILLIGA MATERIAL'),
              ],
            ),
          ),
          buildCategorySection(
              'SUPER FAIL',
              'Vad är egentligen REA? Och vem betalar priset för låga priser?',
              'LÄS OM REA'),
          const SizedBox(height: 16),
          buildPictureWholeScreeenWidget(
              buildAssetString('dark.jpg'),
              'GREENWASHING',
              'Hur hållbart är det egentligen?',
              'SE HELA SANNINGEN'),
          const SizedBox(height: 16),
          buildSubscriptionSection(
            headerText: 'Verkligheten bakom modeindustrin',
            descriptionText:
                'Få insikter om de verkliga förhållandena i modeindustrin - prenumerera på vårt nyhetsbrev.',
            buttonText: 'PRENUMERERA',
            shopSectionHeader: 'Verklighet',
            shopLinks: ['Arbetsförhållanden', 'Miljöpåverkan', 'Etik'],
            aboutSectionHeader: 'Om oss',
            aboutLinks: ['Vår historia', 'Vårt uppdrag', 'Våra värderingar'],
            legalSectionHeader: 'Legal',
            legalLinks: ['Cookies', 'Integritetspolicy', 'Kontakta oss'],
          )
        ],
      ),
    );
  }

  Widget buildsmallContainerBanner(String text) {
    return Container(
      color: const Color.fromARGB(255, 70, 52, 52),
      width: double.infinity,
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget buildPictureWithButton(String imagePath, String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                    child: FittedBox(
                        fit: BoxFit.fitWidth, child: Text(buttonText)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPictureWholeScreeenWidget(String assetString, String titleText,
      String subtitleText, String buttonText) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: 300,
            color: Colors.grey,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    assetString,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(titleText,
                              style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            subtitleText,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(buttonText),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget buildHeader({
    required String logo,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 600;
          return Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Menu Icon
                      IconButton(
                        icon: const Icon(Icons.menu,
                            size: 30, color: Colors.black),
                        onPressed: () {
                          // Logic for Menu button press
                          print("Menu pressed");
                        },
                      ),
                      if (!isSmallScreen) ...[
                        const SizedBox(width: 10),
                        // Search Icon and Text
                        IconButton(
                          icon: const Icon(Icons.search,
                              size: 30, color: Colors.black),
                          onPressed: () {
                            // Logic for Search button press
                            print("Search pressed");
                          },
                        ),
                        const Text(
                          'Sök produkter',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ],
                  ),

                  // Centered Logo
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      logo,
                      height: 100, // Adjust logo height
                      width: 100,
                    ),
                  ),

                  // Right-side icons: user, favorites, cart
                  Row(
                    children: [
                      if (!isSmallScreen) ...[
                        IconButton(
                          icon: const Icon(Icons.person_outline,
                              size: 30, color: Colors.grey),
                          onPressed: () {
                            // Logic for User button press
                            print("User pressed");
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            // Logic for Favorites button press
                            print("Favorites pressed");
                          },
                          icon: const Icon(Icons.favorite_outline,
                              size: 30, color: Colors.grey),
                        ),
                      ],
                      IconButton(
                        icon: const Icon(Icons.shopping_bag_outlined,
                            size: 30, color: Colors.grey),
                        onPressed: () {
                          // Logic for Cart button press
                          print("Cart pressed");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  final List<String> fashionBannerTexts = [
    'Super Sale',
    '50-70% Off',
    'Limited Time Offer: Buy 1 Get 1 Free'
  ];

  final List<String> realityBannerTexts = [
    'BUY MORE',
    'CARE LESS',
  ];

  Widget buildRollingBanner(List<String> texts) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _bannerController,
        itemBuilder: (context, index) {
          final text = texts[index % texts.length];

          return buildBannerItem(text);
        },
      ),
    );
  }

  Widget buildBannerItem(String text) {
    return Container(
      margin: EdgeInsets.zero,
      color: flashColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget buildCategorySection(
      String title, String description, String buttonText) {
    return Container(
      width: double.infinity,
      color: flashColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle navigation to a more detailed page
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  Widget buildBannerSection(
      String imagePath, String buttonText, Color buttonColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(imagePath,
              fit: BoxFit.cover, width: double.infinity, height: 200),
          Positioned(
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              color: buttonColor.withOpacity(0.8),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
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

Widget buildSubscriptionSection({
  required String headerText,
  required String descriptionText,
  required String buttonText,
  required String shopSectionHeader,
  required List<String> shopLinks,
  required String aboutSectionHeader,
  required List<String> aboutLinks,
  required String legalSectionHeader,
  required List<String> legalLinks,
}) {
  return LayoutBuilder(builder: (context, constraints) {
    final screenwidth = constraints.maxWidth;
    return Container(
      color: const Color.fromARGB(255, 202, 190, 186),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              // Subscription Banner
              Text(
                headerText,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                descriptionText,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  buttonText,
                ),
              ),
              const SizedBox(height: 40),

              // Sections for Shop, About Us, Legal
              if (screenwidth < 450)
                Column(
                  children: [
                    _buildSection(shopSectionHeader, shopLinks),
                    const SizedBox(height: 20),
                    _buildSection(aboutSectionHeader, aboutLinks),
                    const SizedBox(height: 20),
                    _buildSection(legalSectionHeader, legalLinks),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSection(shopSectionHeader, shopLinks),
                    _buildSection(aboutSectionHeader, aboutLinks),
                    _buildSection(legalSectionHeader, legalLinks),
                  ],
                ),
              const SizedBox(height: 40),

              // Social Media Icons (Placeholders)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook, color: Colors.black),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.picture_as_pdf, color: Colors.black),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.music_note, color: Colors.black),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.linked_camera, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  });
}

Widget _buildSection(String sectionHeader, List<String> sectionLinks) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        sectionHeader,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 10),
      for (String link in sectionLinks)
        TextButton(
          onPressed: () {
            // Handle link tap
          },
          child: Text(
            link,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
    ],
  );
}
