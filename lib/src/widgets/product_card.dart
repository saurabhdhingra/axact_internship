import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final bool isSelected;
  final bool isLiked;
  final String image;
  final int price;
  final String name;
  final String category;
  final ValueChanged onSelected;
  ProductCard(
      {Key key,
      this.name,
      this.id,
      this.isSelected,
      this.isLiked,
      this.image,
      this.price,
      this.category,
      this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !isSelected ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: LightColor.lightBlue.withAlpha(40),
                      ),
                      Image.asset(image)
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: name,
                  fontSize: isSelected ? 16 : 14,
                ),
                TitleText(
                  text: category,
                  fontSize: isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: price.toString(),
                  fontSize: isSelected ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(onSelected);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
