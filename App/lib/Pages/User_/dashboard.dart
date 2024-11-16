import 'package:flutter/material.dart';
import 'package:project_ticket/Pages/User_/cards/eventDetailPage.dart';
import 'package:project_ticket/Pages/User_/cards/eventcard.dart';

import 'cards/eventCatalogCard.dart';
import 'cards/trendingEventCard.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final Widget _spacer = const SizedBox(
    width: 10,
  );

  final Widget _hspacer = const SizedBox(
    height: 15,
  );

  Text _textHeading(data) {
    return Text(
      data,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: () {}, child: const Text("Trending Event")),
                    _spacer,
                    OutlinedButton(
                        onPressed: () {}, child: const Text("Upcoming Event")),
                    _spacer,
                    OutlinedButton(
                        onPressed: () {}, child: const Text("Past Event")),
                    _spacer,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: _textHeading("Trending Event")),
            ),
            SizedBox(
              height: 300,
              child: CarouselView(
                  itemExtent: 300,
                  shrinkExtent: 150,
                  padding: const EdgeInsets.all(10),
                  itemSnapping: true,
                  onTap: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const eventDetailPage()));
                  },
                  children: const [
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                    testcard(),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: _textHeading("Event Catalog")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const eventCatalog(),
                    _spacer,
                    const eventCatalog(),
                    _spacer,
                    const eventCatalog(),
                    _spacer,
                    const eventCatalog(),
                    _spacer,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: _textHeading("Explore")),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Column(
                children: [
                  const eventcard(),
                  _hspacer,
                  const eventcard(),
                  _hspacer,
                  const eventcard()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
