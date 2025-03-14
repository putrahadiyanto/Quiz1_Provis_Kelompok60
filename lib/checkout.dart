import 'package:flutter/material.dart';
import 'monitor_pesanan.dart';

class Checkout extends StatefulWidget {
  final String productName;
  final String productImage;
  final String price;
  final String color;
  final String size;

  const Checkout({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int quantity = 1;
  int days = 1;
  bool isPickupSelected = true;
  bool isCourierSelected = false;
  bool isQrisSelected = true;
  bool isCodSelected = false;
  bool isBankSelected = false;

  void incrementQuantity() {
    setState(() {
      if (quantity < 10) quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  void incrementDays() {
    setState(() {
      if (days < 30) days++;
    });
  }

  void decrementDays() {
    setState(() {
      if (days > 1) days--;
    });
  }

  void togglePickup(bool? value) {
    setState(() {
      isPickupSelected = value ?? false;
      if (isPickupSelected) {
        isCourierSelected = false;
      }
    });
  }

  void toggleCourier(bool? value) {
    setState(() {
      isCourierSelected = value ?? false;
      if (isCourierSelected) {
        isPickupSelected = false;
      }
    });
  }

  void toggleQris(bool? value) {
    setState(() {
      isQrisSelected = value ?? false;
      if (isQrisSelected) {
        isCodSelected = false;
        isBankSelected = false;
      }
    });
  }

  void toggleCod(bool? value) {
    setState(() {
      isCodSelected = value ?? false;
      if (isCodSelected) {
        isQrisSelected = false;
        isBankSelected = false;
      }
    });
  }

  void toggleBank(bool? value) {
    setState(() {
      isBankSelected = value ?? false;
      if (isBankSelected) {
        isQrisSelected = false;
        isCodSelected = false;
      }
    });
  }

  int calculateTotalPrice() {
    int basePrice = int.parse(widget.price);
    int shippingCost = isCourierSelected ? 9000 : 0;
    return (basePrice * quantity * days) + shippingCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alamat Pengiriman
            const Text(
              'Alamat Pengiriman Kamu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.orange),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Rumah – Budi bin Budi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Laman Ipsum',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Jumlah dan Pengiriman
            const Text(
              'Jumlah',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.orange),
                  onPressed: decrementQuantity,
                ),
                Text('$quantity', style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.orange),
                  onPressed: incrementQuantity,
                ),
                const Spacer(),
                const Text(
                  'Lama Hari',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.orange),
                  onPressed: decrementDays,
                ),
                Text('$days', style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.orange),
                  onPressed: incrementDays,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Pengiriman Options
            Row(
              children: [
                Checkbox(
                  value: isPickupSelected,
                  onChanged: togglePickup,
                  activeColor: Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Jemput Langsung',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isCourierSelected,
                  onChanged: toggleCourier,
                  activeColor: Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Pake Kurir Aja',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Biaya Pengiriman
            AnimatedOpacity(
              opacity: isCourierSelected ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ucok Cargo',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.arrow_forward, color: Colors.grey),
                        const SizedBox(width: 8),
                        const Text(
                          'Estimasi Sampai 12–9–2025',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const Spacer(),
                        const Text(
                          'Rp 9000',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Metode Pembayaran
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: isQrisSelected,
                  onChanged: toggleQris,
                  activeColor: Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Qris',
                  style: TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Checkbox(
                  value: isCodSelected,
                  onChanged: toggleCod,
                  activeColor: Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'COD',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isBankSelected,
                  onChanged: toggleBank,
                  activeColor: Colors.orange,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Transfer Bank',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Rincian
            const Text(
              'Rincian:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '$quantity ${widget.color} ${widget.productName}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              'Lama Hari = $days hari',
              style: const TextStyle(fontSize: 14),
            ),
            if (isCourierSelected) ...[
              const SizedBox(height: 8),
              const Text(
                'Biaya Pengiriman = Rp 9.000',
                style: TextStyle(fontSize: 14),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              'Metode Pembayaran: ${isQrisSelected ? 'Qris' : isCodSelected ? 'COD' : 'Transfer Bank'}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Harga:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp ${calculateTotalPrice().toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Bayar Sekarang Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Add logic for payment
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Pembayaran berhasil! Total: Rp ${calculateTotalPrice()}'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(16),
                    duration: const Duration(seconds: 2),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MonitorPesanan()),
                );
              },
              child: Text(
                'Bayar Sekarang - Rp ${calculateTotalPrice()}',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
