import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class cartTiles extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String total;
  final int count;
  const cartTiles({
    Key? key,
    required this.image,
    required this.title,
    required this.price, required this.count, required this.total,
  }) : super(key: key);
  @override
  _cartTilesState createState() => _cartTilesState();
}
class _cartTilesState extends State<cartTiles> {
  int counter = 0;
  bool isFavorite = false;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }
  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      counter = widget.count;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: HexColor("#848484"),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    widget.image,
                    width: 120.0,
                    height: 99.0,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.title} - 100g',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'RS ${widget.price} - per 100g',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: HexColor("#848484"),
                        ),
                      ),
                      Text(
                        'Rs ${widget.total} -',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, top: 25.0),
                  child: Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                        color: HexColor("#848484"),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Add your logic for the plus button here
                          },
                          child: Icon(
                            Icons.add,
                            size: 20.0,
                          ),
                        ),
                        Text(
                          '$counter',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Add your logic for the minus button here
                          },
                          child: Icon(
                            Icons.remove,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 1.0,
            right: 0.75,
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // Add your logic for the close button here
              },
            ),
          ),
        ],
      ),
    );

  }
}

