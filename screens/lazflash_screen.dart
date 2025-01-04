import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tes_lazada/widgets/product_card.dart'; // Impor file ProductCard

class LazFlashPage extends StatefulWidget {
  @override
  _LazFlashPageState createState() => _LazFlashPageState();
}

class _LazFlashPageState extends State<LazFlashPage> {
  bool isDarkMode = false;

  final List<Map<String, dynamic>> products = List.generate(
    8,
    (index) => {
      "imageUrl": "https://dummyimage.com/200x200/000/fff&text=Product",
      "productName": "Sandal Jepit Anti Slip",
      "price": "Rp. 25.000",
      "location": "Jakarta Utara",
      "rating": 4.4,
    },
  );

  final List<String> promoImages = [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
    'assets/images/image_3.png',
    'assets/images/image_4.png',
    'assets/images/image_5.png',
  ];

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/lazada_icon.svg',
              height: 18,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: toggleDarkMode,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 170,
            margin: const EdgeInsets.symmetric(horizontal: 6.5),
            padding: const EdgeInsets.symmetric(horizontal: 6.5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CarouselSlider.builder(
                itemCount: promoImages.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    promoImages[index],
                    fit: BoxFit.cover,
                  );
                },
                options: CarouselOptions(
                  height: 170,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  imageUrl: product["imageUrl"],
                  productName: product["productName"],
                  price: product["price"],
                  location: product["location"],
                  rating: product["rating"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
