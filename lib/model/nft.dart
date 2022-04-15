class Nft {
  String name;
  String time;
  String category;
  String bid;
  String creator;
  String rarity;
  String address;
  String description;
  String imageAsset;

  Nft({
    required this.name,
    required this.time,
    required this.category,
    required this.bid,
    required this.creator,
    required this.rarity,
    required this.address,
    required this.description,
    required this.imageAsset,
  });
}

var nftList = [
  Nft(
      name: 'The Yin and Yang',
      time: '38:12:10',
      category: 'Art',
      bid: '40 ETH',
      creator: 'lingga',
      rarity: 'Rare',
      address: '1BoatSLRHtKNngkdXEeobR76b53LETtpyT',
      description:
          'Year 3005. rogue data excavator pack and its leader. three excavators left dead on the floor after their storage system was devoured by this particular pack. sudo command denied by all the rogue devices.',
      imageAsset: 'assets/images/image2.png'),
  Nft(
      name: 'The Last Superuser',
      time: '48:12:10',
      category: 'Virtual Worlds',
      bid: '50.23 ETH',
      creator: 'vngnc',
      rarity: 'Super Rare',
      address: '1BoatSLRHtKNngkdXEeobR76b53LETtpyT',
      description:
          'Year 3005. rogue data excavator pack and its leader. three excavators left dead on the floor after their storage system was devoured by this particular pack. sudo command denied by all the rogue devices.',
      imageAsset: 'assets/images/image1.png'),
  Nft(
      name: 'The Inferno',
      time: '28:12:10',
      category: 'Music',
      bid: '20 ETH',
      creator: 'farhan',
      rarity: 'Rare',
      address: '1BoatSLRHtKNngkdXEeobR76b53LETtpyT',
      description:
          'Year 3005. rogue data excavator pack and its leader. three excavators left dead on the floor after their storage system was devoured by this particular pack. sudo command denied by all the rogue devices.',
      imageAsset: 'assets/images/image3.png'),
];
