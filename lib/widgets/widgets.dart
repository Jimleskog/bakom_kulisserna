import 'package:flutter/material.dart';

import '../jane/colors.dart';
import '../jane/fonts.dart';
import '../main.dart';

Widget buildPage(List<Widget> children) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}

String buildAssetString(String assetString) {
  return 'images/$assetString';
}

Widget buildsmallContainerBanner(String text) {
  return Container(
    color: smallBannerColor,
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: AppFont.bannerTexts.copyWith(color: smallBannerTextColor)),
        const Icon(
          Icons.arrow_forward,
          color: smallBannerTextColor,
        )
      ],
    ),
  );
}

Widget buildPictureWithButton(String imagePath, String buttonText) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 624,
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
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                // style: ElevatedButton.styleFrom(),
                child: FittedBox(fit: BoxFit.fitWidth, child: Text(buttonText)),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class PictureData {
  final String picture;
  final String button;

  PictureData({required this.picture, required this.button});
}

List<Widget> _smallPictureRow(
    {required List<PictureData> data, bool expand = false}) {
  return data.map((data) {
    final widget =
        buildPictureWithButton(buildAssetString(data.picture), data.button);
    return expand ? Expanded(child: widget) : widget;
  }).toList();
}

Widget buildPictureRow(BuildContext context, List<PictureData> data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MediaQuery.of(context).size.width < desktopToMobileWidth
        ? Wrap(children: _smallPictureRow(data: data))
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _smallPictureRow(data: data, expand: true)),
  );
}

Widget buildPictureWholeScreeenWidget(String assetString, String titleText,
    String subtitleText, String buttonText) {
  return Stack(
    children: [
      SizedBox(
          width: double.infinity,
          height: 700,
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
                        child: Text(
                          titleText,
                          style: AppFont.titleLarge.copyWith(
                              color: colorOnPictureTexts, fontSize: 80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(subtitleText,
                            style: AppFont.pictureBodies
                                .copyWith(color: colorOnPictureTexts)),
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

Widget buildHeader({required String logo, required String searchString}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
    child: LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < desktopToMobileWidth;
        bool isSearchActive = false;
        TextEditingController searchController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
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
                        if (!isSearchActive)
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.search,
                                    size: 30, color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    isSearchActive = true;
                                  });
                                },
                              ),
                              Text(
                                searchString,
                                style: AppFont.footerBody,
                              ),
                            ],
                          ),
                        if (isSearchActive)
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    hintText: searchString,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close,
                                    size: 30, color: Colors.black),
                                onPressed: () {
                                  setState(() {
                                    isSearchActive = false;
                                    searchController.clear();
                                  });
                                },
                              ),
                            ],
                          ),
                      ],
                    ],
                  ),
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
                Expanded(
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      IconButton(
                        icon: const Icon(Icons.person_outline,
                            size: 30, color: Colors.grey),
                        onPressed: () {
                          // Logic for User button press
                          print("User pressed");
                        },
                      ),
                      if (!isSmallScreen) ...[
                        IconButton(
                          onPressed: () {
                            // Logic for Favorites button press
                            print("Favorites pressed");
                          },
                          icon: const Icon(Icons.favorite_outline,
                              size: 30, color: Colors.grey),
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined,
                              size: 30, color: Colors.grey),
                          onPressed: () {
                            // Logic for Cart button press
                            print("Cart pressed");
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    ),
  );
}

Widget buildRollingBanner(List<String> texts, ScrollController controller) {
  return Container(
    color: flashColor,
    height: 35,
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
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Center(
      child: Text(
        text,
        style: AppFont.bannerTexts,
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
          style: AppFont.titleLarge.copyWith(
            color: colorOnTextsWithColoredBackground,
            fontStyle: FontStyle.italic,
          ),
        ),
        // const TextStyle(
        //   fontStyle: FontStyle.italic,
        //   fontSize: 50,
        //   fontWeight: FontWeight.w900,
        //   color: colorOnTextsWithColoredBackground,
        // ),
        // ),
        const SizedBox(height: 10),
        Text(
          description,
          style: AppFont.pictureBodies,
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
                style: AppFont.footerAndLinkHeader,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                descriptionText,
                style: AppFont.footerBody,
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
      Text(sectionHeader, style: AppFont.footerAndLinkHeader),
      const SizedBox(height: 10),
      for (String link in sectionLinks)
        TextButton(
          onPressed: () {
            // Handle link tap
          },
          child: Text(link, style: AppFont.linkTexts),
        ),
    ],
  );
}
