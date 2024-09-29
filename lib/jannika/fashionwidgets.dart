import 'package:flutter/material.dart';

import '../widgets.dart';

final List<String> fashionBannerTexts = [
  'Super Sale',
  '50-70% Off',
  'Limited Time Offer: Buy 1 Get 1 Free'
];

List<Widget> fashionWidgets(ScrollController controller) {
  return [
    buildHeader(logo: buildAssetString('logo.png')),
    buildRollingBanner(fashionBannerTexts, controller),
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
          buildPictureWithButton(buildAssetString('pic.jpg'), 'CNSQNS x Liza'),
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
  ];
}
