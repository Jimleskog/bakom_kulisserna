import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

List<Widget> buildRealityWidgets(
    ScrollController controller, BuildContext context) {
  return [
    buildHeader(logo: buildAssetString('logo.png'), searchString: 'Sök en lök'),
    buildRollingBanner([
      'BUY MORE',
      'CARE LESS',
    ], controller),
    buildPictureWholeScreeenWidget(
        buildAssetString('sweatshop lives.png'),
        'SWEATSHOP LIVES',
        'Långa dagar, låg lön, och utan skyddsnät - upplev modeindustrins baksida',
        'TESTA NU'),
    buildsmallContainerBanner('Köp nu - betala med pengar du inte har'),
    buildPictureRow(context, [
      PictureData(picture: 'falska ideal.png', button: 'FALSKA IDEAL'),
      PictureData(
          picture: 'influencer culture.png', button: 'INFLUENCER CULTURE'),
      PictureData(picture: 'billiga material.png', button: 'BILLIGA MATERIAL'),
    ]),
    buildCategorySection(
        'SUPER FAIL',
        'Vad är egentligen rea? Och vem betalar priset för låga priser?',
        'LÄS OM REA'),
    const SizedBox(height: 16),
    buildPictureWholeScreeenWidget(
        buildAssetString('greenwashing.png'),
        'GREENWASHING',
        '"Återvunna fibrer", "mer hållbart", "recycled" - visst låter det bra? Kanske för bra för att vara sant?',
        'SPELA "GREENSWASHER"'),
    const SizedBox(height: 16),
    buildSubscriptionSection(
      headerText: 'Vill du bli ännu svårare att lura?',
      descriptionText:
          'Prenumera på nyhetsbrevet där du får höra mer om greenwashing-fails, manipulativ marknadsföring och inte-så-hållbara hållbarhetsinitiativ',
      buttonText: 'PRENUMERERA',
      shopSectionHeader: 'Baksidor',
      shopLinks: ['Arbetsförhållanden', 'Miljöpåverkan', 'Etik'],
      aboutSectionHeader: 'Om oss',
      aboutLinks: ['Vår historia', 'Vårt uppdrag', 'Våra värderingar'],
      legalSectionHeader: 'Legal',
      legalLinks: ['Cookies', 'Integritetspolicy', 'Kontakta oss'],
    )
  ];
}
