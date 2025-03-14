import 'package:flutter/material.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  // Sample voucher data - you can replace with your actual data model
  final List<VoucherItem> _vouchers = [
    VoucherItem(
      id: '1',
      title: 'Weekend Discount',
      description: 'Get 20% off on all weekend purchases',
      validUntil: DateTime(2025, 4, 15),
      discount: 20,
      minPurchase: 200000,
      isSelected: false,
      code: 'WEEKEND20',
    ),
    VoucherItem(
      id: '2',
      title: 'New User Special',
      description: 'Special discount for new users',
      validUntil: DateTime(2025, 3, 30),
      discount: 15,
      minPurchase: 100000,
      isSelected: false,
      code: 'NEWUSER15',
    ),
    VoucherItem(
      id: '3',
      title: 'Free Shipping',
      description: 'Free shipping on orders above Rp 500.000',
      validUntil: DateTime(2025, 5, 1),
      discount: 0,
      minPurchase: 500000,
      isSelected: false,
      code: 'FREESHIP',
      isFreeShipping: true,
    ),
  ];

  int _selectedVoucherIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Voucher Saya',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari voucher...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // Voucher list
          Expanded(
            child:
                _vouchers.isEmpty
                    ? const Center(child: Text('Tidak ada voucher tersedia'))
                    : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _vouchers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedVoucherIndex == index) {
                                _selectedVoucherIndex = -1;
                              } else {
                                _selectedVoucherIndex = index;
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                              border:
                                  _selectedVoucherIndex == index
                                      ? Border.all(
                                        color: Colors.amber,
                                        width: 2,
                                      )
                                      : null,
                            ),
                            child: Column(
                              children: [
                                // Voucher header
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.discount_outlined,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        _vouchers[index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Text(
                                          _vouchers[index].code,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Voucher details
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _vouchers[index].description,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        _vouchers[index].isFreeShipping
                                            ? 'Free Shipping'
                                            : 'Discount: ${_vouchers[index].discount}%',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Min. purchase: Rp ${_formatNumber(_vouchers[index].minPurchase)}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Valid until: ${_formatDate(_vouchers[index].validUntil)}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Selection indicator
                                if (_selectedVoucherIndex == index)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 16,
                                    ),
                                    color: Colors.amber.withOpacity(0.1),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'Voucher selected',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),

          // Bottom total section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Harga', style: TextStyle(fontSize: 14)),
                    SizedBox(height: 4),
                    Text(
                      'Rp. 750.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed:
                      _selectedVoucherIndex == -1
                          ? null
                          : () {
                            // Handle apply voucher
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Voucher ${_vouchers[_selectedVoucherIndex].code} applied successfully',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    disabledBackgroundColor: Colors.amber.withOpacity(0.3),
                    disabledForegroundColor: Colors.black38,
                    elevation: 0,
                    minimumSize: const Size(120, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Pakai',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class VoucherItem {
  final String id;
  final String title;
  final String description;
  final DateTime validUntil;
  final int discount;
  final int minPurchase;
  final String code;
  bool isSelected;
  final bool isFreeShipping;

  VoucherItem({
    required this.id,
    required this.title,
    required this.description,
    required this.validUntil,
    required this.discount,
    required this.minPurchase,
    required this.isSelected,
    required this.code,
    this.isFreeShipping = false,
  });
}
