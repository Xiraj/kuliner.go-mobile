import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kuliner_go_mobile/components/cartModel.dart';
import 'package:kuliner_go_mobile/components/controller.dart';
import 'package:kuliner_go_mobile/components/pembayaran.dart';
import 'package:kuliner_go_mobile/pages/cart_page.dart';
import 'package:kuliner_go_mobile/pages/menu_resto.dart';

class CartItemSample extends StatelessWidget {
  @override
  final MyController c = Get.put(MyController());
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          for (int i = 1; i <= 4; i++)
            Container(
              height: 110,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.only(left: 1, top: 15, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Radio(
                    value: "",
                    groupValue: "",
                    activeColor: Color(0xff0190ff),
                    onChanged: (index) {},
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset('assets/images/$i.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Title',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Rp',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.delete_sweep,
                          color: Colors.red,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GestureDetector(
                                child: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                                onTap: () => c.menuDecrement(),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Obx(
                                  () => Text(
                                    "${c.menu.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff0190ff),
                                    ),
                                  ),
                                )),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: GestureDetector(
                                child: Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                ),
                                onTap: () => c.menuIncrement(),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          Divider(
            thickness: 2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12, bottom: 12),
                child: Text(
                  'Metode Pembayaran',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              pembayaranPage(),
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                'Harga Item',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 199,
              ),
              Text(
                'Rp',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                'Biaya Layanan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 172,
              ),
              Text(
                'Rp',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 250,
              ),
              Text(
                'Rp',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
          ),
          Container(
            width: 354,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  width: 0,
                )),
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Pembayaran Tidak Berhasil'),
                ));
              },
              child: Text('Bayar Sekarang'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}