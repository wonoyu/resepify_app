import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("Your bookmarks"),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 16.0),
                itemCount: 10,
                itemBuilder: (context, index) => const ListTile(
                      leading: Icon(Icons.cake_outlined),
                      title: Text("Cheesecake"),
                      subtitle: Text("Dessert"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )),
          )
        ],
      ),
    );
  }
}
