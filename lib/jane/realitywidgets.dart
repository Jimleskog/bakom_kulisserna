import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

final List<String> realityBannerTexts = [
  'BUY MORE',
  'CARE LESS',
];

List<Widget> buildRealityWidgets(ScrollController controller) {
  return [
    buildHeader(logo: buildAssetString('logo.png')),
    buildRollingBanner(realityBannerTexts, controller),
    buildPictureWholeScreeenWidget(
        buildAssetString('dark1.png'),
        'SWEATSHOP LIVES',
        'Långa dagar, låg lön - så ser verkligheten ut bakom modeindustrin.',
        'LÄS MER'),
    buildsmallContainerBanner('Köp nu - betala med pengar du inte har'),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildPictureWithButton(buildAssetString('dark.jpg'), 'FALSKA IDEAL'),
          buildPictureWithButton(
              buildAssetString('made_this.png'), 'INFLUENCER CULTURE'),
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
    buildPictureWholeScreeenWidget(buildAssetString('made_this.png'),
        'GREENWASHING', 'Hur hållbart är det egentligen?', 'SE HELA SANNINGEN'),
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
  ];
}
