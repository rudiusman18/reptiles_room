import 'package:flutter/material.dart';
import 'package:reptiles_room/theme.dart';

// ignore: must_be_immutable
class DetailReptilePage extends StatefulWidget {
  String? name;
  String? latinName;
  String? price;
  String? urlImg;
  String? category;
  DetailReptilePage({
    this.name,
    this.latinName,
    this.price,
    this.urlImg,
    this.category,
  });

  @override
  _DetailReptilePageState createState() => _DetailReptilePageState();
}

class _DetailReptilePageState extends State<DetailReptilePage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/${widget.urlImg}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 13,
                ),
                margin: EdgeInsets.only(top: 250),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.name}',
                      style: titleTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      '${widget.latinName}',
                      style: subtitleTextStyle.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Enclosure',
                      style: contentTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint',
                      style: contentTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Foods',
                      style: contentTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Pellets',
                      style: contentTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Description',
                      style: contentTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Excepteur sint',
                      style: contentTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Photos',
                      style: contentTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i < 10; i++)
                      Container(
                        margin: EdgeInsets.only(
                          top: 8,
                          left: i == 0 ? 13 : 0,
                          right: i == 0 ? 13 : 10,
                        ),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/${widget.urlImg}'),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 15,
                ),
                height: 55,
                width: 287,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: primaryColor,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 13,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                    size: 35,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                      print(isFavorite);
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_outline,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
