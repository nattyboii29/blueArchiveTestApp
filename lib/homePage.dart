import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Function(int) onNavigateTo;
  
  const HomePage({super.key, required this.onNavigateTo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome back, Sensei!',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                _buildNavButton(
                  context,
                  icon: Icons.person,
                  label: 'Profile',
                  onTap: () => onNavigateTo(1),
                ),
                _buildNavButton(
                  context,
                  icon: Icons.group,
                  label: 'Students',
                  onTap: () => onNavigateTo(2),
                ),
                _buildNavButton(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () => onNavigateTo(3),
                ),
                _buildNavButton(
                  context,
                  icon: Icons.info_outline,
                  label: 'About',
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('About page - Coming soon')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.blue[700],
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}