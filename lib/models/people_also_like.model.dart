class PeopleAlsoLikeModel {
  final String title;
  final String location;
  final int year;
  final String image;
  final String description;

  PeopleAlsoLikeModel({
    required this.title,
    required this.location,
    required this.year,
    required this.image,
    required this.description,
  });
}

List<PeopleAlsoLikeModel> peopleAlsoLikeModel = [
  PeopleAlsoLikeModel(
      title: "Лондон",
      location: "Великобритания",
      image: "assets/images/london.jpg",
      year: 1889,
      description:
          "Столица Великобритании и крупнейший город страны, третий по величине город Европы, расположен на реке Темза. Политический, экономический и культурный центр Великобритании. Являет одним из старейших городов Европы, основан в 47 году"),
  PeopleAlsoLikeModel(
      title: "Париж",
      location: "Франция",
      image: "assets/images/paris.webp",
      year: 7,
      description:
          "Чем бы был Париж без его известного символа Эйфелевой башни? Построенная Густавом Эйфелом в честь юбилея со дня Французской Революции, она была представлена на Всемирной Выставке 1889 года. В вышину Эйфелева башня достигает 324 метра, и является одним из самых посещаемых памятников в мире с 7 миллионами визитеров в год."),
  PeopleAlsoLikeModel(
      title: "Единбург",
      location: "Шотландия",
      image: "assets/images/edinburgh.jpg",
      year: 9,
      description:
          "Эдинбург – столица Шотландии и один из красивейших городов Европы. Он расположился вблизи восточного побережья острова Великобритания, обращенного к Северному морю. Город, ставший столицей Шотландского королевства еще в эпоху Средневековья, располагает бесчисленными историческими памятниками, а многие выстроенные здесь здания признаны архитектурными шедеврами."),
];
