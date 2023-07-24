import 'package:shopping_hub/pages/Address.dart';
import 'package:shopping_hub/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../components/carttiles.dart';
import '../model/cart_model.dart';
import 'chat_page.dart';
import 'favorite_page.dart';


class cartPage extends StatefulWidget {
  const cartPage({ Key? key }) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  int _selectedIndex = 1;
  final List<Color> _bgColors = [
    HexColor("#15CE1F"),
    HexColor("#13B662"),
    HexColor("#119DA4"),
    HexColor("#19647E"),
  ];
  final List<Widget> _pages = [
    HomePage(),
    chatPage(),
    favPage(),
  ];
  @override
  Widget build(BuildContext context) {
     Color TextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#575353");
    Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.white;
    Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#0EC42B") : HexColor("#575353");
     final cartProvider = Provider.of<CartModel>(context,listen: false);
    return Scaffold(
      body:  Column(
          children: [
            Padding(
              padding:EdgeInsets.only(left:25.0,right:20.0,top:53.0),
              child: Text('My Cart',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color:topic)),
            ),
            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.cartList.length,
                    padding: EdgeInsets.all(20.0),

                    itemBuilder: (context, index) {
                      var x = value.cartList[index];
                      print(x.image);
                      return Container(
                        padding: EdgeInsets.zero,
                        child: cartTiles(
                          image: x.image,
                          title: x.name,
                          price: x.price,
                          count: int.parse(x.quantity),
                          total: x.totalPrice.toString(),
                          // onCategorySelected: (String ) {  },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10.0,),
            Column(
              children: [
                // ...existing code...
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 37.0),
                  child: Container(
                    height:2.0, // Specify the desired height of the divider
                    child: const Divider(
                       // Set the color of the divider
                    ),
                  ),
                ),
                const SizedBox(height: 5.0), // Reduce the gap between the divider and subtotal
                Padding(
                  padding: const EdgeInsets.only(left:35.0,right: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                         
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 16.0,
                              
                            ),
                          ),
                          Text(
                            cartProvider.calculateTotalPrice().toString(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0), // Reduce the gap between subtotal and delivery fee
                Padding(
                  padding: const EdgeInsets.only(left:35.0,right: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                         
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                              '\$',
                              style: TextStyle(
                                fontSize: 16.0,
                               
                              ),
                            ),

                          Text(
                            '50.00',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0), // Reduce the gap between delivery fee and total
                Padding(
                  padding: const EdgeInsets.only(left:35.0,right: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                         
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            cartProvider.calculateTotalPrice()!=0.00?(cartProvider.calculateTotalPrice()+50.0).toString():'0.00',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context){
                    return const  Address();
                  },
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom:25.0),
                child: Container(
                    width: 275.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: HexColor("#0EC42B"),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Address",
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontFamily: 'Roboto',
                            color: HexColor("#FFFFFF"),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(width:120.0), // Add a space of 5.0 between the text and the icon
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: HexColor("#FFFFFF"),
                        size:25.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

       bottomNavigationBar: Container(
        color: navbar,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            selectedIndex: _selectedIndex,
            iconSize: 30.0,
            gap: 8.0,
            textSize: 18.0,
            // backgroundColor: Colors.white,
            tabBackgroundColor: _bgColors[_selectedIndex],
            activeColor: Colors.white,
            padding: EdgeInsets.all(16.0),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
                iconColor: HexColor("#15CE1F"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
                iconColor: HexColor("#13B662"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              GButton(
                icon: Icons.chat_bubble_outline_rounded,
                text: 'Chat',
                iconColor: HexColor("#119DA4"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => chatPage()),
                  );
                },
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: 'Favorites',
                iconColor: HexColor("#19647E"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => favPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}