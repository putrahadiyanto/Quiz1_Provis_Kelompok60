import 'dart:ui';
import 'package:flutter/material.dart';
import 'add_to_cart.dart';
import 'checkout.dart';
import 'main.dart';

class Detailproduct extends StatefulWidget {
  const Detailproduct({Key? key}) : super(key: key);

  @override
  State<Detailproduct> createState() => _DetailproductState();
}

class _DetailproductState extends State<Detailproduct> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 4;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Review data
    final reviews = [
      {
        'name': 'Andi',
        'rating': 5,
        'comment': 'Great tent! Easy setup and really comfortable.',
        'date': '2 days ago',
      },
      {
        'name': 'Budi',
        'rating': 4,
        'comment': 'Waterproof as promised! Stayed dry during heavy rain.',
        'date': '1 week ago',
      },
      {
        'name': 'Citra',
        'rating': 5,
        'comment': 'Perfect for our family trip! Spacious and sturdy.',
        'date': '2 weeks ago',
      },
      {
        'name': 'Dodi',
        'rating': 5,
        'comment': 'Excellent quality tent. Worth every penny!',
        'date': '3 weeks ago',
      },
      {
        'name': 'Eka',
        'rating': 4,
        'comment': 'Quick delivery and exactly as described. Very satisfied!',
        'date': '1 month ago',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Detail Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), // Black arrow
          onPressed: () {
            // Navigate to HomePage
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false, // Remove all routes
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Main content area (scrollable)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tent Image with Swipe
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          itemCount: _numPages,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.lightBlue.shade100,
                                    Colors.lightBlue.shade300,
                                  ],
                                ),
                              ),
                              child: Image.asset(
                                'assets/tenda.jpg',
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${_currentPage + 1}/$_numPages',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Page indicators
                      Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_numPages, (index) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _currentPage == index
                                        ? Colors.amber
                                        : Colors.white.withOpacity(0.4),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  // Product Title and Location
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tenda Kemah',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Kota Bandung',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 24,
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.star, color: Colors.amber, size: 24),
                            SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Product Description
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deskripsi Produk',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Experience the outdoors with our 4-person waterproof camping tent, designed for ultimate comfort and durability. Perfect for camping, hiking, or festivals, this tent is lightweight, easy to set up, and provides excellent protection against rain and wind.\n\n'
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in dui mauris. Vivamus hendrerit arcu sed erat molestie vehicula. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio.\n\n'
                          'Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit.\n\n'
                          'Features:\n'
                          '• Premium waterproof material\n'
                          '• Windproof structure\n'
                          '• Spacious interior (290 x 200 x 130 cm)\n'
                          '• Accommodates 4 adults comfortably\n'
                          '• Easy pop-up assembly\n'
                          '• Includes carrying bag\n'
                          '• Ventilation windows with mesh\n'
                          '• UV protection coating\n'
                          '• Double-layer waterproof floor\n\n'
                          'Nunc luctus, quam non condimentum ornare, orci dolor mollis urna, id dictum leo mauris eget erat. Etiam sagittis, sem a ultrices lobortis, neque ipsum consequat ipsum, eget facilisis enim velit non mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Reviews Section Title
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Reviews Slider
                  Container(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: reviews.length,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.grey.shade400,
                                    child: Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review['name'] as String,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          review['date'] as String,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: List.generate(
                                  5,
                                  (starIndex) => Icon(
                                    starIndex < (review['rating'] as int)
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Expanded(
                                child: Text(
                                  review['comment'] as String,
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Add some space at the bottom
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // Fixed Bottom Bar with Price and Booking Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. 150.000/hari',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // ...existing code...
                    // Modify the GestureDetector onTap method inside the bottom bar
                    // ...existing code...
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          builder: (context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Dialog(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                insetPadding: EdgeInsets.all(10),
                                child: ProductDetailScreen(
                                  productName: 'KingRunning Tenda Camping',
                                  productImage: 'assets/tenda.jpg',
                                  price: '150.000',
                                  stock: 10,
                                  color: 'Green',
                                  size: '290 x 200 x 130 cm',
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.shopping_cart_outlined),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Checkout(
                                  productName: 'Tenda Kemah',
                                  productImage: 'assets/tenda.jpg',
                                  price: '150000',
                                  color: 'green',
                                  size: 'M',
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sewa Sekarang',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
