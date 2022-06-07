import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reptiles_room/pages/homepage/detail_reptile_page.dart';
import 'package:reptiles_room/theme.dart';

// ignore: must_be_immutable
class ReptileCard extends StatelessWidget {
  String? name;
  String? latinName;
  String? price;
  String? urlImg;
  String? category;

  ReptileCard({
    this.name,
    this.latinName,
    this.price,
    this.urlImg,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailReptilePage(
              name: name,
              category: category,
              latinName: latinName,
              price: price,
              urlImg: urlImg,
            ),
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        color: whiteColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/$urlImg'),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: titleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(
                    '$latinName',
                    style: titleTextStyle.copyWith(
                      fontWeight: medium,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '$price',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
