import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int lastIndex = profiles.length;
      profiles.add(
        Profile(
          id: lastIndex + 1,
          name: "GusArya ${lastIndex + 1}",
          nim: "04",
          bio: "Web Developer",
          phone: "085807191",
        ),
      );
    });
  }

  void deleteitem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Profile')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Dismissible(
            key: Key(profile.name),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteitem(index);
              Fluttertoast.showToast(msg: "${deletedItem.name} dihapus");
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg',
                ),
              ),
              title: Text(profile.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIM: ${profile.nim}"), // <-- Tambahkan baris ini
                  Text(profile.bio),
                  SizedBox(height: 4),
                  Text(
                    "Phone: ${profile.phone}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProfile(profile: profile),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              addItem();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              if (profiles.isNotEmpty) {
                deleteitem(profiles.length - 1);
              }
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
