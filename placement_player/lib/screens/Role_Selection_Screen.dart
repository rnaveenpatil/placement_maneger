// lib/screens/role_selection_screen.dart
import 'package:flutter/material.dart';

import 'package:placement_player/screens/log_in/HOD_Faculty_Login.dart';
import 'package:placement_player/screens/log_in/Placement_Officer_Login.dart';
import 'package:placement_player/screens/log_in/Recruiter_Login.dart';
import 'package:placement_player/screens/log_in/Student_Login.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              // App Logo and Title
              const Icon(Icons.school_rounded, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'Campus Player',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your Gateway to Dream Career',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 60),
              // Role Selection Cards
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Login as',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Select your role to continue',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 30),

                          // Student Card
                          _buildRoleCard(
                            context,
                            icon: Icons.person_outline_rounded,
                            title: 'Student',
                            description:
                                'Access placement drives, apply for jobs',
                            color: Colors.blue,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentLoginScreen(),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 15),

                          // Placement Officer Card
                          _buildRoleCard(
                            context,
                            icon: Icons.work_outline_rounded,
                            title: 'Placement Officer',
                            description: 'Manage placements, monitor students',
                            color: Colors.green,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PlacementOfficerLoginScreen(),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 15),

                          // HOD Card
                          _buildRoleCard(
                            context,
                            icon: Icons.people_outline_rounded,
                            title: 'HOD / Faculty',
                            description: 'Monitor department placements',
                            color: Colors.orange,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HODLoginScreen(),
                                ),
                              );
                            },
                          ),

                          const SizedBox(height: 15),

                          // Recruiter Card
                          _buildRoleCard(
                            context,
                            icon: Icons.business_center_outlined,
                            title: 'Recruiter',
                            description: 'Post jobs, find candidates',
                            color: Colors.purple,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RecruiterLoginScreen(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20), // Added bottom padding
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[400],
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
