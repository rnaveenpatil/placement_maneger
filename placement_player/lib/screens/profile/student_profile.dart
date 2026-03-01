// lib/screens/profiles/student_profile.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  File? _profileImage;
  bool _isEditing = false;
  bool _isLoading = false;

  // Personal Information Controllers
  final _fullNameController = TextEditingController(text: 'John Doe');
  final _emailController = TextEditingController(text: 'john.doe@college.edu');
  final _usnController = TextEditingController(text: '1MS20CS001');
  final _phoneController = TextEditingController(text: '+91 9876543210');
  final _dobController = TextEditingController(text: '15-05-2002');
  final _addressController = TextEditingController(
    text: 'Bangalore, Karnataka',
  );

  // Academic Information Controllers
  final _collegeController = TextEditingController(
    text: 'MS Ramaiah Institute of Technology',
  );
  final _courseController = TextEditingController(text: 'B.Tech');
  final _branchController = TextEditingController(text: 'Computer Science');
  final _currentYearController = TextEditingController(text: '4th Year');
  final _currentSemesterController = TextEditingController(text: 'Semester 8');
  final _cgpaController = TextEditingController(text: '8.75');
  final _backlogsController = TextEditingController(text: '0');

  // Additional Info
  final _linkedinController = TextEditingController(
    text: 'linkedin.com/in/johndoe',
  );
  final _githubController = TextEditingController(text: 'github.com/johndoe');
  final _portfolioController = TextEditingController(text: 'johndoe.com');

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            color: Colors.white,
            onPressed: () {
              if (_isEditing) {
                _saveProfile();
              } else {
                setState(() {
                  _isEditing = true;
                });
              }
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Profile Picture Section
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3),
                          image: DecorationImage(
                            image: _profileImage != null
                                ? FileImage(_profileImage!)
                                : const NetworkImage(
                                        'https://via.placeholder.com/150',
                                      )
                                      as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (_isEditing)
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Student Name and Basic Info
                  Text(
                    _fullNameController.text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _usnController.text,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),

                  const SizedBox(height: 24),

                  // Personal Information Card
                  _buildInfoCard(
                    title: 'Personal Information',
                    icon: Icons.person_outline,
                    color: Colors.blue,
                    children: [
                      _buildInfoRow(
                        'Full Name',
                        _fullNameController,
                        Icons.person,
                      ),
                      _buildInfoRow('Email', _emailController, Icons.email),
                      _buildInfoRow('USN', _usnController, Icons.numbers),
                      _buildInfoRow('Phone', _phoneController, Icons.phone),
                      _buildInfoRow(
                        'Date of Birth',
                        _dobController,
                        Icons.cake,
                      ),
                      _buildInfoRow(
                        'Address',
                        _addressController,
                        Icons.location_on,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Academic Information Card
                  _buildInfoCard(
                    title: 'Academic Information',
                    icon: Icons.school_outlined,
                    color: Colors.green,
                    children: [
                      _buildInfoRow(
                        'College',
                        _collegeController,
                        Icons.location_city,
                      ),
                      _buildInfoRow('Course', _courseController, Icons.book),
                      _buildInfoRow(
                        'Branch',
                        _branchController,
                        Icons.account_tree,
                      ),
                      _buildInfoRow(
                        'Current Year',
                        _currentYearController,
                        Icons.calendar_today,
                      ),
                      _buildInfoRow(
                        'Semester',
                        _currentSemesterController,
                        Icons.bookmark,
                      ),
                      _buildInfoRow(
                        'CGPA',
                        _cgpaController,
                        Icons.star,
                        isNumber: true,
                      ),
                      _buildInfoRow(
                        'Backlogs',
                        _backlogsController,
                        Icons.warning,
                        isNumber: true,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Professional Links Card
                  _buildInfoCard(
                    title: 'Professional Links',
                    icon: Icons.link_outlined,
                    color: Colors.purple,
                    children: [
                      _buildInfoRow(
                        'LinkedIn',
                        _linkedinController,
                        Icons.link,
                      ),
                      _buildInfoRow('GitHub', _githubController, Icons.code),
                      _buildInfoRow(
                        'Portfolio',
                        _portfolioController,
                        Icons.web,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Skills Section
                  _buildSkillsSection(),

                  const SizedBox(height: 16),

                  // Resume Section
                  _buildResumeSection(),

                  const SizedBox(height: 20),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    String label,
    TextEditingController controller,
    IconData icon, {
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 2),
                _isEditing
                    ? TextFormField(
                        controller: controller,
                        keyboardType: isNumber
                            ? TextInputType.number
                            : TextInputType.text,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      )
                    : Text(
                        controller.text,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    List<String> skills = [
      'Flutter',
      'Dart',
      'Java',
      'Python',
      'JavaScript',
      'React',
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.code_outlined,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Skills',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (_isEditing)
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
              ],
            ),
            const Divider(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills.map((skill) {
                return Chip(
                  label: Text(skill),
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  deleteIcon: _isEditing
                      ? const Icon(Icons.close, size: 16)
                      : null,
                  onDeleted: _isEditing ? () {} : null,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResumeSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.description_outlined,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Resume',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (_isEditing)
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload'),
                  ),
              ],
            ),
            const Divider(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: Colors.red, size: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John_Doe_Resume.pdf',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Updated: 15 Jan 2024',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.visibility_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.download_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProfile() {
    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _usnController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _collegeController.dispose();
    _courseController.dispose();
    _branchController.dispose();
    _currentYearController.dispose();
    _currentSemesterController.dispose();
    _cgpaController.dispose();
    _backlogsController.dispose();
    _linkedinController.dispose();
    _githubController.dispose();
    _portfolioController.dispose();
    super.dispose();
  }
}
