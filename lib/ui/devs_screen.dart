import 'package:flutter/material.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    

    return Scaffold(
      // backgroundColor: Theme.of(context).cardColor,
      
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          childrenPadding:
                              const EdgeInsets.all(16).copyWith(top: 0),
                          title: const Text('Acknowledgement',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          children: const [
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Alex Maina',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Software Dev,  Turing. Nairobi, KE.'),
                            ),
                            
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text('Lush Vine v 1.0.2')
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget MyBullet() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}