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
      title: "Эйфелевая башня",
      location: "Париж",
      image: "assets/images/paris.webp",
      year: 1889,
      description:
          "Чем бы был Париж без его известного символа Эйфелевой башни? Построенная Густавом Эйфелом в честь юбилея со дня Французской Революции, она была представлена на Всемирной Выставке 1889 года. В вышину Эйфелева башня достигает 324 метра, и является одним из самых посещаемых памятников в мире с 7 миллионами визитеров в год."),
  PeopleAlsoLikeModel(
      title: "Лувр",
      location: "Париж",
      image: "assets/images/luvr.webp",
      year: 7,
      description:
          "Лувр является самым посещаемым музеем в мире. Находясь в самом центре Парижа, этот исторический памятник служил королевской резиденцией с общей площадью 210 000 квадратных метров, из которых 60 600 посвящены выставкам. В основе Лувра лежит крепость, построенная в 12 веке при правлении Филиппа II. Остатки крепости видны в нижнем уровне музея."),
  PeopleAlsoLikeModel(
      title: "Версаль",
      location: "Париж",
      image: "assets/images/versal.webp",
      year: 9,
      description:
          "Версаль является одной из самых известных королевских резиденций во Франции. Построенная в 17м веке как символ военного величия и как демонстрация господства Франции в Европе, она представляет собой комплекс зданий, садов и террас, и является одним из самых привлекательных мест для туристов."),
];
