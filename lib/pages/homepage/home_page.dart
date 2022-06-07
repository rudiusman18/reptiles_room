import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reptiles_room/models/user_model.dart';
import 'package:reptiles_room/pages/homepage/reptile_by_category_page.dart';
import 'package:reptiles_room/theme.dart';
import 'package:reptiles_room/widgets/reptile_card.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  UserModel? user;

  HomePage({this.user});

  @override
  Widget build(BuildContext context) {
    List reptileImage = [
      'category_image_1.png',
      'category_image_2.png',
      'category_image_3.png',
      'category_image_4.png',
    ];

    List reptileCategory = [
      'Turtle',
      'Tortoise',
      'Lizard',
      'Snake',
    ];

    Widget categoriesCard({
      required int position,
      required String categoryName,
      required urlImg,
      List<ReptileCard>? listData,
    }) {
      listData = [
        ReptileCard(
          name: 'Aldabra Giant Tortoise',
          latinName: 'Aldabrachelys gigantea',
          price: 'IDR 24.000.000',
          category: 'Tortoise',
          urlImg: 'reptile_1.png',
        ),
        ReptileCard(
          name: 'Green Tree Python',
          latinName: 'Morelia viridis',
          price: 'IDR 1.500.000',
          category: 'Snake',
          urlImg: 'reptile_2.png',
        ),
        ReptileCard(
          name: 'Sulcata Giant Tortoise',
          latinName: 'Centrochelys sulcata',
          price: 'IDR 20.500.000',
          category: 'Tortoise',
          urlImg: 'reptile_3.png',
        ),
        ReptileCard(
          name: 'Alligator Snapping Turtle (AST)',
          latinName: 'Macrochelys temminckii',
          price: 'IDR 5.000.000',
          category: 'Turtle',
          urlImg: 'reptile_4.png',
        ),
        ReptileCard(
          name: 'Rhinoceros Iguana',
          latinName: 'Cyclura cornuta',
          price: 'IDR 30.000.000',
          category: 'Lizard',
          urlImg: 'reptile_5.png',
        ),
        ReptileCard(
          name: 'Bearded Dragon',
          latinName: 'Pogona',
          price: 'IDR 500.000',
          category: 'Lizard',
          urlImg: 'reptile_6.png',
        ),
        ReptileCard(
          name: 'Savannah Monitor',
          latinName: 'Varanus exanthematicus',
          price: 'IDR 1.200.000',
          category: 'Lizard',
          urlImg: 'reptile_7.png',
        ),
        ReptileCard(
          name: 'Pardalis Tortoise',
          latinName: 'Stigmochelys pardalis',
          price: 'IDR 4.800.000',
          category: 'Tortoise',
          urlImg: 'reptile_8.png',
        ),
        ReptileCard(
          name: 'Asian Water Monitor',
          latinName: 'Varanus Salvator',
          price: 'IDR 800.000',
          category: 'Lizard',
          urlImg: 'reptile_9.png',
        ),
        ReptileCard(
          name: 'Common Snapping Turtle (CST)',
          latinName: 'Chelydra serpentina',
          price: 'IDR 950.000',
          category: 'Turtle',
          urlImg: 'reptile_10.png',
        ),
      ];
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                child: ReptileByCategoryPage(
                  categoryName: categoryName,
                  data: listData,
                ),
                type: PageTransitionType.rightToLeft,
              ));
        },
        child: Container(
          height: 120,
          width: 100,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/$urlImg'),
              alignment: Alignment.topCenter,
            ),
          ),
          margin: EdgeInsets.only(
            top: 30,
            left: position == 0 ? 15 : 10,
            right: position == reptileCategory.length - 1 ? 15 : 0,
          ),
          child: Text(
            '$categoryName',
            style: titleTextStyle.copyWith(fontWeight: medium),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome, ${user!.fullName}',
                              style: titleTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              '@${user!.userName}',
                              style: subtitleTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Image.asset(
                        'assets/profile_icon.png',
                        width: 70,
                        height: 70,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'What type of reptiles do you want?',
                    style: contentTextStyle,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var i = 0; i < reptileCategory.length; i++)
                    categoriesCard(
                      position: i,
                      categoryName: '${reptileCategory[i]}',
                      urlImg: '${reptileImage[i]}',
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Reptiles',
                    style: titleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  ReptileCard(
                    name: 'Aldabra Giant Tortoise',
                    latinName: 'Aldabrachelys gigantea',
                    price: 'IDR 24.000.000',
                    category: 'Tortoise',
                    urlImg: 'reptile_1.png',
                  ),
                  ReptileCard(
                    name: 'Green Tree Python',
                    latinName: 'Morelia viridis',
                    price: 'IDR 1.500.000',
                    category: 'Snake',
                    urlImg: 'reptile_2.png',
                  ),
                  ReptileCard(
                    name: 'Sulcata Giant Tortoise',
                    latinName: 'Centrochelys sulcata',
                    price: 'IDR 20.500.000',
                    category: 'Tortoise',
                    urlImg: 'reptile_3.png',
                  ),
                  ReptileCard(
                    name: 'Alligator Snapping Turtle (AST)',
                    latinName: 'Macrochelys temminckii',
                    price: 'IDR 5.000.000',
                    category: 'Turtle',
                    urlImg: 'reptile_4.png',
                  ),
                  ReptileCard(
                    name: 'Rhinoceros Iguana',
                    latinName: 'Cyclura cornuta',
                    price: 'IDR 30.000.000',
                    category: 'Lizard',
                    urlImg: 'reptile_5.png',
                  ),
                  ReptileCard(
                    name: 'Bearded Dragon',
                    latinName: 'Pogona',
                    price: 'IDR 500.000',
                    category: 'Lizard',
                    urlImg: 'reptile_6.png',
                  ),
                  ReptileCard(
                    name: 'Savannah Monitor',
                    latinName: 'Varanus exanthematicus',
                    price: 'IDR 1.200.000',
                    category: 'Lizard',
                    urlImg: 'reptile_7.png',
                  ),
                  ReptileCard(
                    name: 'Pardalis Tortoise',
                    latinName: 'Stigmochelys pardalis',
                    price: 'IDR 4.800.000',
                    category: 'Tortoise',
                    urlImg: 'reptile_8.png',
                  ),
                  ReptileCard(
                    name: 'Asian Water Monitor',
                    latinName: 'Varanus Salvator',
                    price: 'IDR 800.000',
                    category: 'Lizard',
                    urlImg: 'reptile_9.png',
                  ),
                  ReptileCard(
                    name: 'Common Snapping Turtle (CST)',
                    latinName: 'Chelydra serpentina',
                    price: 'IDR 950.000',
                    category: 'Turtle',
                    urlImg: 'reptile_10.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
