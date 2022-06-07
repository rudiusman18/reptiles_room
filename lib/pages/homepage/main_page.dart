import 'package:flutter/material.dart';
import 'package:reptiles_room/models/user_model.dart';
import 'package:reptiles_room/pages/homepage/cart_page.dart';
import 'package:reptiles_room/pages/homepage/chat_page.dart';
import 'package:reptiles_room/pages/homepage/home_page.dart';
import 'package:reptiles_room/pages/homepage/profile_page.dart';
import 'package:reptiles_room/pages/homepage/wishlist_page.dart';
import 'package:reptiles_room/theme.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  UserModel? user;
  MainPage({this.user});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget customBottomNavbar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: backgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: titleColor,
          elevation: 1,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: 40,
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
                size: 40,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 40,
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 40,
              ),
              label: 'Profile',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage(
            user: widget.user,
          );
        case 1:
          return ChatPage();
        case 2:
          return CartPage();
        case 3:
          return WishlistPage();
        case 4:
          return ProfilePage();

        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: customBottomNavbar(),
      body: body(),
    );
  }
}
