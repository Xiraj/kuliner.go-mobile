import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kuliner_go_mobile/components/controller.dart';

// ignore: camel_case_types
class formAddPage extends StatefulWidget {
  const formAddPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _formAddPageState createState() => _formAddPageState();
}

// ignore: camel_case_types
class _formAddPageState extends State<formAddPage> {
  late String email;
  final MyController c = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 110,
          width: 350,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.only(
            top: 15,
            bottom: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[250],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5, top: 40),
                child: IconButton(
                  icon: Icon(
                    Icons.remove,
                    size: 28,
                  ),
                  onPressed: () => c.decrement(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 110, bottom: 15),
                child: Column(
                  children: [
                    Image.asset('assets/user.png'),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => Text(
                        "${c.orang.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff0190ff),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 100, top: 40),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 28,
                  ),
                  onPressed: () => c.increment(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
