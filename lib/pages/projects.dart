import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  // Your real projects from your resume
  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Chest X-Ray Diagnosis AI',
      'tech': 'Python, PyTorch, DenseNet-121, Grad-CAM',
      'description': 'Multi-class classifier for COVID-19, pneumonia, lung opacity & normal scans. '
          'Hit 95.59% accuracy, reduced calibration error from 1.77% to 1.16%, and used Grad-CAM '
          'to catch shortcut-learning from scanner markers.',
      'icon': Icons.medical_services_outlined,
      'color': Color(0xFFE07A5F),
    },
    {
      'title': 'Human Action Recognition',
      'tech': 'Python, PyTorch, EfficientNet-V2-S',
      'description': '15-class action classifier that jumped from 43% baseline to 84.93%. '
          'Used MixUp, CutMix, and mixed-precision training. Built a corruption robustness benchmark '
          'that still scored 79.74% under messy real-world conditions.',
      'icon': Icons.directions_run_outlined,
      'color': Color(0xFF81B29A),
    },
    {
      'title': 'Medical Triage Agent',
      'tech': 'Python, Hugging Face API, Qwen 2.5, Docker',
      'description': 'Emergency-care triage bot that reads patient records, assigns urgency levels, '
          'and reasons clinically using Qwen 2.5 via Hugging Face Router API. Fully Dockerized.',
      'icon': Icons.chat_bubble_outline,
      'color': Color(0xFF3D405B),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
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
                    "Things I've Built ",
                    style: TextStyle(
                      fontSize: isDesktop ? 32 : 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3D405B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'A mix of deep learning research and practical AI applications.',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xFF3D405B).withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Render each project card
                  ...projects.map((p) => _buildProjectCard(p)),

                  const SizedBox(height: 32),

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

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Icon + Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (project['color'] as Color).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  project['icon'] as IconData,
                  color: project['color'] as Color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  project['title'] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D405B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Tech stack badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F1DE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              project['tech'] as String,
              style: TextStyle(
                fontSize: 12,
                color: const Color(0xFF3D405B).withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Description
          Text(
            project['description'] as String,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: const Color(0xFF3D405B).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}