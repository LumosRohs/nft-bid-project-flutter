import 'package:flutter/material.dart';
import 'package:nft_bid_dicoding/pages/favorites.dart';
import 'package:nft_bid_dicoding/pages/home.dart';
import 'package:nft_bid_dicoding/pages/profile.dart';
import 'package:nft_bid_dicoding/pages/wallet.dart';
import 'package:nft_bid_dicoding/customicon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Bid App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'NunitoSans',
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  Widget bodyHandler() {
    switch (_selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const WalletPage();
      case 2:
        return const FavoritesPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bodyHandler(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          elevation: 0,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color(0xFF171720),
          selectedItemColor: const Color(0xFF2284DE),
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.heart),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcon.profile),
              label: 'Profile',
            ),
          ],
        ));
  }
}
