import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wersomd_app/views/tours/tour_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/people_also_like.model.dart';
import '../../models/tab_bar.model.dart';
import '../../widgets/reusable_text.dart';
import '../../models/favorites_model.dart'; // Импортируйте модель избранного

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.tabData,
    required this.personData,
    required this.isCameFromPersonSection,
  });

  final TabBarModel? tabData;
  final PeopleAlsoLikeModel? personData;
  final bool isCameFromPersonSection;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  dynamic current;

  @override
  void initState() {
    super.initState();
    onFirstLoaded();
  }

  void onFirstLoaded() {
    if (widget.tabData != null) {
      current = widget.tabData!;
    } else if (widget.personData != null) {
      current = widget.personData!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    final favoritesModel = Provider.of<FavoritesModel>(context);
    bool isFavorite = favoritesModel.isFavorite(current);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Hero(
                tag: widget.isCameFromPersonSection
                    ? current.year
                    : current.image,
                child: Container(
                  width: size.width,
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(current?.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: size.width,
                height: size.height * 0.6,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: current.title,
                                  size: 28,
                                  color: theme.textTheme.titleMedium!.color,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: theme.iconTheme.color,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    AppText(
                                      text: current.location,
                                      size: 12,
                                      color: theme.textTheme.titleSmall!.color,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AppText(
                              text: "${current.year}",
                              size: 20,
                              color: theme.textTheme.titleMedium!.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 5 ? Icons.star : Icons.star_border,
                                color: index < 5 ? Colors.amber : Colors.grey,
                              );
                            }),
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          AppText(
                            text: "(5.0)",
                            size: 15,
                            color: theme.textTheme.titleMedium!.color,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.05),
                      AppText(
                        text: "Описание",
                        size: 22,
                        color: theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: size.height * 0.01),
                      AppText(
                        text: current.description,
                        size: 14,
                        color: theme.textTheme.titleMedium!.color,
                        fontWeight: FontWeight.w500,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: size.width * 0.14,
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      isFavorite ? Colors.red : Colors.indigo,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isFavorite) {
                                      favoritesModel.remove(current);
                                    } else {
                                      favoritesModel.add(current);
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.deepPurpleAccent,
                                  size: 30,
                                ),
                              ),
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              minWidth: size.width * 0.6,
                              height: size.height * 0.06,
                              color: Colors.deepPurpleAccent,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TourPage(
                                      url: current.url,
                                    ),
                                  ),
                                );
                              },
                              child: const AppText(
                                text: "Путешествовать",
                                size: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 65,
                            height: 65,
                            child: FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 167, 135, 255),
                              onPressed: () => {
                                launchUrl(
                                  Uri.parse(current.ticketUrl),
                                ),
                              },
                              child: const Icon(
                                Icons.add_shopping_cart_outlined,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
    );
  }
}
