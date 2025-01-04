import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Untuk gambar SVG

class LazFlashPage extends StatefulWidget {
  @override
  _LazFlashPageState createState() => _LazFlashPageState();
}

class _LazFlashPageState extends State<LazFlashPage> {
  bool isDarkMode = false; // Variabel untuk menentukan mode terang/gelap

  final List<String> products = List.filled(8, "Sandal Jepit Anti Slip"); // Daftar produk (dummy data)

  // Daftar gambar promo dari folder assets
  final List<String> promoImages = [
    'assets/images/image_1.png',
    'assets/images/image_2.png',
    'assets/images/image_3.png',
    'assets/images/image_4.png',
    'assets/images/image_5.png',
  ];

  // Fungsi untuk toggle antara mode terang dan mode gelap
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
              'assets/icons/lazada_icon.svg', // Path ke file SVG logo Lazada
              height: 18, // Ukuran logo
            ),
            const SizedBox(width: 12), // Jarak antara logo dan search bar
            Expanded(
              child: Container(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
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
            const SizedBox(width: 12), // Jarak antara search bar dan dark mode icon
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
          // Promo Banner
          Container(
            height: 170, // Tinggi promo banner
            margin: const EdgeInsets.symmetric(horizontal: 6.5),
            padding: const EdgeInsets.symmetric(horizontal: 6.5), // Margin kiri dan kanan
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Sudut promo banner melengkung
              child: CarouselSlider.builder(
                itemCount: promoImages.length,
                itemBuilder: (context, index, realIndex) {
                  return _buildBannerImage(promoImages[index]);
                },
                options: CarouselOptions(
                  height: 170,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
              ),
            ),
          ),

          // GridView untuk Produk
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0), // Padding pada grid produk
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Jumlah kolom
                mainAxisSpacing: 10, // Jarak antar baris
                crossAxisSpacing: 10, // Jarak antar kolom
                childAspectRatio: 0.7, // Rasio ukuran elemen grid
              ),
              itemBuilder: (context, index) {
                return _buildProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menampilkan gambar pada banner promo
  Widget _buildBannerImage(String assetPath) {
    return Image.asset(
      assetPath, // Path gambar yang diambil dari daftar promoImages
      fit: BoxFit.cover, // Gambar memenuhi area banner
    );
  }

  // Fungsi untuk menampilkan kartu produk
  Widget _buildProductCard() {
    return Card(
      elevation: 2, // Shadow pada kartu
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              "https://dummyimage.com/200x200/000/fff&text=Product",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Text(
              "Sandal Jepit Anti Slip",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "Rp. 25.000",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              children: [
                Icon(Icons.star, size: 14, color: Colors.orange),
                Text("4.4", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text("Jakarta Utara", style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
