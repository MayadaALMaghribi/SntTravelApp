class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/hotels/hotel4.jpg',
    name: 'Royal Savoy',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/hotels/hotel7.jpg',
    name: 'TOLIP North Coast',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/hotels/hotel9.png',
    name: 'White Beach Resort',
    address: '404 Great St',
    price: 240,
  ),
];
