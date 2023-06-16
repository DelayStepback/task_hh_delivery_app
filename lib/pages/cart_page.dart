import 'package:flutter/cupertino.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// Consumer<CartModel>
// (
// builder: (
// context2, value, child) {
// return Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// IconButton(onPressed: () => value.removeItemFromCart(value.indexLastWhere(itemName)), icon: Icon(Icons.remove)),
// Text(count, style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 16,
// ),),
// IconButton(onPressed: onPressed, icon: Icon(Icons.add)),
// ],
// );
// })