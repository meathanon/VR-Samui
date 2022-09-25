class PopularDestinationModel {
  String? name;
  String? city;

  PopularDestinationModel(this.name, this.city);
}

List<PopularDestinationModel> popular = popularData
    .map((item) =>
        PopularDestinationModel(item['name'], item['city']))
    .toList();

List<PopularDestinationModel> populars = popularsInfo
    .map((item) =>
        PopularDestinationModel(item['name'], item['city']))
    .toList();

List<PopularDestinationModel> bottompopular = otherpopulars
    .map((item) =>
        PopularDestinationModel(item['name'], item['']))
    .toList();

var popularData = [
  {"name": "Wat Prayai", "city": "Koh Samui"},
  {"name": "Wat Plai Laem", "city": "Koh Samui"},
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
