import 'package:flutter/material.dart';

class DetailProfile extends StatefulWidget {
  final String nama;
  final int angka;

  const DetailProfile({super.key, required this.nama, required this.angka});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  late String nama;
  var isChanged = false;
  @override
  void initState() {
    super.initState();
    nama = widget.nama;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Profile'),
        backgroundColor: const Color.fromARGB(255, 233, 230, 230),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// COVER PHOTO + PROFILE (STACK)
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [

                  /// Background / Cover Photo
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/tokyo_walpaper.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  /// Profile Image (Circle Avatar)
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://cdn.marvel.com/content/2x/ironman_lob_mas_hlf_02_0.jpg',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// TEXT
            Text(
              nama,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(
              '2415354004',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 8),
            Text(
              'Counter saat ini: ${widget.angka}',
              style: const TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doLorem ipsum dolor sit amet, consectetur adipiscing elit Lorem ipsum doipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, consectetur adipiscing elit',
                textAlign: TextAlign.justify,
              ),
            ),

            SizedBox(height: 32),

            /// BUTTON UBAH NAMA
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isChanged = !isChanged;
                  nama = isChanged
                      ? 'Arya'
                      : 'I Gusti Bagus Arya Pratyusa Putra Dinata';
                });
              },
              child: Text('Klik Saya'),
            ),

            SizedBox(height: 16),

            /// BUTTON KEMBALI (NAVIGATOR.POP)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}