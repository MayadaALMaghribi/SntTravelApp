
import 'package:sntegpito/Features/Home/data/model/activity.dart';

class Destination {
  String imageUrl;
  String city;

  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.description,
    required this.activities,
  });
}

List<Activity> activities1 = [
  Activity(
    imageUrl: 'assets/destionation/italian.jpg',
    name: 'italian cemetery el alamein',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 60,
  ),
  Activity(
    imageUrl: 'assets/destionation/Surfing.jpeg',
    name: 'Amazing surfing',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 am', '4:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/destionation/Paragon Beach.png',
    name: 'Paragon Beach',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];
List<Activity> activities2 = [
  Activity(
    imageUrl: 'assets/destionation/italian.jpg',
    name: 'italian cemetery el alamein',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 60,
  ),
  Activity(
    imageUrl: 'assets/destionation/Surfing.jpeg',
    name: 'Amazing surfing',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 am', '4:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/destionation/Paragon Beach.png',
    name: 'Paragon Beach',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];
List<Activity> activities3 = [
  Activity(
    imageUrl: 'assets/destionation/italian.jpg',
    name: 'italian cemetery el alamein',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 60,
  ),
  Activity(
    imageUrl: 'assets/destionation/Surfing.jpeg',
    name: 'Amazing surfing',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 am', '4:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/destionation/Paragon Beach.png',
    name: 'Paragon Beach',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/hotels/hotel2.jpg',
    city: 'El Alamine',
    description:
        'Visit El alamine for an amazing , adventure and best beaches.',
    activities: activities1,
  ),
  Destination(
    imageUrl: 'assets/images_home/beach.jpeg',
    city: 'Sharm el sheik',
    description:
        'Visit sharm El sheik for an amazing and unforgettable adventure.',
    activities: activities2,
  ),
  Destination(
    imageUrl: 'assets/destionation/lafemma.jpg',
    city: 'Hurghada',
    description: 'Visit Hurghada for an amazing and unforgettable adventure.',
    activities: activities3,
  ),
];
