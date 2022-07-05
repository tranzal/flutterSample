import 'package:flutter/material.dart';

class ListSample extends StatelessWidget {
  const ListSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'tt',
                      style: TextStyle(fontSize: 24),
                    ),
                    const Text('ddddd'),
                  ],
                ),
                const Text(
                  '\$ 1000',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
