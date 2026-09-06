import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive check: desktop vs mobile
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            // Prevents content from stretching too wide on big screens
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),

                  // Profile pic with soft shadow
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 80,
                      // TODO: Replace with your LinkedIn/profile pic URL
                      backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?name=Vineela+Akella&size=200',
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Name
                  Text(
                    'Vineela Akella',
                    style: TextStyle(
                      fontSize: isDesktop ? 42 : 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D405B),
                      letterSpacing: -0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  // Designation
                  Text(
                    'CS Undergrad • AI/ML Enthusiast ',
                    style: TextStyle(
                      fontSize: isDesktop ? 18 : 16,
                      color: const Color(0xFF3D405B).withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Fun tagline badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF81B29A).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Building things that matter ',
                      style: TextStyle(
                        color: Color(0xFF3D405B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Navigation buttons
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/about'),
                        icon: const Icon(Icons.person_outline),
                        label: const Text('About Me'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          backgroundColor: const Color(0xFFE07A5F),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/projects'),
                        icon: const Icon(Icons.folder_open_outlined),
                        label: const Text('My Projects'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          backgroundColor: const Color(0xFF3D405B),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // Footer
                  Text(
                    'Made with curiosity ',
                    style: TextStyle(
                      color: const Color(0xFF3D405B).withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}