import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "The Avid Bookworm"
            .text
            .xl4
            .bold
            .color(context.theme.colorScheme.secondary)
            .make(),
        "Available Books".text.xl2.make(),
      ],
    );
  }
}
