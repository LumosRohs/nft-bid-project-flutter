import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_bid_dicoding/model/nft.dart';

class DetailScreen extends StatelessWidget {
  final Nft nft;
  const DetailScreen({Key? key, required this.nft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D17),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(nft.imageAsset),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              children: [
                                Container(
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_ios_new),
                                    color: Colors.white,
                                    iconSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Image.asset('assets/images/logo.png'),
                              ],
                            ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 380,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(nft.imageAsset),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 20, left: 20, right: 20),
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
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                nft.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              Text(
                                                nft.rarity,
                                                style: const TextStyle(
                                                    color: Color(0xFF2284DE),
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Creator',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text('Contact Address',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset('assets/images/creator.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  nft.creator,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 95),
                              child: Text(
                                nft.address,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFF2284DE),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.white.withOpacity(0.05),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Description',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          nft.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 90,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF171720),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Highest Bid',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      nft.bid,
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Place a Bid',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF2284DE),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
