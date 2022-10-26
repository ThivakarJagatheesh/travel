import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/Widgets/choose_category_widget.dart';
import 'package:travel/Widgets/popular_package_widget.dart';
import 'package:travel/common/styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController scrollController;
  var searchController = TextEditingController();
  List<String> image = [
    "assets/maladives.jpg",
    "assets/maladives1.jpg",
    "assets/goa.jpeg"
  ];
  List<String> imageTitle = ["Kuta Beach", "Baga Beach", "Indionesia beach"];
  List<String> imageSubtitle = [
    "Bali, Indonesia",
    "Goa, India",
    "Bali Indonesia"
  ];
  List<bool> favorite = [false, false, false];
  List<double> rating = [4.2, 4.8, 4.6];
  bool? beach = true;
  bool? mountain = false;
  bool scrollUp = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Hello, Thivakar',
                            style: CommonStyles(context: context).nameText(),
                          )
                        ],
                      ),
                      Icon(Icons.beach_access)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Where do you want to explore today?",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: CommonStyles(context: context).getHeaderText(),
                    softWrap: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 18, right: 18, top: 18),
                height: 50,
                padding: EdgeInsets.only(left: 14),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(6)),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Search'),
                ),
              ),
              SizedBox(
                  height: 40,
                  child: mutlipleText("Choose Category", "See all")),
              SizedBox(
                height: 60,
                child: Container(
                  margin: EdgeInsets.only(left: 18, top: 18),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (beach != true) {
                            setState(() {
                              beach = true;
                            });
                          } else {
                            setState(() {
                              mountain = false;
                            });
                          }
                        },
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: beach==true?Colors.green:Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [],
                              border: Border.all(
                                color:
                                    beach == true ? Colors.green : Colors.black,
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.beach_access),
                                Text('Beach'),
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (mountain != true) {
                            setState(() {
                              mountain = true;
                            });
                          } else {
                            setState(() {
                              beach = false;
                            });
                          }
                        },
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color:
                              //     beach == true ? Colors.green : Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: mountain == true
                                    ? Colors.green
                                    : Colors.black,
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.beach_access),
                                Text(' Mountain'),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ChooseCategoryWidget(
                  image: image,
                  des: imageSubtitle,
                  favorite: favorite,
                  icon: [],
                  rating: rating,
                  title: imageTitle),
              SizedBox(
                  height: 40,
                  child: mutlipleText("Popular Package", "See all")),
              PopularPackage(
                image: image,
                des: imageSubtitle,
                title: imageTitle,
                favorite: favorite,
                icon: [],
                rating: rating,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mutlipleText(String name1, String name2) {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name1,
            style: CommonStyles(context: context).getBodyText(),
          ),
          Text(
            name2,
            style: CommonStyles(context: context).getLabelText(),
          )
        ],
      ),
    );
  }
}

 // Container(
              //   height: 200,
              //   margin: EdgeInsets.only(
              //     top: 18,
              //   ),
              //   child: ListView.separated(
              //       separatorBuilder: (c, index) {
              //         return SizedBox(
              //           width: 18,
              //         );
              //       },
              //       scrollDirection: Axis.horizontal,
              //       shrinkWrap: true,
              //       itemCount: image.length,
              //       physics: BouncingScrollPhysics(),
              //       padding: EdgeInsets.all(18),
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //           onTap: () {
              //             var route = MaterialPageRoute(
              //                 builder: (context) => HomePageDtail(
              //                       image: image[index],
              //                       name: imageTitle[index],
              //                       place: imageSubtitle[index],
              //                       favorite: favorite[index],
              //                     ));
              //             Navigator.push(context, route);
              //           },
              //           child: Container(
              //             width: 180,
              //             // margin: EdgeInsets.only(left: 20,right: 10),
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(16),
              //                 image: DecorationImage(
              //                   fit: BoxFit.cover,
              //                   image: Image.asset(
              //                     image[index],
              //                     // width: 160,
              //                     // height: 200,
              //                   ).image,
              //                 )),
              //             child: Stack(
              //               children: [
              //                 Positioned(
              //                   right: 10,
              //                   top: 10,
              //                   child: Container(
              //                     width: 40,
              //                     height: 40,
              //                     alignment: Alignment.center,
              //                     decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         shape: BoxShape.circle),
              //                     child: IconButton(
              //                         onPressed: () {
              //                           setState(() {
              //                             favorite[index] = !favorite[index];
              //                           });
              //                         },
              //                         icon: Icon(
              //                           favorite[index] == false
              //                               ? Icons.favorite_border
              //                               : Icons.favorite,
              //                           color: favorite[index] == false
              //                               ? Colors.black38
              //                               : Colors.red,
              //                         )),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.only(left: 8.0),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.end,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(imageTitle[index],
              //                           style: CommonStyles(context: context)
              //                               .getImageText(
              //                                   18.0, FontWeight.bold)),
              //                       AnimatedContainer(
              //                         duration: Duration(milliseconds: 100),
              //                         margin: EdgeInsets.only(right: 15),
              //                         // color: Colors.black,
              //                         child: Row(
              //                           children: [
              //                             Icon(
              //                               Icons.location_on_outlined,
              //                               color: Colors.white,
              //                             ),
              //                             Text(imageSubtitle[index],
              //                                 style: CommonStyles(
              //                                         context: context)
              //                                     .getImageText(
              //                                         14.0, FontWeight.normal)),
              //                           ],
              //                         ),
              //                       ),

              //                       Row(
              //                         children: [
              //                           Icon(
              //                             Icons.star,
              //                             color: Colors.yellow,
              //                             size: 18,
              //                           ),
              //                           Icon(Icons.star,
              //                               color: Colors.yellow, size: 18),
              //                           Icon(Icons.star,
              //                               color: Colors.yellow, size: 18),
              //                           Icon(Icons.star,
              //                               color: Colors.yellow, size: 18),
              //                           Icon(
              //                             Icons.star,
              //                             color: Colors.white,
              //                             size: 18,
              //                           ),
              //                           Text(" ${rating[index].toString()}",
              //                               style: CommonStyles(
              //                                       context: context)
              //                                   .getImageText(
              //                                       14.0, FontWeight.normal))
              //                         ],
              //                       ),
              //                       SizedBox(
              //                         height: 10,
              //                       )

              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       }),
              // ),
  
  // Container(
              //   margin:
              //       EdgeInsets.only(left: 18, right: 18, top: 9, bottom: 18),
              //   padding: EdgeInsets.all(18),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16),
              //       border: Border.all(color: Colors.black45)),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         height: 150,
              //         width: 100,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(8),
              //             image: DecorationImage(
              //                 fit: BoxFit.cover,
              //                 image: Image.asset(image.last).image)),
              //       ),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       Expanded(
              //           child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Bali Beach',
              //                 style:
              //                     CommonStyles(context: context).getBodyText(),
              //               ),
              //               Icon(Icons.favorite_outline, color: Colors.black38),
              //             ],
              //           ),
              //           // Spacer(),
              //           Text(
              //             '\u{20B9}' + '12000',
              //             style: CommonStyles(context: context).getPriceText(),
              //           ),
              //           // Spacer(),
              //           Row(
              //             children: [
              //               Icon(Icons.star, color: Colors.yellow),
              //               Icon(Icons.star, color: Colors.yellow),
              //               Icon(Icons.star, color: Colors.yellow),
              //               Icon(Icons.star, color: Colors.yellow),
              //               Icon(Icons.star, color: Colors.black),
              //             ],
              //           ),
              //           // Spacer(),
              //           Text(
              //             "One Of The Most Happening beach is Goa, Baga beach is where we will find you water sports,fine dining,restaruants,bars and clubs suitated in North Goa.",
              //           )
              //         ],
              //       ))
              //     ],
              //   ),
              // )