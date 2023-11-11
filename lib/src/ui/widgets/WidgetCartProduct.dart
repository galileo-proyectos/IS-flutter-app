import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:multi_screen_app/src/providers/ProviderCart.dart';
import 'package:multi_screen_app/src/ui/MyStyles.dart';
import 'package:provider/provider.dart';

class WidgetCartProduct extends StatefulWidget {
  WidgetCartProduct(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.price,
      required this.index,
      required this.quatity});
  String imageURL;
  String name;
  double price;
  int index;
  double quatity;

  @override
  State<WidgetCartProduct> createState() => _WidgetCartProduct();
}

class _WidgetCartProduct extends State<WidgetCartProduct> {
  @override
  void initState() {}
  Widget build(BuildContext ctx) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 115,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.imageURL,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.1),
                    colorBlendMode: BlendMode.difference,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 15),
                    child: Text(
                      widget.name,
                      softWrap: true,
                      style: MyStyles.subtitle,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Q ${widget.price} ',
                            style: MyStyles.price,
                          ),
                          Text(
                            'x ${widget.quatity}',
                            style: TextStyle(
                                color: MyStyles.orange,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              IconButton(
                  onPressed: () {
                    Provider.of<ProviderCart>(ctx, listen: false)
                        .removeAt(widget.index);
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 15,
                    color: Color(0xFFC7C7C7),
                  )),
              const Expanded(child: Center()),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: MyStyles.purple,
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
