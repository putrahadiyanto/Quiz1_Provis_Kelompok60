import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'chat.dart';
import 'wishlist.dart';
import 'keranjang.dart';
import 'monitor_pesanan.dart';
import 'voucher.dart';
import 'detail_produk.dart';
import 'checkout.dart';
import 'pengembalian.dart';
import 'add_to_cart.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Map<String, dynamic>> pages = [
    {'text': 'Home', 'route': HomeScreen()},
    {'text': 'Profile', 'route': ''},
    {'text': 'Settings', 'route': ''},
    {'text': 'Wishlist', 'route': ''},
    {'text': 'Keranjang & Checkout', 'route': ''},
    {'text': 'Pembelian Paket', 'route': ''},
    {'text': 'Monitor Pesanan', 'route': ''},
    {'text': 'Pengembalian', 'route': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5C4B99),
        title: const Text(
          'Quiz 1: UI',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.person), onPressed: () {})],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF5F5F5), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'Quiz 1 UI',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        'Kelompok Praktikum 60',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text(
                        '2305995 A Bintang iftitah Fj\n2308163 Putra Hadiyanto Nugroho',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Main Navigation
              const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 12),
                child: Text(
                  'Main Menu',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    context,
                    'Halaman Depan',
                    Icons.home,
                    const HomeScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    'Rincian Item',
                    Icons.description,
                    const Detailproduct(),
                  ),
                  _buildMenuCard(
                    context,
                    'Chat',
                    Icons.chat_bubble,
                    ChatScreen(),
                  ),
                  _buildMenuCard(
                    context,
                    'Wishlist',
                    Icons.favorite,
                    WishlistScreen(),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Shopping Section
              const Padding(
                padding: EdgeInsets.only(left: 8, bottom: 12),
                child: Text(
                  'Shopping',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              _buildFeatureCard(
                context,
                'Keranjang',
                Icons.shopping_cart,
                const KeranjangScreen(),
                const Color(0xFF5C4B99),
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                'Checkout',
                Icons.monetization_on,
                Checkout(
                  productName: 'Tenda Kemah',
                  productImage: 'assets/tenda.jpg',
                  price: '150000',
                  color: 'green',
                  size: 'M',
                ),
                const Color(0xFF5C4B99),
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                'Pembelian Paket atau Voucher',
                Icons.card_giftcard,
                const VoucherScreen(),
                const Color(0xFF3A98B9),
              ),
              const SizedBox(height: 16),
              _buildFeatureCard(
                context,
                'Add To Cart',
                Icons.add_shopping_cart,
                ProductDetailScreen(
                  productName: 'Tenda Kemah',
                  productImage: 'assets/tenda.jpg',
                  price: '150000',
                  stock: 10,
                  color: 'green',
                  size: 'M',
                ),
                const Color(0xFF3A98B9),
              ),

              const SizedBox(height: 24),

              // Transaction Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Transaksi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    _buildTransactionCard(
                      context,
                      'Monitor Pesanan',
                      Icons.local_shipping,
                      const MonitorPesanan(),
                    ),
                    const SizedBox(height: 12),
                    _buildTransactionCard(
                      context,
                      'Pengembalian',
                      Icons.assignment_return,
                      const Pengembalian(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget destination,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: const Color(0xFF5C4B99)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget destination,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color.withOpacity(0.8)],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 24, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget destination,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFEAE5F3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 24, color: const Color(0xFF5C4B99)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: const Color(0xFF5C4B99)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
