import 'package:dine_test/core/assets/app_image.dart';
import 'package:dine_test/features/presentation/pages/foods_page/tabs/menu_tab/widgets/cross_discount_price_painter.dart';
import 'package:flutter/material.dart';

class FoodItemTile extends StatelessWidget {
  const FoodItemTile({
    Key? key,
    required this.image,
    required this.name,
    this.ingredients,
    required this.price,
    this.discountedPrice, this.onTap,
  }) : super(key: key);

  final Widget image;
  final String name;
  final String? ingredients;
  final String price;
  final String? discountedPrice;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.0,
              width: 80.0,
              child: image,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: themeData.textTheme.subtitle1!.apply(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        discountedPrice ?? price,
                        style: themeData.textTheme.subtitle1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          ingredients ?? " ",
                          style: themeData.textTheme.overline!.apply(
                            color: themeData.disabledColor,
                          ),
                        ),
                      ),
                      if (discountedPrice != null) ...[
                        const SizedBox(
                          width: 12.0,
                        ),
                        CustomPaint(
                          painter: CrossDiscountPricePainter(),
                          child: Text(
                            discountedPrice != null ? price : " ",
                            style: themeData.textTheme.headline5!.apply(
                              color: themeData.disabledColor,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
