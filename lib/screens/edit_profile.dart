import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _phone04Controller;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _bioController = TextEditingController(text: widget.profile.bio);
    _phone04Controller = TextEditingController(text: widget.profile.phone04);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _phone04Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
              ),
              TextFormField(
                controller: _phone04Controller,
                decoration: InputDecoration(labelText: 'Phone04'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final updatedProfile = Profile(
                      name: _nameController.text,
                      bio: _bioController.text,
                      phone04: _phone04Controller.text,
                      id: widget.profile.id,
                    );
                    Navigator.pop(context, updatedProfile);
                  }
                }, child: Text('Simpan')),
            ],
          ),
        ),
      ),
    );
  }
}