import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_kindle/models/cart.dart';
import 'package:flutter_kindle/models/catalog.dart';
import 'package:flutter_kindle/screens/home_detail_screen.dart';
import '../../utils/routes.dart';
import '../theme.dart';
import 'catalog_image.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogueModel.items?.length,
      itemBuilder: (context, index) {
        final catalogue = CatalogueModel.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalogue: catalogue,
                    ),
                  ),
                ),
            child: CatalogueItem(catalogue: catalogue));
      },
    );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item catalogue;
  const CatalogueItem({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalogue.id.toString()),
            child: CatalogueImage(image: catalogue.image),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogue.name.text.lg
                  .color(context.theme.accentColor)
                  .bold
                  .make(),
              catalogue.desc.text.textStyle(context.captionStyle!).make(),
              32.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalogue.price}".text.bold.xl.make(),
                  AddToCart(catalogue: catalogue),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().p4();
  }
}
