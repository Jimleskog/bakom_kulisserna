import 'package:flutter/material.dart';

import 'jannika/colors.dart';

Widget buildPage(List<Widget> children) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

String buildAssetString(String assetString) {
  return 'assets/images/$assetString';
}

Widget buildsmallContainerBanner(String text) {
  return Container(
    color: smallBannerColor,
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
                  child:
                      FittedBox(fit: BoxFit.fitWidth, child: Text(buttonText)),
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
      SizedBox(
          width: double.infinity,
          height: 300,
          // color: Colors.grey,
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
                              color: colorOnPictureTexts,
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
                            color: colorOnPictureTexts,
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
                      icon:
                          const Icon(Icons.menu, size: 30, color: Colors.black),
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

Widget buildRollingBanner(List<String> texts, ScrollController controller) {
  return SizedBox(
    height: 30,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: controller,
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
              fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
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
