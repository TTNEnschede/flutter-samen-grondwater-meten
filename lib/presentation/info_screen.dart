import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoState();
  }
}

class _InfoState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.all(16.0),
        child:
        RichText(
          text: TextSpan(
            text: '',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: 'Samen meten aan grondwater', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '\n\n'),
              TextSpan(text: 'In Enschede is weinig oppervlaktewater, en wat er is, wordt vooral ervaren als overlast – namelijk overvloedige neerslag die slecht afwatert. De stad worstelt met een grondwaterprobleem, wat in de lokale media ruime aandacht heeft gekregen. Natte kelders veroorzaken gezondheidsproblemen, materiele schade en oplopende spanning tussen getroffen huiseigenaren en de gemeente.'),
              TextSpan(text: '\n\n'),
              TextSpan(text: 'De overlast doet zich op verschillende plekken door de gehele stad voor en dat maakt het voor de autoriteiten lastig om passende maatregelen door te voeren. De stad heeft een complexe samengestelde bodem en mede daardoor is onbekend hoe het grondwater zich lokaal gedraagt. “er is meer onderzoek nodig” is dan ook een veelgehoorde reactie vanuit de gemeente, terwijl gedupeerde burgers om ingrijpen vragen.'),
              TextSpan(text: '\n\n'),
              TextSpan(text: 'Het consortium achter deze pilot beoogt een beweging op gang te brengen waarin de huidige patstelling doorbroken wordt tussen burgers en overheden. Door samen de problematiek in kaart te brengen en gezamenlijk de (gemeten) uitkomsten te bediscussiëren zal een nieuw perspectief en uiteindelijk een nieuwe werkelijkheid gecreëerd worden die maakt dat zowel het probleem als ook de mogelijke oplossingsrichtingen in een sfeer van vertrouwen en openheid besproken kunnen worden.'),
            ],
          ),
        )
      );
  }
}