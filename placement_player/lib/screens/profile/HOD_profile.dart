// lib/screens/profiles/hod_profile.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HODProfileScreen extends StatefulWidget {
  const HODProfileScreen({Key? key}) : super(key: key);

  @override
  State<HODProfileScreen> createState() => _HODProfileScreenState();
}

class _HODProfileScreenState extends State<HODProfileScreen> {
  File? _profileImage;
  bool _isEditing = false;
  bool _isLoading = false;

  // Personal Information Controllers
  final _fullNameController = TextEditingController(text: 'Dr. Priya Sharma');
  final _emailController = TextEditingController(text: 'hod.cse@college.edu');
  final _facultyIdController = TextEditingController(text: 'FAC2024001');
  final _phoneController = TextEditingController(text: '+91 9876543210');
  final _alternatePhoneController = TextEditingController(
    text: '+91 8765432109',
  );
  final _dobController = TextEditingController(text: '15-05-1975');

  // Professional Information
  final _collegeController = TextEditingController(
    text: 'MS Ramaiah Institute of Technology',
  );
  final _departmentController = TextEditingController(
    text: 'Computer Science Engineering',
  );
  final _designationController = TextEditingController(text: 'Professor & HOD');
  final _experienceController = TextEditingController(text: '18 years');
  final _qualificationController = TextEditingController(
    text: 'Ph.D in Computer Science, IIT Delhi',
  );
  final _specializationController = TextEditingController(
    text: 'Artificial Intelligence, Machine Learning',
  );
  final _cabinNumberController = TextEditingController(
    text: 'Room No. 201, Academic Block',
  );
  final _researchAreaController = TextEditingController(
    text: 'Deep Learning, Computer Vision',
  );

  // Additional Info
  final _linkedinController = TextEditingController(
    text: 'linkedin.com/in/priyasharma',
  );
  final _googleScholarController = TextEditingController(
    text: 'scholar.google.com/priyasharma',
  );
  final _officeHoursController = TextEditingController(
    text: '11:00 AM - 4:00 PM',
  );

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
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          'HOD Profile',
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
                          border: Border.all(color: Colors.orange, width: 3),
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
                                color: Colors.orange,
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

                  // Name and Designation
                  Text(
                    _fullNameController.text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _designationController.text,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.orange[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Personal Information Card
                  _buildInfoCard(
                    title: 'Personal Information',
                    icon: Icons.person_outline,
                    color: Colors.orange,
                    children: [
                      _buildInfoRow(
                        'Full Name',
                        _fullNameController,
                        Icons.person,
                      ),
                      _buildInfoRow('Email', _emailController, Icons.email),
                      _buildInfoRow(
                        'Faculty ID',
                        _facultyIdController,
                        Icons.badge,
                      ),
                      _buildInfoRow('Phone', _phoneController, Icons.phone),
                      _buildInfoRow(
                        'Alternate Phone',
                        _alternatePhoneController,
                        Icons.phone_android,
                      ),
                      _buildInfoRow(
                        'Date of Birth',
                        _dobController,
                        Icons.cake,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Professional Information Card
                  _buildInfoCard(
                    title: 'Professional Information',
                    icon: Icons.school_outlined,
                    color: Colors.blue,
                    children: [
                      _buildInfoRow(
                        'College',
                        _collegeController,
                        Icons.location_city,
                      ),
                      _buildInfoRow(
                        'Department',
                        _departmentController,
                        Icons.account_tree,
                      ),
                      _buildInfoRow(
                        'Designation',
                        _designationController,
                        Icons.work,
                      ),
                      _buildInfoRow(
                        'Experience',
                        _experienceController,
                        Icons.timeline,
                      ),
                      _buildInfoRow(
                        'Qualification',
                        _qualificationController,
                        Icons.school,
                      ),
                      _buildInfoRow(
                        'Specialization',
                        _specializationController,
                        Icons.star,
                      ),
                      _buildInfoRow(
                        'Research Area',
                        _researchAreaController,
                        Icons.science,
                      ),
                      _buildInfoRow(
                        'Office Hours',
                        _officeHoursController,
                        Icons.access_time,
                      ),
                      _buildInfoRow(
                        'Cabin',
                        _cabinNumberController,
                        Icons.meeting_room,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Department Statistics Card
                  _buildDepartmentStatsCard(),

                  const SizedBox(height: 16),

                  // Publications Card
                  _buildPublicationsCard(),

                  const SizedBox(height: 16),

                  // Professional Links
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
                      _buildInfoRow(
                        'Google Scholar',
                        _googleScholarController,
                        Icons.school,
                      ),
                    ],
                  ),

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
    IconData icon,
  ) {
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

  Widget _buildDepartmentStatsCard() {
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
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.analytics_outlined,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Department Statistics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Students', '450', Icons.people),
                _buildStatItem('Faculty', '25', Icons.person),
                _buildStatItem('Placed', '380', Icons.work),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Placement %', '84%', Icons.percent),
                _buildStatItem('Avg Package', '12 LPA', Icons.attach_money),
                _buildStatItem('Research', '45', Icons.science),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildPublicationsCard() {
    List<Map<String, String>> publications = [
      {
        'title': 'Deep Learning for Image Recognition',
        'journal': 'IEEE Transactions',
        'year': '2023',
      },
      {'title': 'AI in Education', 'journal': 'Springer', 'year': '2022'},
      {
        'title': 'Machine Learning Algorithms',
        'journal': 'Elsevier',
        'year': '2021',
      },
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
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.menu_book_outlined,
                        color: Colors.purple,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Recent Publications',
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
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: publications.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final pub = publications[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange.withOpacity(0.1),
                    child: Text('${index + 1}'),
                  ),
                  title: Text(pub['title']!),
                  subtitle: Text('${pub['journal']} - ${pub['year']}'),
                );
              },
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

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
        _isEditing = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Colors.orange,
        ),
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _facultyIdController.dispose();
    _phoneController.dispose();
    _alternatePhoneController.dispose();
    _dobController.dispose();
    _collegeController.dispose();
    _departmentController.dispose();
    _designationController.dispose();
    _experienceController.dispose();
    _qualificationController.dispose();
    _specializationController.dispose();
    _cabinNumberController.dispose();
    _researchAreaController.dispose();
    _linkedinController.dispose();
    _googleScholarController.dispose();
    _officeHoursController.dispose();
    super.dispose();
  }
}
