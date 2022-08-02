import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_kindle/models/catalog.dart';
import 'package:flutter_kindle/utils/routes.dart';
import 'package:flutter_kindle/widgets/drawer.dart';
import 'package:flutter_kindle/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_kindle/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_kindle/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_kindle/models/cart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  // final String name = "Janvi";

  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  // var url = "	https://www.googleapis.com/books/v1/volumes?q=ISBN:";
  //final url = "http://localhost:3000/products";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogueJson =
        //await rootBundle.loadString("assests/files/catalogue.json");
        await rootBundle.loadString("assests/files/books.json");

    // final response = await http.get(Uri.parse(url));
    // final response =
    //   await http.get(Uri.parse('http://localhost:3000/products'));
    //if (response.statusCode != 200) {
    //throw Exception('Failed to load album');
    //}
    //final catalogueJson = response.body;
    // print(catalogueJson);

    final decodedData = jsonDecode(catalogueJson);
    var productsData = decodedData["products"];
    // var productsData = decodedData["items"];
    CatalogueModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = VxState.store.cart;

    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, MyStore, _) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.gray300,
              size: 20,
              count: _cart.items.length,
              textStyle: TextStyle(
                  color: MyTheme.blueish, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogueHeader(),
                if (CatalogueModel.items != null &&
                    CatalogueModel.items!.isNotEmpty)
                  CatalogueList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
