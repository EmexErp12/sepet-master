import 'package:flutter/material.dart';

import '../utilities/app_constants.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final double liraSize;
  final double kurusSize;
  final Color? fontColor;
  final bool isBold;

  const PriceWidget({
    Key? key,
    required this.price,
    this.liraSize = 18,
    this.kurusSize = 12,
    this.fontColor,
    this.isBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dizi = AppConstants.format.format(price).split(',');

    var lira = dizi[0];
    var kurus = '00';

    if (dizi.length > 1) {
      kurus = dizi[1];
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          lira,
          style: TextStyle(
              fontFamily: 'TRY',
              fontSize: liraSize,
              color: fontColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            ',',
            style: TextStyle(
              color: fontColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            kurus,
            style: TextStyle(
              fontSize: kurusSize,
              color: fontColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
