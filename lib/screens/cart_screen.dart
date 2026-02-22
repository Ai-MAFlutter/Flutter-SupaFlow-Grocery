import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFF7FDF8),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty 🛒', style: TextStyle(fontSize: 16, color: Colors.grey)))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (ctx, i) {
                        final item = cart.items[i];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: item.imageUrl.isNotEmpty
                                ? Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                                : const Icon(Icons.fastfood, color: Colors.green),
                            title: Text(item.name),
                            subtitle: Text('${item.price.toStringAsFixed(2)} EGP'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => context.read<CartProvider>().removeItem(item),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total: ${cart.totalPrice.toStringAsFixed(2)} EGP', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Checkout complete! 🎉')));
                            context.read<CartProvider>().clearCart();
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: const Text('Checkout'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
