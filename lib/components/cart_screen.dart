import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/components/cart_model.dart';
import 'package:kuliner_go_mobile/components/cart_provider.dart';
import 'package:kuliner_go_mobile/components/rounded_button_field.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
// ignore: unused_import
import 'package:badges/badges.dart';
import '../database/db_helperSQFlite.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesananku'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: badges.Badge(
              badgeContent: Consumer<CartProvider>(
                builder: ((context, value, child) {
                  return Text(
                    value.getCounter().toString(),
                    style: const TextStyle(color: Colors.white),
                  );
                }),
              ),
              child: const Icon(Icons.shopping_bag_rounded),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/Empty.png'),
                            const Center(
                              child:
                                  Text('Tidak ada item pada keranjang Anda.'),
                            ),
                          ]),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Image.asset(
                                          snapshot.data![index].image
                                              .toString(),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(left: 12),
                                                  child: Text(
                                                    snapshot.data![index]
                                                        .productName
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    dbHelper!.delete(snapshot
                                                        .data![index].id!);
                                                    cart.removeCounter();
                                                    cart.removeTotalPrice(
                                                      double.parse(
                                                        snapshot.data![index]
                                                            .productPrice
                                                            .toString(),
                                                      ),
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 12),
                                              child: Text(
                                                r"Rp" +
                                                    snapshot.data![index]
                                                        .productPrice
                                                        .toString(),
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  width: 120,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                      width: 0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            int quantity =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                            double price = snapshot
                                                                .data![index]
                                                                .initialPrice!;
                                                            quantity--;
                                                            double newPrice =
                                                                price *
                                                                    quantity;

                                                            if (quantity >= 1) {
                                                              dbHelper!
                                                                  .updateQuantity(
                                                                Cart(
                                                                    id: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!,
                                                                    productId: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!,
                                                                    productName: snapshot
                                                                        .data![
                                                                            index]
                                                                        .productName!,
                                                                    initialPrice: snapshot
                                                                        .data![
                                                                            index]
                                                                        .initialPrice!,
                                                                    productPrice:
                                                                        newPrice,
                                                                    quantity:
                                                                        quantity,
                                                                    image: snapshot
                                                                        .data![
                                                                            index]
                                                                        .image
                                                                        .toString()),
                                                              )
                                                                  .then(
                                                                      (value) {
                                                                newPrice = 0;
                                                                quantity = 0;
                                                                cart.removeTotalPrice(
                                                                    double.parse(snapshot
                                                                        .data![
                                                                            index]
                                                                        .initialPrice!
                                                                        .toString()));
                                                              }).onError((error,
                                                                      stackTrace) {
                                                                print(error
                                                                    .toString());
                                                              });
                                                            }
                                                          },
                                                          child: const Icon(
                                                            Icons.remove,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            int quantity =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .quantity!;
                                                            double price = snapshot
                                                                .data![index]
                                                                .initialPrice!;
                                                            quantity++;
                                                            double newPrice =
                                                                price *
                                                                    quantity;

                                                            dbHelper!
                                                                .updateQuantity(
                                                              Cart(
                                                                  id: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!,
                                                                  productId: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!,
                                                                  productName: snapshot
                                                                      .data![
                                                                          index]
                                                                      .productName!,
                                                                  initialPrice: snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialPrice!,
                                                                  productPrice:
                                                                      newPrice,
                                                                  quantity:
                                                                      quantity,
                                                                  image: snapshot
                                                                      .data![
                                                                          index]
                                                                      .image
                                                                      .toString()),
                                                            )
                                                                .then((value) {
                                                              newPrice = 0;
                                                              quantity = 0;
                                                              cart.addTotalPrice(
                                                                  double.parse(snapshot
                                                                      .data![
                                                                          index]
                                                                      .initialPrice!
                                                                      .toString()));
                                                            }).onError((error,
                                                                    stackTrace) {
                                                              print(error
                                                                  .toString());
                                                            });
                                                          },
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return const Text('');
              },
            ),
            Column(
              children: <Widget>[
                ExpansionTile(
                  title: const Text('Kartu / Rekening Bank'),
                  tilePadding: const EdgeInsets.symmetric(
                      horizontal: 1.0, vertical: 1.0),
                  childrenPadding: const EdgeInsets.only(left: 12),
                  leading: const Icon(Icons.wallet_rounded),
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          width: 520,
                          padding: const EdgeInsets.only(left: 40, right: 30),
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                height: 70,
                                padding: const EdgeInsets.only(
                                  right: 60,
                                ),
                                child: Image.asset('assets/Mandiri.png'),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 16, right: 42),
                                child: const Text('| Mandiri'),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Consumer<CartProvider>(
              builder: (context, value, child) {
                return Visibility(
                  visible: value.getTotalPrice().toStringAsFixed(1) == "0.00"
                      ? false
                      : true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ReusableWidget(
                          tile: ' \t Harga Item: \t',
                          value:
                              r'Rp' + value.getTotalPrice().toStringAsFixed(1),
                        ),
                        ReusableWidget(
                          tile: ' \t Harga Total: \t',
                          value:
                              r'Rp' + value.getTotalPrice().toStringAsFixed(1),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            RoundedButton(
              text: 'Konfirmasi Pembayaran',
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String tile;
  final String value;

  const ReusableWidget({super.key, 
    required this.tile,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tile,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
