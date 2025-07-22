import 'package:flutter/material.dart';

import 'package:hoormedicalstore/provider/product.dart';
import 'package:hoormedicalstore/screen/product_detail_screen.dart';

class HomeItemUi extends StatelessWidget {
  final Product _product;
  HomeItemUi(this._product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(19)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: _product.id),
            child: GridTile(
              child: Image.asset(
                _product.imageurl,
                fit: BoxFit.cover,
              ),
              footer: Container(
                height: 16,
                child: GridTileBar(
                    backgroundColor: Colors.deepPurple,
                    title: Center(
                      child: Text(
                        _product.title,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
