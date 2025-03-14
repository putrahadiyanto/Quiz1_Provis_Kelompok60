import 'package:flutter/material.dart';

class MonitorPesanan extends StatelessWidget {
  const MonitorPesanan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App Bar
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 15,
              left: 15,
              right: 15,
            ),
            color: const Color(0xFFFFBA00),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Detail Penyewaan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Ready For Pickup
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      'Pesanan Siap Dijemput',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Invoice and Date Details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // Left column - labels
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('No. Invoice'),
                            SizedBox(height: 5),
                            Text('Tanggal Sewa'),
                            SizedBox(height: 5),
                            Text('Tanggal Kembali'),
                          ],
                        ),
                        const SizedBox(width: 30),
                        // Right column - values
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'INV00532B20250322K451',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '10 Februari 2025',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '15 Februari 2025',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(thickness: 1, height: 30),

                  // Product Details Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Detail Produk',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Product Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Product Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/tenda.jpg',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            // Product Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tenda KingRunning',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: const [
                                      Text('5.0'),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  const Text('5 x 150.000'),
                                ],
                              ),
                            ),
                            // Rent Again Button
                            Container(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Color(0xFFFFBA00),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Sewa Lagi',
                                  style: TextStyle(
                                    color: Color(0xFFFFBA00),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Order Timeline
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Timeline(
                      events: [
                        TimelineEvent(
                          title: 'Pesanan siap diambil oleh customer',
                          dateTime: 'Selasa, 31 Februari 2025 06:52',
                          isActive: true,
                        ),
                        TimelineEvent(
                          title: 'Pesanan siap diambil oleh customer',
                          dateTime: 'Selasa, 31 Februari 2025 06:52',
                          isActive: false,
                        ),
                        TimelineEvent(
                          title: 'Pesanan siap diambil oleh customer',
                          dateTime: 'Selasa, 31 Februari 2025 06:52',
                          isActive: false,
                        ),
                        TimelineEvent(
                          title: 'Pesanan siap diambil oleh customer',
                          dateTime: 'Selasa, 31 Februari 2025 06:52',
                          isActive: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
            child: Row(
              children: [
                // Chat Button
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 50,
                  height: 50,
                  child: const Icon(Icons.chat_bubble_outline),
                ),
                const SizedBox(width: 10),
                // Cancel Order Button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Batal Pesanan',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Confirm Pickup Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFBA00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Konfirmasi Pengambilan',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
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
}

class Timeline extends StatelessWidget {
  final List<TimelineEvent> events;

  const Timeline({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        final isLast = index == events.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left column with dot and line
            Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        event.isActive
                            ? const Color(0xFFFFBA00)
                            : Colors.grey.shade300,
                  ),
                ),
                if (!isLast)
                  Container(width: 2, height: 55, color: Colors.grey.shade300),
              ],
            ),
            const SizedBox(width: 10),
            // Right column with text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontWeight:
                          event.isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    event.dateTime,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: isLast ? 0 : 40),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class TimelineEvent {
  final String title;
  final String dateTime;
  final bool isActive;

  TimelineEvent({
    required this.title,
    required this.dateTime,
    required this.isActive,
  });
}
