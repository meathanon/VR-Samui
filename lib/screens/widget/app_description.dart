class DescriptionWelcomePage {
  String? description;

  DescriptionWelcomePage(this.description);
}

List<DescriptionWelcomePage> descriptionpage = description
    .map((item) =>
        DescriptionWelcomePage(item['description']))
    .toList();
  
var description = [
  {"description": "Home Page"},
  {"description": "Transports Page"},
  {"description": "Guide Location Page"},
  {"description": "Feedback Page"},
];