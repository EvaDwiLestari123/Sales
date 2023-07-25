import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sales/pages/Menu/add_cart.dart';
import 'package:sales/Model/cart_model.dart';
import 'package:sales/pages/Menu/home.dart';
import 'package:sales/theme.dart';
import 'package:sales/widget.dart';

class AddPurchasePage extends StatefulWidget {
  @override
  State<AddPurchasePage> createState() => _AddPurchasePageState();
}

class _AddPurchasePageState extends State<AddPurchasePage> {
  var userDetails = {};
  var i;
  List returnTicketDetails = [];
  int count = 0;
  Map<String, int> jumlahItem = {};
  int totalHarga = 0;

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      appBar: buildAppBar(context, 'Sales Order'),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 25,
              right: 20,
            ),
            child: Text(
              'Customer',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: userCard(is_show: false),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.35,
                    height: 45,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 40, child: Icon(Icons.search)),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 9),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(fontSize: 13)),
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.filter_list)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Building Material',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/baja.png',
              title1: 'Baja',
              title2: 'Rp.500.000/pcs',
              title3: 'Stock: 150',
              onCountChanged: (newCount) {
                int harga = 500000;
                Provider.of<CartModel>(context, listen: false)
                    .addItem('Baja', newCount - (jumlahItem['Baja'] ?? 0));
                setState(() {
                  totalHarga += harga * (newCount - (jumlahItem['Baja'] ?? 0));
                  jumlahItem['Baja'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/batu_bata.png',
              title1: 'Batu Bata',
              title2: 'Rp.3.000/pcs',
              title3: 'Stock: 10250',
              onCountChanged: (newCount) {
                int harga = 3000;
                Provider.of<CartModel>(context, listen: false).addItem(
                    'Batu Bata', newCount - (jumlahItem['Batu Bata'] ?? 0));
                setState(() {
                  totalHarga +=
                      harga * (newCount - (jumlahItem['Batu Bata'] ?? 0));
                  jumlahItem['Batu Bata'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/pasir.png',
              title1: 'Pasir',
              title2: 'Rp.75.000/pcs',
              title3: 'Stock: 1324',
              onCountChanged: (newCount) {
                int harga = 75000;
                Provider.of<CartModel>(context, listen: false)
                    .addItem('Pasir', newCount - (jumlahItem['Pasir'] ?? 0));
                setState(() {
                  totalHarga += harga * (newCount - (jumlahItem['Pasir'] ?? 0));
                  jumlahItem['Pasir'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/besi 5M.png',
              title1: 'Besi 5M',
              title2: 'Rp.25.000/pcs',
              title3: 'Stock: 12000',
              onCountChanged: (newCount) {
                int harga = 25000;
                Provider.of<CartModel>(context, listen: false).addItem(
                    'Besi 5M', newCount - (jumlahItem['Besi 5M'] ?? 0));
                setState(() {
                  totalHarga +=
                      harga * (newCount - (jumlahItem['Besi 5M'] ?? 0));
                  jumlahItem['Besi 5M'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/kayu_5M.png',
              title1: 'Kayu 5M',
              title2: 'Rp.25.000/pcs',
              title3: 'Stock: 321',
              onCountChanged: (newCount) {
                int harga = 25000;
                setState(() {
                  totalHarga +=
                      harga * (newCount - (jumlahItem['Kayu 5M'] ?? 0));
                  jumlahItem['Kayu 5M'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Door, Window And ETC',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/pintu.png',
              title1: 'Pintu',
              title2: 'Rp.125.000/pcs',
              title3: 'Stock: 32',
              onCountChanged: (newCount) {
                int harga = 125000;
                Provider.of<CartModel>(context, listen: false)
                    .addItem('Pintu', newCount - (jumlahItem['Pintu'] ?? 0));
                setState(() {
                  totalHarga += harga * (newCount - (jumlahItem['Pintu'] ?? 0));
                  jumlahItem['Pintu'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/ubin.jpg',
              title1: 'Keramik',
              title2: 'Rp.76.000/pcs',
              title3: 'Stock: 452',
              onCountChanged: (newCount) {
                int harga = 76000;
                Provider.of<CartModel>(context, listen: false).addItem(
                    'Keramik', newCount - (jumlahItem['Keramik'] ?? 0));
                setState(() {
                  totalHarga +=
                      harga * (newCount - (jumlahItem['Keramik'] ?? 0));
                  jumlahItem['Keramik'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: KategoriMaterial(
              image: 'assets/images/jendela.jpeg',
              title1: 'Jendela',
              title2: 'Rp.320.000/pcs',
              title3: 'Stock: 76',
              onCountChanged: (newCount) {
                int harga = 320000;
                Provider.of<CartModel>(context, listen: false).addItem(
                    'Jendela', newCount - (jumlahItem['Jendela'] ?? 0));
                setState(() {
                  totalHarga +=
                      harga * (newCount - (jumlahItem['Jendela'] ?? 0));
                  jumlahItem['Jendela'] = newCount;
                });
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Total :',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Rp.$totalHarga',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: fillButton(context, 'Add to Cart', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(itemsInCart: jumlahItem),
                ),
              );
            }, is_show: false),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
