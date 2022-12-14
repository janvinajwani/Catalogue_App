import 'package:flutter/material.dart';
import 'package:flutter_kindle/models/catalog.dart';
import 'package:flutter_kindle/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_kindle/widgets/home_widgets/add_to_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalogue;

  const HomeDetailPage({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalogue.price}".text.bold.xl4.make(),
            AddToCart(
              catalogue: catalogue,
            ).wh(100, 40)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalogue.id.toString()),
              child: Image.network(catalogue.image),
            ).h24(context),
            Expanded(
              child: VxArc(
                height: 40.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalogue.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalogue.desc.text
                          .textStyle(context.captionStyle!)
                          .xl
                          .make(),
                      10.heightBox,
                      "Amet labo lorem eirmod dolore duo. Sed consetetur et eos erat ipsum tempor, sea aliquyam eirmod vero ut sed sit et sadipscing diam, et ipsum sed ipsum at duo."
                          .text
                          .textStyle(context.captionStyle!)
                          .make()
                          .p8()
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add to cart".text.make(),
            )*/