import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/destionation_cursor.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/hotel_cursor.dart';

class EntertainmentTourism extends StatefulWidget {
  const EntertainmentTourism({super.key});

  @override
  _EntertainmentTourismState createState() => _EntertainmentTourismState();
}

class _EntertainmentTourismState extends State<EntertainmentTourism> {
  int _selectedIndex = 0;
  //final int _currentTab = 0;

  final List<IconData> _icons = const [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.hotel,
    FontAwesomeIcons.home,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          if (_selectedIndex == 2) {
            Navigator.pop(context);
          }
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 156, 210, 244)
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : const Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20.0),
            const DestinationCarousel(),
            const SizedBox(height: 20.0),
            const HotelCarousel(),
          ],
        ),
      ),
    );
  }
}
