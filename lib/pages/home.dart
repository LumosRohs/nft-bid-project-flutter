import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_bid_dicoding/customicon.dart';
import 'package:nft_bid_dicoding/model/nft.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nft_bid_dicoding/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 1;
  var image = '';

  ColorFilter blurHandler(index) {
    if (_current == index) {
      return const ColorFilter.mode(Colors.transparent, BlendMode.srcOver);
    } else {
      return ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.srcOver);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D17),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 480,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image == ''
                            ? const AssetImage('assets/images/image1.png')
                            : AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset('assets/images/logo.png'),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                  color: Colors.white10),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/Wallet.png'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          '20.4 ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ETH',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF2284DE),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: CarouselSlider.builder(
                          itemCount: nftList.length,
                          options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              initialPage: 1,
                              autoPlay: false,
                              height: 320,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                  image = nftList[index].imageAsset;
                                });
                              }),
                          itemBuilder: (ctx, index, realIdx) {
                            final Nft nft = nftList[index];
                            return Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 320,
                                  width: 320,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(nft.imageAsset),
                                        fit: BoxFit.fill,
                                        colorFilter: blurHandler(index),
                                      ),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 20.0, sigmaY: 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    nft.name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    nft.time,
                                                    style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.6)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 18,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return DetailScreen(nft: nft);
                                                }));
                                              },
                                              child: const Text('Offers'),
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  const Color(0xFF2284DE),
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                  const EdgeInsets.symmetric(
                                                      vertical: 24,
                                                      horizontal: 14),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                  ),
                                                ),
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF6C6C6C).withOpacity(0.1)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            foregroundColor: Colors.white.withOpacity(0.6),
                            child: const Icon(
                              CustomIcon.brush,
                              size: 16,
                            ),
                          ),
                          const Text(
                            'Art',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFF6C6C6C).withOpacity(0.1)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          foregroundColor: Colors.white.withOpacity(0.6),
                          child: const Icon(
                            CustomIcon.star,
                            size: 16,
                          ),
                        ),
                        const Text(
                          'Collectibles',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFF6C6C6C).withOpacity(0.1)),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          foregroundColor: Colors.white.withOpacity(0.6),
                          child: const Icon(
                            CustomIcon.music,
                            size: 16,
                          ),
                        ),
                        const Text(
                          'Music',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 16, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF6C6C6C).withOpacity(0.1)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            foregroundColor: Colors.white.withOpacity(0.6),
                            child: const Icon(
                              CustomIcon.cube,
                              size: 16,
                            ),
                          ),
                          const Text(
                            'Virtual Worlds',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Top Artist',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/top-artist-box.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.center,
                          children: [
                            Image.asset('assets/images/mutant.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Mutant Ape Yacht Club',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '298.0K ETH',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Visit'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF3890E1),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 14),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                      ],
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
