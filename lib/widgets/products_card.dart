import 'package:flutter/material.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                product: product,
              ),
            ));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              product.galleries.first.url,
              // 'assets/image_shoes.png',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
