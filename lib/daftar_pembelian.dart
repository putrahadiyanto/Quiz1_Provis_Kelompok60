import 'package:flutter/material.dart';

class PembelianScreen extends StatelessWidget {
  const PembelianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFBA00),
        elevation: 0,
        title: const Text(
          'Pembelian',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rental Items Section
                    const SizedBox(height: 16),
                    _buildRentalItem(
                      status: 'Belum Dijemput',
                      statusColor: Colors.orange,
                      date: '10 Sep 2025',
                    ),
                    const SizedBox(height: 12),
                    _buildRentalItem(
                      status: 'Selesai',
                      statusColor: Colors.green,
                      date: '10 Sep 2025',
                    ),
                    const SizedBox(height: 12),
                    _buildRentalItem(
                      status: 'Dibatalkan',
                      statusColor: Colors.red,
                      date: '10 Sep 2025',
                    ),

                    // Return Section
                    const SizedBox(height: 24),
                    const Text(
                      'Daftar Pengembalian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildReturnItem(),

                    // Customer Service Banner
                    const SizedBox(height: 24),
                    _buildCustomerServiceBanner(),
                    const SizedBox(height: 80), // Space for bottom navigation
                  ],
                ),
              ),
            ),
          ),
          // Bottom Navigation
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomNavigation(),
          ),
        ],
      ),
    );
  }

  Widget _buildRentalItem({
    required String status,
    required Color statusColor,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.handshake_outlined, size: 28),
                const SizedBox(width: 8),
                const Text(
                  'SEWA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(date, style: const TextStyle(fontSize: 14)),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Detail >', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(width: 4),
              ],
            ),
          ),
          const Divider(height: 1),
          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/tenda.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tenda Kemah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '12 - 13 September 2025',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      const Text('Total Bayar :'),
                      const Text(
                        'Rp 150.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                // Buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(80, 30),
                      ),
                      child: const Text(
                        'Ulas',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFBA00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(80, 30),
                      ),
                      child: const Text(
                        'Sewa Lagi',
                        style: TextStyle(color: Colors.black, fontSize: 12),
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

  Widget _buildReturnItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Product Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/tenda.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.block, color: Colors.white, size: 30),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Tenda Kemah',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          // Return Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Kembalikan Sebelum', style: TextStyle(fontSize: 12)),
              const Text(
                '15 September 2025',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 12),
              const Text('Detail >', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerServiceBanner() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Image.asset(
            'assets/think.jpg',
            width: 50,
            height: 50,
            // If you don't have this asset, use an icon instead:
            // const Icon(Icons.support_agent, size: 50, color: Color(0xFFFFBA00)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Pesananmu bermasalah ?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Hubungi customer service kami untuk temukan solusi buat masalahmu.',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.phone, color: Colors.green, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_outlined, ''),
          _buildNavItem(Icons.chat_bubble_outline, ''),
          _buildNavItem(Icons.receipt_outlined, '', isActive: true),
          _buildNavItem(Icons.notifications_outlined, ''),
          _buildNavItem(Icons.person_outline, ''),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFFFFBA00) : Colors.grey,
          size: 24,
        ),
        if (label.isNotEmpty)
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? const Color(0xFFFFBA00) : Colors.grey,
            ),
          ),
      ],
    );
  }
}
