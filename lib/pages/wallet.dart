import 'package:flutter/material.dart';
import 'package:nft_bid_dicoding/customicon.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D17),
      appBar: AppBar(
        elevation: 0,
        title: Image.asset('assets/images/logo.png'),
        backgroundColor: const Color(0xFF0D0D17),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/balance-bg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Current Balance',
                        style: TextStyle(color: Colors.white.withOpacity(0.6)),
                      ),
                      const Icon(
                        CustomIcon.ethereum,
                        color: Colors.white,
                        size: 32,
                      )
                    ],
                  ),
                  const Text(
                    '20.4 ETH',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Last Transactions',
                    style: TextStyle(
                        fontSize: 14, color: Colors.white.withOpacity(0.6)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    '30th March 2022, 17:52',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                    child: Text('Deposit'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF6C6C6C).withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                      child: Text('Withdraw'),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF6C6C6C).withOpacity(0.1),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                    child: Text('Transfer'),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFF6C6C6C).withOpacity(0.1),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'History',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: ((context, index) {
                    return Container(
                      height: 80,
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white.withOpacity(0.05),
                                foregroundColor: Colors.white.withOpacity(0.45),
                                child: const Icon(
                                  CustomIcon.ethereum,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'ETH',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Ethereum',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '+0,02324249',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '\$800',
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.6)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.1),
                          )
                        ],
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
