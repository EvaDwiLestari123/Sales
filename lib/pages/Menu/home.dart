import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales/pages/Login/login.dart';
import 'package:sales/pages/Menu/add_purchase.dart';
import 'package:sales/pages/Menu/customer_list.dart';
import 'package:sales/theme.dart';
import 'package:sales/widget.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({
    super.key,
    required this.token,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Hello, John Doe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    'Sales',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: ungucerah,
                ),
              ),
              Image.asset(
                'assets/images/profile2.png',
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Utama
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: greymedium,
                  width: 1.5,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Quick Customer Purchase',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ungucerah,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    //Card user
                    userCard(),

                    // Button
                    fillButton(context, 'Add Purchase', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPurchasePage()),
                      );
                    }),

                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: BorderSide(
                          color: ungucerah,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        'Add Customer',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ungucerah),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.announcement_outlined,
                      color: ungucerah,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Quick Notification',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View More',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ungucerah,
                      ),
                    ),
                  )
                ],
              ),
            ),
            CarouselExample(),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Self-Service',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                itemKategori(
                  'Customer\nPO',
                  Icons.add_shopping_cart,
                  ungu,
                  ungudark,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                token: widget.token,
                              )),
                    );
                  },
                ),
                SizedBox(width: 8.0), // menambahkan jarak 8.0 pixel
                itemKategori(
                  'Sales\nOrder',
                  Icons.receipt_long,
                  biru,
                  birudark,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPurchasePage()),
                    );
                  },
                ),
                SizedBox(width: 8.0), // menambahkan jarak 8.0 pixel
                itemKategori(
                  'Customer\List',
                  Icons.groups,
                  hijau,
                  hijaudark,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CustomerListPage(token: widget.token)),
                    );
                  },
                ),

                SizedBox(width: 8.0), // menambahkan jarak 8.0 pixel
                itemKategori(
                  'More\n',
                  Icons.apps,
                  grey,
                  greydark,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddPurchasePage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
