class TabBarModel {
  final String title;
  final String location;
  final String image;
  final int year;
  final String description;
  final String url;

  TabBarModel({
    required this.title,
    required this.location,
    required this.image,
    required this.year,
    required this.description,
    required this.url,
  });
}

List<TabBarModel> places = [
  TabBarModel(
    title: "Эйфелевая башня",
    location: "Париж",
    image: "assets/images/paris.webp",
    year: 1889,
    description:
        "Чем бы был Париж без его известного символа Эйфелевой башни? Построенная Густавом Эйфелом в честь юбилея со дня Французской Революции, она была представлена на Всемирной Выставке 1889 года. В вышину Эйфелева башня достигает 324 метра, и является одним из самых посещаемых памятников в мире с 7 миллионами визитеров в год.",
    url:
        'https://www.360cities.net/image/aerial-view-of-the-eiffel-tower-in-paris-with-a-nice-cloudy-sky',
  ),
  TabBarModel(
    title: "Колизей в Риме",
    location: "Италия",
    image: "assets/images/coliseum.webp",
    year: 1345,
    description:
        "Амфитеатр, памятник архитектуры Древнего Рима, наиболее известное и одно из самых грандиозных сооружений Древнего мира, сохранившихся до нашего времени.",
    url: '',
  ),
  TabBarModel(
    title: "Амстердам",
    location: "Голландия",
    image: "assets/images/amsterdam.webp",
    year: 1682,
    description:
        "Столица и крупнейший город Нидерландов. Является столицей королевства с 1814 года. Расположен в провинции Северная Голландия на западе страны в устье реки Амстел, у бухты Эй. Амстердам соединён Нордзе-каналом с Северным морем. ",
    url: '',
  )
];
List<TabBarModel> inspiration = [
  TabBarModel(
    title: "Лондон",
    location: "Великобритания",
    image: "assets/images/london.jpg",
    year: 543,
    description:
        "Столица Великобритании и крупнейший город страны, третий по величине город Европы, расположен на реке Темза. Политический, экономический и культурный центр Великобритании. Являет одним из старейших городов Европы, основан в 47 году",
    url: '',
  ),
  TabBarModel(
    title: "Монмартр",
    location: "Париж",
    image: "assets/images/monmartr.webp",
    year: 1919,
    description:
        "Монмартр представляет собой холм 130 метров вышиной, который находится на севере Парижа. Этот район известен базиликой Сакре-Кер. Она была построена в 1919 году и посвящены солдатам, павшим в франко-прусской войне 1870 года.",
    url: '',
  ),
  TabBarModel(
    title: "Версаль",
    location: "Париж",
    image: "assets/images/versal.webp",
    year: 1600,
    description:
        "Версаль является одной из самых известных королевских резиденций во Франции. Построенная в 17м веке как символ военного величия и как демонстрация господства Франции в Европе, она представляет собой комплекс зданий, садов и террас, и является одним из самых привлекательных мест для туристов.",
    url: '',
  )
];
