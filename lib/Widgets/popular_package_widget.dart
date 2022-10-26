import 'package:flutter/material.dart';
import 'package:travel/common/styles.dart';
import 'package:travel/pages/home_page_detail.dart';

class PopularPackage extends StatefulWidget {
  const PopularPackage(
      {Key? key,
      required this.image,
      required this.des,
      required this.favorite,
      required this.icon,
      required this.rating,
      required this.title})
      : super(key: key);
  final List<String> image;
  final List<String> title;
  final List<IconData> icon;
  final List<String> des;
  final List<double> rating;
  final List<bool> favorite;

  @override
  _PopularPackageState createState() => _PopularPackageState();
}

class _PopularPackageState extends State<PopularPackage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 18),
        itemCount: widget.image.length - 1,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePageDtail(
                            text: '',
                            place: widget.des[index],
                            image: widget.image[index],
                            name: widget.title[index],
                            rating: widget.rating[index],
                            favorite: widget.favorite[index],
                          )));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              margin: EdgeInsets.only(left: 18, right: 18, top: 9, bottom: 18),
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black45)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(widget.image[index]).image)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [

                      //     IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline,size: 18,), color: Colors.black38),
                      //   ],
                      // ),
                      //  Spacer(),
                      // FractionallySizedBox(
                      //   alignment: Alignment.topRight,
                      //   widthFactor: 10,
                      //   child: IconButton(
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         Icons.favorite_outline,
                      //         size: 18,
                      //       ),
                      //       color: Colors.black38),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bali Beach',
                            style: CommonStyles(context: context).getBodyText(),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                widget.favorite[index] =
                                    !widget.favorite[index];
                              });
                            },
                            child: Icon(
                              widget.favorite[index] == false
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: widget.favorite[index] == false
                                  ? Colors.black38
                                  : Colors.red,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '\u{20B9}' + '12000',
                        style: CommonStyles(context: context).getPriceText(),
                      ),
                      // Spacer(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.yellow),
                          Icon(Icons.star, color: Colors.black),
                        ],
                      ),
                      // Spacer(),
                      Text(
                        "One Of The Most Happening beach is Goa.\t" +
                            "Baga beach is where we will find you water sports,fine dining,\t" +
                            "restaruants,bars and clubs suitated in North Goa.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        });
  }
}
