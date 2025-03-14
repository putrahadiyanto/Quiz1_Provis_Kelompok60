import 'package:flutter/material.dart';
import 'main.dart';

class Pengembalian extends StatefulWidget {
  const Pengembalian({Key? key}) : super(key: key);

  @override
  State<Pengembalian> createState() => _PengembalianState();
}

class _PengembalianState extends State<Pengembalian> {
  // Sample data for camping and adventure items
  final List<ReturnItem> _items = [
    ReturnItem(
      id: "1",
      name: "Tenda Camping 2 Orang Waterproof",
      price: "Rp 750.000",
      status: "Pending",
      date: "12 Mar 2025",
      image: "assets/images/tent.jpg",
    ),
    ReturnItem(
      id: "2",
      name: "Sepatu Hiking Outdoor Anti-Air",
      price: "Rp 450.000",
      status: "Approved",
      date: "10 Mar 2025",
      image: "assets/images/hiking_boots.jpg",
    ),
    ReturnItem(
      id: "3",
      name: "Sleeping Bag Ultralight -5°C",
      price: "Rp 320.000",
      status: "Completed",
      date: "05 Mar 2025",
      image: "assets/images/sleeping_bag.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.orange, // Set AppBar color to orange
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // White back icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'List Pengembalian', // Updated title
          style: TextStyle(
            color: Colors.white, // White text color
            fontSize: 20, // Slightly larger font size
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
          _items.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _buildReturnItem(_items[index]);
                },
              ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.terrain, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Tidak ada pengembalian',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Pengembalian produk adventure Anda akan muncul di sini',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildReturnItem(ReturnItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Image placeholder
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.price,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildStatusBadge(item.status),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Return ID: #${item.id}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                Text(
                  item.date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _showReturnDetails(item),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Detail',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _trackReturn(item),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Orange button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Lacak',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case "Pending":
        bgColor = Colors.orange[50]!;
        textColor = Colors.orange[700]!;
        break;
      case "Approved":
        bgColor = Colors.green[50]!;
        textColor = Colors.green[700]!;
        break;
      case "Completed":
        bgColor = Colors.blue[50]!;
        textColor = Colors.blue[700]!;
        break;
      default:
        bgColor = Colors.grey[50]!;
        textColor = Colors.grey[700]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home', () {
              Navigator.pushReplacementNamed(context, '/home');
            }),
            _buildNavItem(Icons.chat_bubble_outline, 'Chat', () {}),
            _buildNavItem(Icons.backpack_outlined, 'Orders', () {}),
            _buildNavItem(Icons.notifications_outlined, 'Notification', () {}),
            _buildNavItem(Icons.person_outline, 'Profile', () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, VoidCallback onTap) {
    final bool isActive =
        label == 'Orders'; // Assuming this page is in Orders section

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:
                isActive
                    ? Colors.orange
                    : Colors.grey[600], // Orange for active
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color:
                  isActive
                      ? Colors.orange
                      : Colors.grey[600], // Orange for active
              fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  void _showReturnDetails(ReturnItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Detail Pengembalian',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Return details content
                      _buildDetailItem('Return ID', '#${item.id}'),
                      _buildDetailItem('Product', item.name),
                      _buildDetailItem('Price', item.price),
                      _buildDetailItem('Status', item.status),
                      _buildDetailItem('Date Requested', item.date),
                      _buildDetailItem('Reason', _getReturnReason(item.name)),
                      _buildDetailItem(
                        'Refund Method',
                        'Original Payment Method',
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Return Timeline',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildTimelineItem(
                        'Return Requested',
                        'Mar 12, 2025',
                        true,
                      ),
                      _buildTimelineItem(
                        'Return Approved',
                        'Mar 13, 2025',
                        item.status != 'Pending',
                      ),
                      _buildTimelineItem('Item Sent Back', 'Pending', false),
                      _buildTimelineItem('Refund Processed', 'Pending', false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getReturnReason(String itemName) {
    if (itemName.contains('Tenda')) {
      return 'Barang cacat - Sobek di bagian belakang tenda';
    } else if (itemName.contains('Sepatu')) {
      return 'Ukuran tidak sesuai - Terlalu kecil';
    } else if (itemName.contains('Sleeping Bag')) {
      return 'Tidak sesuai deskripsi - Tidak tahan suhu -5°C';
    }
    return 'Barang tidak sesuai pesanan';
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String title, String date, bool isCompleted) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isCompleted
                        ? Colors.orange
                        : Colors.grey[300], // Orange for completed
                border: Border.all(
                  color: isCompleted ? Colors.orange : Colors.grey[300]!,
                  width: 3,
                ),
              ),
              child:
                  isCompleted
                      ? const Icon(Icons.check, size: 12, color: Colors.white)
                      : null,
            ),
            if (title != 'Refund Processed')
              Container(
                width: 2,
                height: 30,
                color:
                    isCompleted
                        ? Colors.orange
                        : Colors.grey[300], // Orange for completed
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isCompleted ? Colors.black : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  void _trackReturn(ReturnItem item) {
    // Implementation for tracking the return
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Track Return'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tracking return for: ${item.name}'),
                const SizedBox(height: 16),
                const Text('Current Status:'),
                const SizedBox(height: 8),
                _buildStatusBadge(item.status),
                const SizedBox(height: 16),
                const Text('Estimated pickup date: March 18, 2025'),
                const SizedBox(height: 8),
                const Text(
                  'Your return is being processed. You will receive updates via notification.',
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Orange button color
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Could navigate to a detailed tracking page
                },
                child: const Text('View Details'),
              ),
            ],
          ),
    );
  }
}

// Data model for return items
class ReturnItem {
  final String id;
  final String name;
  final String price;
  final String status;
  final String date;
  final String image;

  ReturnItem({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
    required this.date,
    required this.image,
  });
}
