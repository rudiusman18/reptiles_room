import 'package:reptiles_room/theme.dart';
import 'package:flutter/material.dart';
import 'package:reptiles_room/widgets/reptile_card.dart';

// ignore: must_be_immutable
class ReptileByCategoryPage extends StatelessWidget {
  String? categoryName;
  List<ReptileCard>? data;

  ReptileByCategoryPage({
    this.categoryName,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          '$categoryName',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteColor,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView(
          children: data!.map((e) {
            return e.category == categoryName
                ? ReptileCard(
                    category: e.category,
                    latinName: e.latinName,
                    name: e.name,
                    price: e.price,
                    urlImg: e.urlImg,
                  )
                : SizedBox();
          }).toList(),
        ),
      ),
    );
  }
}
