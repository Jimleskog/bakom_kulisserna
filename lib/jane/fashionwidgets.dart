import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

List<Widget> fashionWidgets(ScrollController controller, BuildContext context) {
  return [
    buildHeader(logo: buildAssetString('logo.png')),
    buildRollingBanner(['SUPER SALE', '50-70%'], controller),
    buildPictureWholeScreeenWidget(
        buildAssetString('sweater vibes 2.png'),
        'SWEATER VIBES',
        'Mjukt, fluffigt och oversize - årets skönaste trend är här',
        'SHOPPA NU'),
    buildsmallContainerBanner('Köp nu - betala senare'),
    buildPictureRow(context, [
      PictureData(picture: 'Beauty 3.png', button: 'BEAUTY'),
      PictureData(picture: 'liza.png', button: 'CNSQNS x Liza'),
      PictureData(picture: 'stickat.png', button: 'STICKAT'),
    ]),
    buildCategorySection(
        'SUPER SALE', 'Passa på: 50-70% på allt!', 'SHOPPA REA'),
    const SizedBox(height: 16),
    buildPictureWholeScreeenWidget(
        buildAssetString('recycled.png'),
        'RECYCLED',
        'Vår planet, vårt ansvar. Återvunna fibrer och skarpa siluetter.',
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
