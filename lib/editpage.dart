import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _mobileNoController;
  late TextEditingController _emailController;
  late TextEditingController _bioController;

  String profilePicUrl = '';

  @override
  void initState() {
    super.initState();
    _loadCurrentUserData();
  }

  void _loadCurrentUserData() {
    User? user = FirebaseAuth.instance.currentUser;

    String displayName = user?.displayName ?? '';
    List<String> nameParts = displayName.split(' ');

    _firstNameController =
        TextEditingController(text: nameParts.isNotEmpty ? nameParts.first : '');
    _lastNameController =
        TextEditingController(text: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '');
    _mobileNoController = TextEditingController(text: ''); // Add if stored elsewhere
    _emailController = TextEditingController(text: user?.email ?? '');
    _bioController = TextEditingController(text: ''); // Add if stored elsewhere
    profilePicUrl = user?.photoURL ?? '';
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileNoController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Profile Updated!\n'
          'Name: ${_firstNameController.text} ${_lastNameController.text}\n'
          'Mobile: +91 ${_mobileNoController.text}\n'
          'Email: ${_emailController.text}\n'
          'Bio: ${_bioController.text}',
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF2C2C34),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.blue, width: 1.5),
      ),
      labelStyle: TextStyle(color: Colors.white70),
      hintStyle: TextStyle(color: Colors.white54),
      contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      profilePicUrl.isNotEmpty ? NetworkImage(profilePicUrl) : null,
                  child: profilePicUrl.isEmpty
                      ? const Icon(Icons.person, size: 60)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // First Name Field
            Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: inputDecorationTheme),
              child: TextField(
                controller: _firstNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
            ),
            const SizedBox(height: 15),

            // Last Name Field
            Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: inputDecorationTheme),
              child: TextField(
                controller: _lastNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
            ),
            const SizedBox(height: 15),

            // Mobile Number Field
            Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: inputDecorationTheme),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: inputDecorationTheme.fillColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: '+91',
                        dropdownColor: inputDecorationTheme.fillColor,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.white70),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                        onChanged: (String? newValue) {},
                        items: <String>['+91', '+1', '+44', '+81']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _mobileNoController,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration:
                          const InputDecoration(labelText: 'Mobile No'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Email Field (read-only)
            Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: inputDecorationTheme),
              child: TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            const SizedBox(height: 15),

            // Bio Field
            Theme(
              data: Theme.of(context).copyWith(
                  inputDecorationTheme: inputDecorationTheme),
              child: TextField(
                controller: _bioController,
                style: const TextStyle(color: Colors.white),
                minLines: 1,
                maxLines: 2,
                decoration: const InputDecoration(labelText: 'A short bio'),
              ),
            ),
            const SizedBox(height: 30),

            // Update Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Update profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
