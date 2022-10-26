import 'package:flutter/material.dart';
import 'package:travel/common/styles.dart';
import 'package:travel/pages/home_page_detail.dart';

class ChooseCategoryWidget extends StatefulWidget {
  const ChooseCategoryWidget({ Key? key,required this.image,required this.des,required this.favorite,required this.icon,required this.rating,required this.title }) : super(key: key);
final List<String> image;
final List<String> title;
final List<IconData> icon;
final List<String> des;
final List<double> rating;
final List<bool>favorite;

  @override
  _ChooseCategoryWidgetState createState() => _ChooseCategoryWidgetState();
}

class _ChooseCategoryWidgetState extends State<ChooseCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 300,
                margin: EdgeInsets.only(
                  top: 18,
                ),
                child: ListView.separated(
                    separatorBuilder: (c, index) {
                      return SizedBox(
                        width: 18,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.image.length,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(18),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          var route = MaterialPageRoute(
                              builder: (context) => HomePageDtail(
                                    image: widget.image[index],
                                    name: widget.title[index],
                                    place: widget.des[index],
                                    favorite: widget.favorite[index],
                                    rating: widget.rating[index],
                                    text: '',
                                  ));
                          Navigator.push(context, route);
                        },
                        child: Container(
                          width: 180,
                          // margin: EdgeInsets.only(left: 20,right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  widget.image[index],
                                  width: 160,
                                  height: 300,
                                ).image,
                              )),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget.favorite[index] = !widget.favorite[index];
                                        });
                                      },
                                      icon: Icon(
                                        widget.favorite[index] == false
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color: widget.favorite[index] == false
                                            ? Colors.black38
                                            : Colors.red,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.title[index],
                                        style: CommonStyles(context: context)
                                            .getImageText(
                                                18.0, FontWeight.bold)),
                                    AnimatedContainer(
                                      duration: Duration(milliseconds: 100),
                                      margin: EdgeInsets.only(right: 15),
                                      // color: Colors.black,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(widget.des[index],
                                              style: CommonStyles(
                                                      context: context)
                                                  .getImageText(
                                                      14.0, FontWeight.normal)),
                                        ],
                                      ),
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
                                        Text(" ${widget.rating[index].toString()}",
                                            style: CommonStyles(
                                                    context: context)
                                                .getImageText(
                                                    14.0, FontWeight.normal))
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
  }
}