import 'package:flutter/material.dart';

class KeranjangScreen extends StatefulWidget {
  const KeranjangScreen({Key? key}) : super(key: key);

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  List<CartItem> cartItems = [
    CartItem(
      id: 1,
      name: "Tenda Kemah",
      price: 150000,
      image: "assets/tenda.jpg",
      quantity: 1,
      days: 1,
      isSelected: false,
    ),
    CartItem(
      id: 2,
      name: "Tenda Kemah",
      price: 150000,
      image: "assets/tenda.jpg",
      quantity: 1,
      days: 1,
      isSelected: false,
    ),
    CartItem(
      id: 3,
      name: "Tenda Kemah",
      price: 150000,
      image: "assets/tenda.jpg",
      quantity: 1,
      days: 1,
      isSelected: false,
    ),
  ];

  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFBA00), // Yellow color from the image
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Keranjangmu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  cartItem: cartItems[index],
                  onItemSelected: (selected) {
                    setState(() {
                      cartItems[index].isSelected = selected;
                      _updateSelectAll();
                    });
                  },
                  onQuantityChanged: (quantity) {
                    setState(() {
                      cartItems[index].quantity = quantity;
                    });
                  },
                  onDaysChanged: (days) {
                    setState(() {
                      cartItems[index].days = days;
                    });
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                Checkbox(
                  value: selectAll,
                  onChanged: (value) {
                    setState(() {
                      selectAll = value ?? false;
                      for (var item in cartItems) {
                        item.isSelected = selectAll;
                      }
                    });
                  },
                  activeColor: const Color(0xFFFFBA00),
                ),
                const Text(
                  'Semua',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle rental logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFBA00),
                    minimumSize: const Size(100, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Sewa',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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

  void _updateSelectAll() {
    bool allSelected = cartItems.every((item) => item.isSelected);
    if (selectAll != allSelected) {
      setState(() {
        selectAll = allSelected;
      });
    }
  }
}

class CartItem {
  final int id;
  final String name;
  final int price;
  final String image;
  int quantity;
  int days;
  bool isSelected;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
    required this.days,
    required this.isSelected,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final Function(bool) onItemSelected;
  final Function(int) onQuantityChanged;
  final Function(int) onDaysChanged;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.onItemSelected,
    required this.onQuantityChanged,
    required this.onDaysChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: cartItem.isSelected,
            onChanged: (value) => onItemSelected(value ?? false),
            activeColor: const Color(0xFFFFBA00),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              cartItem.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {},
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Rp ${cartItem.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Jumlah Produk'),
                    const Spacer(),
                    QuantitySelector(
                      value: cartItem.quantity,
                      onChanged: onQuantityChanged,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Jumlah Hari'),
                    const Spacer(),
                    QuantitySelector(
                      value: cartItem.days,
                      onChanged: onDaysChanged,
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

class QuantitySelector extends StatelessWidget {
  final int value;
  final Function(int) onChanged;

  const QuantitySelector({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (value > 1) {
              onChanged(value - 1);
            }
          },
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(4),
              ),
            ),
            child: const Icon(Icons.remove, size: 16),
          ),
        ),
        Container(
          width: 40,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade400),
              bottom: BorderSide(color: Colors.grey.shade400),
            ),
          ),
          child: Text(value.toString(), style: const TextStyle(fontSize: 14)),
        ),
        InkWell(
          onTap: () {
            onChanged(value + 1);
          },
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(4),
              ),
            ),
            child: const Icon(Icons.add, size: 16),
          ),
        ),
      ],
    );
  }
}
