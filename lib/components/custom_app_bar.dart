import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/home_bottomnav.dart';
import 'package:kuliner_go_mobile/pages/home_page.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final IconData midIcon;
  final Function? leftCallback;
  CustomAppBar(this.leftIcon, this.rightIcon, this.midIcon,
      {super.key, this.leftCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homeBottomNav(),
                    ),
                  );
                },
                child: _buildIcon(leftIcon)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 190),
            child: Row(
              children: [
                _buildIcon(midIcon),
              ],
            ),
          ),
          _buildIcon(rightIcon),
        ],
      ),
    );
  }

  Container _buildIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
