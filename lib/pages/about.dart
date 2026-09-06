import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: const Color(0xFFF4F1DE),
        elevation: 0,
        foregroundColor: const Color(0xFF3D405B),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey there!',
                    style: TextStyle(
                      fontSize: isDesktop ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D405B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "I'm Vineela, a Computer Science undergrad at C.R. Rao AIMSCS, Hyderabad. "
                    "I'm passionate about building intelligent systems that actually help people and building practical solutions. "
                    "I enjoy exploring deep learning, experimenting with new technologies, and turning ideas into meaningful projects.",
                    style: TextStyle(
                      fontSize: isDesktop ? 18 : 16,
                      height: 1.6,
                      color: const Color(0xFF3D405B).withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Skills
                  Text(
                    'What I work with',
                    style: TextStyle(
                      fontSize: isDesktop ? 24 : 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D405B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _skillChip('Python'),
                      _skillChip('PyTorch'),
                      _skillChip('Computer Vision'),
                      _skillChip('Deep Learning'),
                      _skillChip('NLP'),
                      _skillChip('Generative AI'),
                      _skillChip('FastAPI'),
                      _skillChip('Docker'),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Education
                  Text(
                    'Education',
                    style: TextStyle(
                      fontSize: isDesktop ? 24 : 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D405B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _eduCard(
                    'B.Tech, Computer Science',
                    'C.R. Rao AIMSCS, Hyderabad',
                    '2024 – 2028 (Expected) • CGPA: 9.78 / 9.95 / 9.7',
                  ),
                  const SizedBox(height: 12),
                  _eduCard(
                    'Intermediate (SSC)',
                    'FIITJEE Junior College, Hyderabad',
                    '2022 – 2024 • 97.7%',
                  ),
                  

          
                  

                  const SizedBox(height: 32),

                  // Back button
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back to Home'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        backgroundColor: const Color(0xFF3D405B),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper for skill chips
  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFE07A5F).withOpacity(0.15),
      labelStyle: const TextStyle(
        color: Color(0xFF3D405B),
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  // Helper for education cards
  Widget _eduCard(String title, String subtitle, String detail) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D405B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: const Color(0xFF3D405B).withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            detail,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF81B29A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}