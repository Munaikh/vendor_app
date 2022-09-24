import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/models/account.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  // Read signle document
  Future<Account?> getUserName() async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(
          FirebaseAuth.instance.currentUser!.uid,
        );

    final snapshot = await docUser.get();

    if (snapshot.exists) {
      return Account.fromMap(snapshot.data()!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Screen'),
          actions: [
            // Updating
            IconButton(
              onPressed: () async {
                final docUser = FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid);
                await docUser.update({
                  'name': 'Dhari2',
                });
              },
              icon: const Icon(Icons.cake),
            )
          ],
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              var output = snapshot.data!.data();
              final data = Account.fromMap(output!);

              // var value = output!['name']; // <-- Your value
              return Center(child: Text('Value = ${data.name}'));
            }

            return const Center(child: CircularProgressIndicator());
          },
        )

        // FutureBuilder<Account?>(
        //   future: getUserName(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) {
        //       return const Text('Something went wrong');
        //     }

        //     if (snapshot.hasData) {
        //       final data = snapshot.data;

        //       return data == null
        //           ? const Text('No Data')
        //           : Center(
        //               child: Text(data.name),
        //             );
        //     }

        //     return const Center(child: CircularProgressIndicator());
        //   },
        // ),
        );
  }
}
