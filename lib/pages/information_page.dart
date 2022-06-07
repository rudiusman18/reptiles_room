import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:reptiles_room/models/user_model.dart';
import 'package:reptiles_room/pages/homepage/main_page.dart';
import 'package:reptiles_room/theme.dart';

// ignore: must_be_immutable
class InformationPage extends StatefulWidget {
  UserModel? userData;
  InformationPage({this.userData});
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  PageController _pageController = PageController();
  double? currentPage = 0;

  @override
  void initState() {
    // NOTE: untuk mendapatkan nilai terbaru dari PageController
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: template indicator
    Widget dotIndicator(bool isActive) {
      print(widget.userData!.fullName);
      return Container(
        height: 10,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: isActive ? 10 : 8.0,
          width: isActive ? 12 : 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? primaryColor : unselectedColor,
          ),
        ),
      );
    }

// NOTE: Template untuk membuat jumlah dot yang akan ditampilkan
    List<Widget> _buildPageIndicator() {
      List<Widget> list = [];
      for (int i = 0; i < 3; i++) {
        list.add(i == currentPage ? dotIndicator(true) : dotIndicator(false));
      }
      return list;
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/information-1.png',
                    width: 332,
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Container(
                    width: 279,
                    child: Text(
                      'We don’t sell appendix reptiles',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/information-2.png',
                    width: 332,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    width: 279,
                    child: Text(
                      'Our services is from 09:00 until 21:00 everyday',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 279,
                    child: Text(
                      'Happy Shopping',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Image.asset(
                    'assets/information-3.png',
                    width: 332,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 55,
                    width: 287,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: primaryColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: MainPage(
                                user: widget.userData,
                              ),
                              type: PageTransitionType.rightToLeft,
                            ));
                      },
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
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 56),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
