// lib/screens/profiles/recruiter_profile.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RecruiterProfileScreen extends StatefulWidget {
  const RecruiterProfileScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterProfileScreen> createState() => _RecruiterProfileScreenState();
}

class _RecruiterProfileScreenState extends State<RecruiterProfileScreen> {
  File? _profileImage;
  File? _companyLogo;
  bool _isEditing = false;
  bool _isLoading = false;

  // Personal Information Controllers
  final _fullNameController = TextEditingController(text: 'Amit Patel');
  final _emailController = TextEditingController(text: 'amit.patel@google.com');
  final _phoneController = TextEditingController(text: '+91 9876543210');
  final _designationController = TextEditingController(text: 'HR Manager');
  final _departmentController = TextEditingController(
    text: 'Talent Acquisition',
  );

  // Company Information Controllers
  final _companyNameController = TextEditingController(text: 'Google India');
  final _companyWebsiteController = TextEditingController(
    text: 'https://www.google.com',
  );
  final _industryController = TextEditingController(
    text: 'Information Technology',
  );
  final _companySizeController = TextEditingController(text: '10,000+');
  final _headquartersController = TextEditingController(
    text: 'Mountain View, California',
  );
  final _indiaOfficeController = TextEditingController(
    text: 'Bangalore, Karnataka',
  );
  final _gstNumberController = TextEditingController(text: '27AAACG1234A1Z5');
  final _companyDescriptionController = TextEditingController(
    text:
        'Google is an American multinational technology company specializing in Internet-related services and products.',
  );

  // Contact Information
  final _hrContactController = TextEditingController(text: '+91 9876543210');
  final _hrEmailController = TextEditingController(text: 'hr-india@google.com');
  final _recruitmentHeadController = TextEditingController(text: 'Priya Singh');

  // Social Links
  final _linkedinController = TextEditingController(
    text: 'linkedin.com/company/google',
  );
  final _twitterController = TextEditingController(text: 'twitter.com/google');
  final _facebookController = TextEditingController(
    text: 'facebook.com/google',
  );

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(File? target) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (target == _profileImage) {
          _profileImage = File(image.path);
        } else {
          _companyLogo = File(image.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: const Text(
          'Company Profile',
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
                  // Company Logo Section
                  Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.purple, width: 3),
                          image: DecorationImage(
                            image: _companyLogo != null
                                ? FileImage(_companyLogo!)
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
                            onTap: () => _pickImage(_companyLogo),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.purple,
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

                  // Company Name and Industry
                  Text(
                    _companyNameController.text,
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
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _industryController.text,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.purple[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Recruiter Information Card
                  _buildInfoCard(
                    title: 'Recruiter Information',
                    icon: Icons.person_outline,
                    color: Colors.purple,
                    children: [
                      _buildInfoRow(
                        'Full Name',
                        _fullNameController,
                        Icons.person,
                      ),
                      _buildInfoRow('Email', _emailController, Icons.email),
                      _buildInfoRow('Phone', _phoneController, Icons.phone),
                      _buildInfoRow(
                        'Designation',
                        _designationController,
                        Icons.work,
                      ),
                      _buildInfoRow(
                        'Department',
                        _departmentController,
                        Icons.account_tree,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Company Information Card
                  _buildInfoCard(
                    title: 'Company Information',
                    icon: Icons.business_outlined,
                    color: Colors.blue,
                    children: [
                      _buildInfoRow(
                        'Company Name',
                        _companyNameController,
                        Icons.business,
                      ),
                      _buildInfoRow(
                        'Website',
                        _companyWebsiteController,
                        Icons.language,
                      ),
                      _buildInfoRow(
                        'Industry',
                        _industryController,
                        Icons.category,
                      ),
                      _buildInfoRow(
                        'Company Size',
                        _companySizeController,
                        Icons.people,
                      ),
                      _buildInfoRow(
                        'Headquarters',
                        _headquartersController,
                        Icons.location_city,
                      ),
                      _buildInfoRow(
                        'India Office',
                        _indiaOfficeController,
                        Icons.location_on,
                      ),
                      _buildInfoRow(
                        'GST Number',
                        _gstNumberController,
                        Icons.receipt,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Company Description Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                                  Icons.description_outlined,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'About Company',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          _isEditing
                              ? TextFormField(
                                  controller: _companyDescriptionController,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                )
                              : Text(
                                  _companyDescriptionController.text,
                                  style: const TextStyle(fontSize: 14),
                                ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Contact Information Card
                  _buildInfoCard(
                    title: 'Contact Information',
                    icon: Icons.contact_phone_outlined,
                    color: Colors.orange,
                    children: [
                      _buildInfoRow(
                        'HR Contact',
                        _hrContactController,
                        Icons.phone,
                      ),
                      _buildInfoRow(
                        'HR Email',
                        _hrEmailController,
                        Icons.email,
                      ),
                      _buildInfoRow(
                        'Recruitment Head',
                        _recruitmentHeadController,
                        Icons.person,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Social Links Card
                  _buildInfoCard(
                    title: 'Social Media',
                    icon: Icons.share_outlined,
                    color: Colors.red,
                    children: [
                      _buildInfoRow(
                        'LinkedIn',
                        _linkedinController,
                        Icons.link,
                      ),
                      _buildInfoRow('Twitter', _twitterController, Icons.link),
                      _buildInfoRow(
                        'Facebook',
                        _facebookController,
                        Icons.link,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Hiring Statistics Card
                  _buildHiringStatsCard(),

                  const SizedBox(height: 16),

                  // Current Openings Card
                  _buildCurrentOpeningsCard(),

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

  Widget _buildHiringStatsCard() {
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
                    Icons.analytics_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Hiring Statistics',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total Hired', '250', Icons.people),
                _buildStatItem('This Year', '45', Icons.event),
                _buildStatItem('Openings', '12', Icons.work),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Avg Package', '25 LPA', Icons.attach_money),
                _buildStatItem('Campuses', '15', Icons.school),
                _buildStatItem('Drive Done', '8', Icons.calendar_today),
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
        Icon(icon, color: Colors.purple, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildCurrentOpeningsCard() {
    List<Map<String, String>> openings = [
      {
        'role': 'Software Engineer',
        'positions': '10',
        'location': 'Bangalore',
        'package': '25 LPA',
      },
      {
        'role': 'Product Manager',
        'positions': '3',
        'location': 'Hyderabad',
        'package': '30 LPA',
      },
      {
        'role': 'Data Scientist',
        'positions': '5',
        'location': 'Bangalore',
        'package': '28 LPA',
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
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.work_outline,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Current Openings',
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
                    label: const Text('Post'),
                  ),
              ],
            ),
            const Divider(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: openings.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final job = openings[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple.withOpacity(0.1),
                    child: Icon(Icons.work, color: Colors.purple, size: 20),
                  ),
                  title: Text(job['role']!),
                  subtitle: Text(
                    '${job['positions']} positions • ${job['location']}',
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        job['package']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        'View Details',
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      ),
                    ],
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
          backgroundColor: Colors.purple,
        ),
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _designationController.dispose();
    _departmentController.dispose();
    _companyNameController.dispose();
    _companyWebsiteController.dispose();
    _industryController.dispose();
    _companySizeController.dispose();
    _headquartersController.dispose();
    _indiaOfficeController.dispose();
    _gstNumberController.dispose();
    _companyDescriptionController.dispose();
    _hrContactController.dispose();
    _hrEmailController.dispose();
    _recruitmentHeadController.dispose();
    _linkedinController.dispose();
    _twitterController.dispose();
    _facebookController.dispose();
    super.dispose();
  }
}
