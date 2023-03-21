// ignore_for_file: avoid_init_to_null
class PopularDestinationModel {
  String? name;
  String? city;
  // String? url = null;

  PopularDestinationModel(this.name, this.city);
}

List<PopularDestinationModel> popular = popularData
    .map((item) => PopularDestinationModel(item['name'], item['city']))
    .toList();

List<PopularDestinationModel> popularr = popularOne
    .map((item) => PopularDestinationModel(item['name'], item['city']))
    .toList();

List<PopularDestinationModel> populars = popularsInfo
    .map((item) => PopularDestinationModel(item['name'], item['city']))
    .toList();

List<PopularDestinationModel> bottompopular = otherpopulars
    .map((item) => PopularDestinationModel(item['name'], item['']))
    .toList();

// List<PopularDestinationModel> urltravel = urlTravels
//     .map((item) => PopularDestinationModel(item['url'], item[''], item['']))
//     .toList();

var popularData = [
  {"name": "Wat Prayai", "city": "Koh Samui"},
  {"name": "Wat Plai Laem", "city": "Koh Samui"},
];

var popularOne = [
  {"name": "Lamai Beach", "city": "Koh Samui"},
];

var popularsInfo = [
  {"name": "Tranim garden", "city": "Koh Samui"},
  {"name": "Hinta Hinyay", "city": "Koh Samui"},
];

var otherpopulars = [
  {"name": "Na muang Waterfalls"},
  {"name": "Chaweng Beach"},
  {"name": "Bophut Beach"},
  {"name": "Samui Aquarium"},
];

// var urlTravels = [
//   {"url": "https://youtube.com/watch?v=XG4rWqiG0jo"},
//   {"url": "https://youtube.com/watch?v=I6mZSSxyo_o"},
//   {"url": "https://youtube.com/watch?v=QcG4ya-Olic"},
//   {"url": "https://youtube.com/watch?v=VbU3789IjZw"},
//   {"url": "https://youtube.com/watch?v=Jqgx8GsmJC0"},
// ];
