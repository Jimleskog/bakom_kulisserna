import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

List<Widget> buildRealityWidgets(
    ScrollController controller, BuildContext context) {
  return [
    buildHeader(logo: buildAssetString('logo.png')),
    buildRollingBanner([
      'BUY MORE',
      'CARE LESS',
    ], controller),
    buildPictureWholeScreeenWidget(
        buildAssetString('dark1.png'),
        'SWEATSHOP LIVES',
        'Långa dagar, låg lön - så ser verkligheten ut bakom modeindustrin.',
        'LÄS MER'),
    buildsmallContainerBanner('Köp nu - betala med pengar du inte har'),
    buildPictureRow(context, [
      PictureData(picture: 'dark.jpg', button: 'FALSKA IDEAL'),
      PictureData(picture: 'made_this.png', button: 'INFLUENCER CULTURE'),
      PictureData(picture: 'dark.jpg', button: 'BILLIGA MATERIAL'),
    ]),
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
