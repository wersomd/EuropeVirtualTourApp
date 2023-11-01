import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wersomd_app/views/tours/tour_page.dart';

import '../../models/people_also_like.model.dart';
import '../../models/tab_bar.model.dart';
import '../../widgets/reusable_text.dart';

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
  bool isLike = false;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 20.0);
  dynamic current;

  onFirstLoaded() {
    if (widget.tabData == null) {
      return current = widget.personData;
    } else {
      return current = widget.tabData;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    onFirstLoaded();
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
                padding: padding,
                width: size.width,
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 200),
                        child: Padding(
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
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Colors.black54,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.01,
                                      ),
                                      AppText(
                                        text: current.location,
                                        size: 12,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              AppText(
                                text: "${current.year}",
                                size: 25,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: Row(
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
                            const AppText(
                              text: "(5.0)",
                              size: 15,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                      FadeInUp(
                        delay: const Duration(milliseconds: 800),
                        child: const AppText(
                          text: "Описание",
                          size: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      FadeInUp(
                          delay: const Duration(milliseconds: 900),
                          child: AppText(
                            text: current.description,
                            size: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          )),
                      FadeInUp(
                        delay: const Duration(milliseconds: 1000),
                        child: Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: size.width * 0.14,
                                height: size.height * 0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isLike ? Colors.red : Colors.indigo,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() => isLike = !isLike);
                                  },
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: isLike
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
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
