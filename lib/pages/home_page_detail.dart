import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/common/styles.dart';

class HomePageDtail extends StatefulWidget {
  const HomePageDtail(
      {Key? key,
      required this.image,
      required this.name,
      required this.place,required this.rating,required this.text,
      required this.favorite})
      : super(key: key);
  final String image;
  final String name;
  final String place;
  final bool favorite;
  final double rating;
  final String text;

  @override
  State<HomePageDtail> createState() => _HomePageDtailState();
}

class _HomePageDtailState extends State<HomePageDtail>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late ScrollController scrollController;
  late String name, place;
  bool scrollUp = false;
  bool favorite = false;
  @override
  void initState() {
    name = widget.name;
    place = widget.place;
    favorite = widget.favorite;
    scrollController = ScrollController();
    scrollUp = true;
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (scrollUp == true) {
          /* only set when the previous state is false
             * Less widget rebuilds 
             */
          print("**** $scrollUp up"); //Move IO away from setState
          setState(() {
            scrollUp = false;
          });
        }
      } else {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (scrollUp == false) {
            /* only set when the previous state is false
               * Less widget rebuilds 
               */
            print("**** $scrollUp down"); //Move IO away from setState
            setState(() {
              scrollUp = true;
            });
          }
        }
      }
    });
    animation =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return
    // Scaffold(
    //   appBar: AppBar(
    //   backgroundColor: Colors.white,
    //     elevation: 0,
    //     actions: [
    //       IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.black,))
    //     ],),
    //     body: Container(
    //       decoration: BoxDecoration(image: DecorationImage(
    //         fit: BoxFit.cover,
    //         image: Image.asset(widget.image).image),
    //     ),) );
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: scrollUp == true ? Colors.transparent : Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                    icon: favorite == false
                        ? const Icon(
                            Icons.favorite_border,
                            color: Colors.black38,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                    // : const Icon(Icons.favorite_border)),
                    ))
          ],
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: scrollUp == true
              ? AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: MediaQuery.of(context).size.height*0.9,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: Image.asset(widget.image).image)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$name',
                            style: CommonStyles(context: context)
                                .getImageText(24, FontWeight.bold),
                          ),
                          Text(
                            '$place',
                            style: CommonStyles(context: context)
                                .getImageText(14, FontWeight.normal),
                          ),
                        ],
                      ),
                       Text(
                        "One Of The Most Happening beach is Goa.\t" +
                            "Baga beach is where we will find you water sports,fine dining,\t" +
                            "restaruants,bars and clubs suitated in North Goa.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                           style: CommonStyles(context: context)
                                .getImageText(14, FontWeight.normal),
                          
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Icon(Icons.star, color: Colors.yellow, size: 18),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text("${widget.rating.toString()}",
                              style: CommonStyles(context: context)
                                  .getImageText(14.0, FontWeight.normal))
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\u{20B9}' + '15,000/person',
                                style: CommonStyles(context: context)
                                    .getImageText(14.0, FontWeight.normal)),
                            // ignore: deprecated_member_use
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                color: Colors.yellow,
                                onPressed: () {},
                                child: Text(
                                  'Book Now',
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : SafeArea(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (scrollUp == false) scrollUp = true;
                            });
                          },
                          child: Container(
                            height: 170,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 20, right: 20),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: Image.asset(widget.image).image,
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '$name',
                                      style: CommonStyles(context: context)
                                          .getImageText(24, FontWeight.bold),
                                    ),
                                    Text(
                                      '$place',
                                      style: CommonStyles(context: context)
                                          .getImageText(14, FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 18),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 18),
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 18),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text("4.2",
                                        style: CommonStyles(context: context)
                                            .getImageText(
                                                14.0, FontWeight.normal))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\u{20B9}'+'15,000/person',
                                        style: CommonStyles(context: context)
                                            .getImageText(
                                                14.0, FontWeight.normal)),
                                    // ignore: deprecated_member_use
                                    FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        color: Colors.yellow,
                                        onPressed: () {},
                                        child: Text(
                                          'Book Now',
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "That`s Included",
                                style: CommonStyles(context: context)
                                    .getBodyText(),
                              ),
                            )),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 20),
                            children: [
                              tabButton("assets/food.jpg", "Food"),
                              SizedBox(
                                width: 10,
                              ),
                              tabButton("assets/hotel.jpg", "Hotel"),
                              SizedBox(
                                width: 10,
                              ),
                              tabButton("assets/car.jpg", "Car")
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "About Trip",
                                style: CommonStyles(context: context)
                                    .getBodyText(),
                              ),
                            )),
                        SizedBox(
                            height: 120,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: Text(
                                "One Of The Most Happening beach is Goa, Baga beach is where we will find you water sports,fine dining,restaruants,bars and clubs suitated in North Goa.Baga Beach is bordered by Calangunte and arjuna beaches.",
                                style: CommonStyles(context: context)
                                    .getBlackNormalText(),
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                            )),
                        SizedBox(
                            height: 50,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                "Gallery",
                                style: CommonStyles(context: context)
                                    .getBodyText(),
                              ),
                            )),
                        SizedBox(
                          height: 140,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 20),
                            children: [
                              gallery(
                                "assets/maladives.jpg",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              gallery(
                                "assets/maladives1.jpg",
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              gallery(
                                "assets/maladives.jpg",
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),

          // CustomScrollView(slivers: [
          //     SliverAppBar(
          //       //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          //       expandedHeight: MediaQuery.of(context).size.height,
          //       iconTheme: IconThemeData(color: Colors.black),
          //       backgroundColor: Colors.transparent,
          //       actions: [
          //         Padding(
          //             padding: const EdgeInsets.only(right: 5),
          //             child: IconButton(
          //                 onPressed: () {},
          //                 icon: const Icon(
          //                   Icons.favorite_border,
          //                   color: Colors.black38,
          //                 )
          //                 // : const Icon(Icons.favorite_border)),
          //                 ))
          //       ],
          //       // flexibleSpace: FlexibleSpaceBar(
          //       //   background: Image.asset(
          //       //     widget.image,
          //       //     fit: BoxFit.cover,
          //       //     errorBuilder: (context, error, stackTrace) {
          //       //       return Container(
          //       //         color: Colors.grey,
          //       //         child: const Center(child: Text('No Image')),
          //       //       );
          //       //     },
          //       //   ),
          //       // ),
          //     ),
          //     SliverList(
          //         delegate: SliverChildBuilderDelegate((ctx, _) {
          //       return SingleChildScrollView(
          //         child: Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Container(
          //                 height: 170,
          //                 alignment: Alignment.center,
          //                 margin: EdgeInsets.only(
          //                     top: 20, bottom: 10, left: 20, right: 20),
          //                 padding: EdgeInsets.only(left: 20, right: 20),
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(16),
          //                     image: DecorationImage(
          //                         image: Image.asset(widget.image).image,
          //                         fit: BoxFit.cover)),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.end,
          //                   children: [
          //                     Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text(
          //                           '$name',
          //                           style: CommonStyles(context: context)
          //                               .getImageText(
          //                                   24, FontWeight.bold),
          //                         ),
          //                         Text(
          //                           '$place',
          //                           style: CommonStyles(context: context)
          //                               .getImageText(
          //                                   14, FontWeight.normal),
          //                         ),
          //                       ],
          //                     ),
          //                     Row(
          //                       children: [
          //                         Icon(
          //                           Icons.star,
          //                           color: Colors.yellow,
          //                           size: 18,
          //                         ),
          //                         Icon(Icons.star,
          //                             color: Colors.yellow, size: 18),
          //                         Icon(Icons.star,
          //                             color: Colors.yellow, size: 18),
          //                         Icon(Icons.star,
          //                             color: Colors.yellow, size: 18),
          //                         Icon(
          //                           Icons.star,
          //                           color: Colors.white,
          //                           size: 18,
          //                         ),
          //                         Text("4.2",
          //                             style: CommonStyles(
          //                                     context: context)
          //                                 .getImageText(
          //                                     14.0, FontWeight.normal))
          //                       ],
          //                     ),
          //                     Row(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text('15,000/person',
          //                             style: CommonStyles(
          //                                     context: context)
          //                                 .getImageText(
          //                                     14.0, FontWeight.normal)),
          //                         // ignore: deprecated_member_use
          //                         FlatButton(
          //                             shape: RoundedRectangleBorder(
          //                                 borderRadius:
          //                                     BorderRadius.circular(12)),
          //                             color: Colors.yellow,
          //                             onPressed: () {},
          //                             child: Text(
          //                               'Book Now',
          //                             ))
          //                       ],
          //                     )
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 50,
          //                   child: Padding(
          //                     padding: EdgeInsets.only(left: 20, top: 20),
          //                     child: Text(
          //                       "That`s Included",
          //                       style: CommonStyles(context: context)
          //                           .getBodyText(),
          //                     ),
          //                   )),
          //               SizedBox(
          //                 height: 50,
          //                 child: ListView(
          //                   scrollDirection: Axis.horizontal,
          //                   physics: BouncingScrollPhysics(),
          //                   shrinkWrap: true,
          //                   padding: EdgeInsets.only(left: 20),
          //                   children: [
          //                     tabButton("assets/food.jpg", "Food"),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     tabButton("assets/hotel.jpg", "Hotel"),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     tabButton("assets/car.jpg", "Car")
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                   height: 50,
          //                   child: Padding(
          //                     padding: EdgeInsets.only(left: 20, top: 20),
          //                     child: Text(
          //                       "About Trip",
          //                       style: CommonStyles(context: context)
          //                           .getBodyText(),
          //                     ),
          //                   )),
          //               SizedBox(
          //                   height: 100,
          //                   child: Padding(
          //                     padding: EdgeInsets.only(
          //                         left: 20, right: 20, top: 10),
          //                     child: Text(
          //                       "One Of The Most Happening beach is Goa, Baga beach is where we will find you water sports,fine dining,restaruants,bars and clubs suitated in North Goa.Baga Beach is bordered by Calangunte and arjuna beaches.",
          //                       style: CommonStyles(context: context)
          //                           .getBlackNormalText(),
          //                       softWrap: true,
          //                       textAlign: TextAlign.start,
          //                     ),
          //                   )),
          //               SizedBox(
          //                   height: 50,
          //                   child: Padding(
          //                     padding: EdgeInsets.only(left: 20, top: 20),
          //                     child: Text(
          //                       "Gallery",
          //                       style: CommonStyles(context: context)
          //                           .getBodyText(),
          //                     ),
          //                   )),
          //               SizedBox(
          //                 height: 140,
          //                 child: ListView(
          //                   scrollDirection: Axis.horizontal,
          //                   physics: BouncingScrollPhysics(),
          //                   shrinkWrap: true,
          //                   padding: EdgeInsets.only(left: 20),
          //                   children: [
          //                     gallery(
          //                       "assets/maladives.jpg",
          //                     ),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     gallery(
          //                       "assets/maladives1.jpg",
          //                     ),
          //                     SizedBox(
          //                       width: 10,
          //                     ),
          //                     gallery(
          //                       "assets/maladives.jpg",
          //                     )
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 20,
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }, childCount: 1))
          //   ])
          // backgroundColor: Colors.white,
          // appBar: AppBar(
          //   elevation: 0,
          //   actions: [
          //     IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border,color: Colors.black38,))
          //   ],
          //   backgroundColor: Colors.white,
          //   iconTheme: IconThemeData(color: Colors.black),
          // ),
          // body: SingleChildScrollView(
          //   child: Container(
          //     // padding: EdgeInsets.only(left: 20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Container(
          //           height: 170,
          //           alignment: Alignment.center,
          //           margin:
          //               EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
          //           padding: EdgeInsets.only(left: 20),
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(16),
          //               image: DecorationImage(
          //                   image: Image.asset(widget.image).image,
          //                   fit: BoxFit.cover)),
          //         ),
          //         SizedBox(
          //             height: 50,
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 20, top: 20),
          //               child: Text(
          //                 "That`s Included",
          //                 style: CommonStyles(context: context).getBodyText(),
          //               ),
          //             )),
          //         SizedBox(
          //           height: 50,
          //           child: ListView(
          //             scrollDirection: Axis.horizontal,
          //             physics: BouncingScrollPhysics(),
          //             shrinkWrap: true,
          //             padding: EdgeInsets.only(left: 20),
          //             children: [
          //               tabButton("assets/food.jpg", "Food"),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               tabButton("assets/hotel.jpg", "Hotel"),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               tabButton("assets/car.jpg", "Car")
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //             height: 50,
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 20, top: 20),
          //               child: Text(
          //                 "About Trip",
          //                 style: CommonStyles(context: context).getBodyText(),
          //               ),
          //             )),
          //         SizedBox(
          //             height: 100,
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          //               child: Text(
          //                 "One Of The Most Happening beach is Goa, Baga beach is where we will find you water sports,fine dining,restaruants,bars and clubs suitated in North Goa.Baga Beach is bordered by Calangunte and arjuna beaches.",
          //                 style:
          //                     CommonStyles(context: context).getBlackNormalText(),
          //                 softWrap: true,
          //                 textAlign: TextAlign.start,
          //               ),
          //             )),
          //         SizedBox(
          //             height: 50,
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 20, top: 20),
          //               child: Text(
          //                 "Gallery",
          //                 style: CommonStyles(context: context).getBodyText(),
          //               ),
          //             )),
          //         SizedBox(
          //           height: 140,
          //           child: ListView(
          //             scrollDirection: Axis.horizontal,
          //             physics: BouncingScrollPhysics(),
          //             shrinkWrap: true,
          //             padding: EdgeInsets.only(left: 20),
          //             children: [
          //               gallery(
          //                 "assets/maladives.jpg",
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               gallery(
          //                 "assets/maladives1.jpg",
          //               ),
          //               SizedBox(
          //                 width: 10,
          //               ),
          //               gallery(
          //                 "assets/maladives.jpg",
          //               )
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ));
        ));
  }

  Container tabButton(String image, String text) {
    return Container(
      height: 30,
      width: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Image.asset(image), Text(text)],
      ),
    );
  }

  Widget gallery(String image) {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover, image: Image.asset(image).image)),
    );
  }
}
