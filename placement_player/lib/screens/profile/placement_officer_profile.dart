// lib/screens/profiles/placement_officer_profile.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PlacementOfficerProfileScreen extends StatefulWidget {
  const PlacementOfficerProfileScreen({Key? key}) : super(key: key);

  @override
  State<PlacementOfficerProfileScreen> createState() =>
      _PlacementOfficerProfileScreenState();
}

class _PlacementOfficerProfileScreenState
    extends State<PlacementOfficerProfileScreen> {
  File? _profileImage;
  bool _isEditing = false;
  bool _isLoading = false;

  // Personal Information Controllers
  final _fullNameController = TextEditingController(text: 'Dr. Rajesh Kumar');
  final _emailController = TextEditingController(text: 'placement@college.edu');
  final _employeeIdController = TextEditingController(text: 'P0O2024001');
  final _phoneController = TextEditingController(text: '+91 9876543210');
  final _alternatePhoneController = TextEditingController(
    text: '+91 8765432109',
  );
  final _dobController = TextEditingController(text: '15-05-1980');

  // Professional Information
  final _collegeController = TextEditingController(
    text: 'MS Ramaiah Institute of Technology',
  );
  final _departmentController = TextEditingController(
    text: 'Training & Placement',
  );
  final _designationController = TextEditingController(
    text: 'Senior Placement Officer',
  );
  final _experienceController = TextEditingController(text: '12 years');
  final _qualificationController = TextEditingController(
    text: 'Ph.D in Computer Science',
  );
  final _officeAddressController = TextEditingController(
    text: 'Placement Office, Main Building',
  );
  final _cabinNumberController = TextEditingController(text: 'Room No. 105');

  // Additional Info
  final _linkedinController = TextEditingController(
    text: 'linkedin.com/in/rajeshkumar',
  );
  final _officeHoursController = TextEditingController(
    text: '10:00 AM - 5:00 PM',
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
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Placement Officer Profile',
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
                          border: Border.all(color: Colors.green, width: 3),
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
                                color: Colors.green,
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
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _designationController.text,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Personal Information Card
                  _buildInfoCard(
                    title: 'Personal Information',
                    icon: Icons.person_outline,
                    color: Colors.green,
                    children: [
                      _buildInfoRow(
                        'Full Name',
                        _fullNameController,
                        Icons.person,
                      ),
                      _buildInfoRow('Email', _emailController, Icons.email),
                      _buildInfoRow(
                        'Employee ID',
                        _employeeIdController,
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
                    icon: Icons.work_outline,
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
                        'Office Hours',
                        _officeHoursController,
                        Icons.access_time,
                      ),
                      _buildInfoRow(
                        'Office Address',
                        _officeAddressController,
                        Icons.location_on,
                      ),
                      _buildInfoRow(
                        'Cabin Number',
                        _cabinNumberController,
                        Icons.meeting_room,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Statistics Card
                  _buildStatisticsCard(),

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
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Recent Activity Card
                  _buildRecentActivityCard(),

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

  Widget _buildStatisticsCard() {
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
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.analytics_outlined,
                    color: Colors.orange,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Placement Statistics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total Students', '2,500', Icons.people),
                _buildStatItem('Placed', '1,850', Icons.work),
                _buildStatItem('Companies', '120', Icons.business),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Highest Package', '45 LPA', Icons.trending_up),
                _buildStatItem('Average', '8.5 LPA', Icons.show_chart),
                _buildStatItem('This Year', '650', Icons.event),
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
        Icon(icon, color: Colors.green, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildRecentActivityCard() {
    List<Map<String, dynamic>> activities = [
      {
        'title': 'New company registered',
        'subtitle': 'Google',
        'time': '2 hours ago',
        'icon': Icons.business,
      },
      {
        'title': 'Student placed',
        'subtitle': 'John Doe at Microsoft',
        'time': '5 hours ago',
        'icon': Icons.school,
      },
      {
        'title': 'Drive scheduled',
        'subtitle': 'Amazon - 25 students',
        'time': '1 day ago',
        'icon': Icons.event,
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
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Recent Activity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final activity = activities[index];
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      activity['icon'],
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                  title: Text(activity['title']),
                  subtitle: Text(activity['subtitle']),
                  trailing: Text(
                    activity['time'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
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
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _employeeIdController.dispose();
    _phoneController.dispose();
    _alternatePhoneController.dispose();
    _dobController.dispose();
    _collegeController.dispose();
    _departmentController.dispose();
    _designationController.dispose();
    _experienceController.dispose();
    _qualificationController.dispose();
    _officeAddressController.dispose();
    _cabinNumberController.dispose();
    _linkedinController.dispose();
    _officeHoursController.dispose();
    super.dispose();
  }
}
