// ignore_for_file: unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sales/pages/Menu/add_purchase.dart';
import 'package:sales/theme.dart';

hello(String nama) {
  return Text('hallo' + nama);
}

// Card
Widget cardNotif(double screenWidth) {
  return Container(
    width: screenWidth, // Set the width to the screen width
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey, // Assuming greymedium is a Color variable.
          width: 1.5,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  'Additional Card',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey, // Assuming grey2 is a Color variable.
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '23 Januari 2022',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color:
                          Colors.grey), // Assuming grey2 is a Color variable.
                )
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Aliqua id fugiat nostrud irure ex duis ea quis id quis ad et. Sunt qui esse pariatur duis deserunt mollit dolore ',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey), // Assuming grey2 is a Color variable.
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    ),
  );
}

// Carousel
class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          options: CarouselOptions(
            height: 130,
            enlargeCenterPage: false,
            viewportFraction: 0.8,
            aspectRatio: 16 / 9,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return cardNotif(width);
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () {
                    _controller.animateToPage(i);
                  },
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(i == _current
                          ? 1
                          : 0.5), // Update color based on _current
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

//Item Kategori
Theme itemKategori(String titleText, IconData iconsContainer,
    Color colorContainer, Color iconColors, void Function() onTapFunction) {
  return Theme(
    data: ThemeData(
      splashColor: Colors.transparent,
    ),
    child: InkWell(
      onTap: onTapFunction,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorContainer,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              iconsContainer,
              color: iconColors,
              size: 30,
            ),
          ),
          Text(
            titleText,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

//App Bar

PreferredSize buildAppBar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(56),
    child: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
              width: 1.5,
            ),
            top: BorderSide(
              color: Colors.grey.shade200,
              width: 1.5,
            ),
          ),
        ),
        child: AppBar(
          toolbarHeight:
              80, // Set the toolbar height to create space between status bar and app bar
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              color: ungucerah,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          titleSpacing: 25,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent, // Add this line
        ),
      ),
    ),
  );
}

//Card User
Card userCard({bool is_show = true}) {
  String selectedOption = 'Option 1';
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: greymedium,
        width: 1.5,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile.png',
            height: 56,
            width: 56,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'J&D CO',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                width: 23,
              ),
              is_show
                  ? GFButton(
                      onPressed: () {},
                      text: "Choose",
                      shape: GFButtonShape.pills,
                      type: GFButtonType.outline,
                      color: ungucerah,
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 80),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Kategori Material
class KategoriMaterial extends StatefulWidget {
  final String image;
  final String title1;
  final String title2;
  final String title3;
  final Function(int) onCountChanged;

  KategoriMaterial({
    required this.image,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.onCountChanged,
  });

  @override
  _KategoriMaterialState createState() => _KategoriMaterialState();

  static fromJson(item) {}
}

class _KategoriMaterialState extends State<KategoriMaterial> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          widget.image,
          width: 50,
          height: 50,
        ),
      ),
      title: Text(
        widget.title1,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            widget.title2,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Text(
            widget.title3,
            style: TextStyle(fontSize: 10, color: greymedium),
          ),
        ],
      ),
      trailing: Container(
        width: 120,
        height: 35,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (count > 0) {
                  setState(() {
                    count--;
                    widget.onCountChanged(
                        count); // Call the callback when count changes
                  });
                }
              },
              child: Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text('-'),
              ),
            ),
            Container(
              width: 40,
              height: 35,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              alignment: Alignment.center,
              child: Text(count.toString()),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  count++;
                  widget.onCountChanged(count);
                });
              },
              child: Container(
                width: 40,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                alignment: Alignment.center,
                child: Text('+'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Button Fill
ElevatedButton fillButton(
    BuildContext context, String titleButton2, Function onPressed,
    {bool is_show = true}) {
  return ElevatedButton(
    onPressed: () => onPressed(),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: ungucerah,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        is_show
            ? Icon(
                Icons.add_shopping_cart,
                color: white,
              )
            : SizedBox(),
        SizedBox(width: 8),
        Text(
          titleButton2,
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
