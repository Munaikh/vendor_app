import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:vendor_app/models/order/order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  // Creating Data
  Future<void> createOrder({required String name}) async {
    final docOrder = FirebaseFirestore.instance.collection('orders').doc();

    // final jsonData = {
    //   'name': name,
    //   'status': 'no',
    //   'createdAt': DateTime.now(),
    // };

    final orderObj = Order(
      id: docOrder.id,
      name: name,
      status: 'done',
      createdAt: DateTime.now(),
    );

    // Creating & writing
    await docOrder.set(orderObj.toJson());
  }

  // Reading Data
  Stream<List<Order>> readOrders() => FirebaseFirestore.instance
      .collection('orders')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (snapshot) =>
            snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textFieldController,
          ),
          actions: [
            IconButton(
              onPressed: () {
                createOrder(name: textFieldController.text);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: FirestoreListView<Order>(
          query: orderCollection.orderBy('createdAt', descending: true),
          itemBuilder: (context, snapshot) {
            final order = snapshot.data();

            return ListTile(
              title: Text(order.name),
              subtitle: Text(order.status),
            );
          },
        )

        // StreamBuilder<List<Order>>(
        //   stream: readOrders(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return const Center(child: Text('Something went wrong'));
        //     }

        //     if (snapshot.hasData) {
        //       final orders = snapshot.data!;

        //       return ListView.builder(
        //         itemCount: orders.length,
        //         itemBuilder: (context, index) {
        //           final order = orders[index];

        //           return ListTile(
        //             title: Text(order.name),
        //             subtitle: Text(order.status),
        //           );
        //         },
        //       );
        //     }

        //     return const CircularProgressIndicator();
        //   },
        // ),
        );
  }
}
