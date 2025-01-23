import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'colors.dart';

List<Widget> buildRealityWidgets(
    ScrollController controller, BuildContext context, bool isMobile) {
  return [
    buildHeader(
        logo: buildAssetString('eye closed.png'),
        searchString: 'Hitta sanningen'),
    buildRollingBanner([
      'BUY MORE',
      'CARE LESS',
    ], controller),
    buildPictureWholeScreeenWidget(
        context,
        buildAssetString('sweatshop lives.png'),
        isMobile ? 'SWEATSHOP\nLIVES' : 'SWEATSHOP LIVES',
        'Långa arbetsdagar, låg lön, och utan skyddsnät - upplev modeindustrins baksida',
        'TESTA NU',
        true),
    buildsmallContainerBanner('Köp nu - Betala med pengar du inte har'),
    buildPictureRow(context, [
      PictureData(picture: 'DQrG3n9w.png', button: 'HUR MODE BLIR AVFALL'),
      PictureData(picture: 'QyGzjzSg.png', button: 'INFLUENCER-KULTUR'),
      PictureData(picture: 'OebGbBgg.png', button: 'DINA VAL AV MATERIAL'),
    ]),
    buildCategorySection(
        'SUPER FAIL',
        'Vad är egentligen rea? Och vem betalar priset för låga priser?',
        'VAD ÄR REA',
        'superfail.png'),
    const SizedBox(height: spaceBetweenRows),
    buildPictureWholeScreeenWidget(
        context,
        buildAssetString('72AAJAWA.png'),
        'GREENWASHING',
        '"Återvunna fibrer", "mer hållbart", "recycled" - visst låter det bra? Kanske för bra för att vara sant?',
        'SPELA "GREENSWASHER"',
        false),
    const SizedBox(height: spaceBetweenRows),
    buildSubscriptionSection(
      headerText: 'Vad är grejen med nyhetsbrev?',
      descriptionText:
          'Varför får man dem så ofta? Och kan någon se om du har öppnat ett?',
      buttonText: 'JAG VILL VETA',
      shopSectionHeader: 'Lärare',
      shopLinks: ['Begrepp', 'Video & Artiklar', 'Läromaterial'],
      aboutSectionHeader: 'Elever',
      aboutLinks: [
        'Vanliga frågor om konsumtion',
        'Hur påverkar modeindustrin?',
        'Vad kan jag göra själv?'
      ],
      legalSectionHeader: 'Legal',
      legalLinks: ['Cookies', 'Integritetspolicy', 'Kontakta oss'],
    )
  ];
}
