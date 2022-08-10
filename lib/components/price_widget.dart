import 'package:flutter/material.dart';

import '../utilities/app_constants.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final double liraSize;
  final double kurusSize;

  const PriceWidget({
    Key? key,
    required this.price,
    this.liraSize = 18,
    this.kurusSize = 12,
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
          style: TextStyle(fontFamily: 'TRY', fontSize: liraSize),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 3),
          child: Text(','),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            kurus,
            style: TextStyle(fontSize: kurusSize),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
