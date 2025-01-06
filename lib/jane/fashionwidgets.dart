import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'colors.dart';

List<Widget> fashionWidgets(
    ScrollController controller, BuildContext context, bool isMobile) {
  return [
    buildHeader(
        logo: buildAssetString('eye open.png'), searchString: 'Sök produkter'),
    buildRollingBanner(['SUPER SALE', '50-70%'], controller),
    buildPictureWholeScreeenWidget(
        context,
        buildAssetString('542WnRSg.png'),
        isMobile ? 'SWEATER\nVIBES' : 'SWEATER VIBES',
        'Mjukt, fluffigt och oversize - årets skönaste trend är här',
        'SHOPPA NU',
        true),
    buildsmallContainerBanner('Köp nu - betala senare'),
    buildPictureRow(context, [
      PictureData(picture: 'U1JWemyA.png', button: 'NEW ARRIVALS'),
      PictureData(picture: 't6xmCctQ.png', button: 'COLLAB W/ HANNA H'),
      PictureData(picture: 'ju35G8Tw.png', button: '90s KNITS'),
    ]),
    buildCategorySection('SUPER SALE', 'Passa på: 50-70% på allt!',
        'SHOPPA REA', 'supersale.png'),
    const SizedBox(height: 16),
    buildPictureWholeScreeenWidget(
        extraText: 'CONCIOUS',
        context,
        buildAssetString('GwUdNzCA.png'),
        'COLLECTION',
        'Vår planet, vårt ansvar. Återvunna fibrer och skarpa siluetter.',
        'SHOPPA NU',
        false),
    const SizedBox(height: 16),
    buildSubscriptionSection(
      headerText: 'Få 10% rabatt & massa inspo!',
      descriptionText:
          'Missa inga erbjudanden - prenumerera på vårt nyhetsbrev och få 10% rabatt på ditt första köp.',
      buttonText: 'PRENUMERERA',
      shopSectionHeader: 'Shop',
      shopLinks: ['Nyheter', 'Instagram shop', 'Collections'],
      aboutSectionHeader: 'Om oss',
      aboutLinks: ['Hållbarhet', 'Frakt & Retur', 'Influencers'],
      legalSectionHeader: 'Legal',
      legalLinks: ['Cookies', 'Integritetspolicy', 'Kontakta oss'],
    )
  ];
}
