import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/clearable_input.dart';
import '../controller/user_controller.dart';

@RoutePage()
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late TextEditingController _usernameController;
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userAsyncValue = ref.read(userControllerProvider);
      userAsyncValue.whenData((user) {
        if (user != null) {
          _usernameController.text = user.username;
        }
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {
              context.router.back();
            },
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/default_avatar.png'),
                // Replace with actual user avatar
              ),
            ),
            const SizedBox(height: 20),
            ClearableInput(
              controller: _usernameController,
              hintText: 'Username',
            ),
            const SizedBox(height: 20),
            ClearableInput(
              controller: _bioController,
              hintText: 'Bio',
            ),
            // Add more profile fields as needed
          ],
        ),
      ),
    );
  }
}
