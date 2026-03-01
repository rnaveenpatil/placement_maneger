// lib/screens/home/student_home.dart
import 'package:flutter/material.dart';
import 'package:placement_player/screens/profile/student_profile.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  int _selectedIndex = 0;
  String _selectedFilter = 'All Companies';

  // Sample data - Replace with actual data from API
  final List<Map<String, dynamic>> _hiringCompanies = [
    {
      'id': 1,
      'name': 'Google',
      'logo': 'https://logo.clearbit.com/google.com',
      'role': 'Software Engineer',
      'package': '45 LPA',
      'location': 'Bangalore',
      'deadline': 'Mar 15, 2024',
      'eligibleBranches': ['CSE', 'IT', 'ECE'],
      'minCGPA': 8.0,
      'skills': ['DSA', 'System Design', 'Flutter'],
      'applicants': 45,
      'isApplied': false,
      'description': 'Looking for passionate software engineers...',
    },
    {
      'id': 2,
      'name': 'Microsoft',
      'logo': 'https://logo.clearbit.com/microsoft.com',
      'role': 'Product Manager',
      'package': '38 LPA',
      'location': 'Hyderabad',
      'deadline': 'Mar 20, 2024',
      'eligibleBranches': ['CSE', 'IT', 'MBA'],
      'minCGPA': 7.5,
      'skills': ['Product Strategy', 'Analytics'],
      'applicants': 32,
      'isApplied': true,
      'description': 'Looking for innovative product managers...',
    },
    {
      'id': 3,
      'name': 'Amazon',
      'logo': 'https://logo.clearbit.com/amazon.com',
      'role': 'SDE Intern',
      'package': '25 LPA',
      'location': 'Chennai',
      'deadline': 'Mar 25, 2024',
      'eligibleBranches': ['CSE', 'IT', 'ECE'],
      'minCGPA': 7.0,
      'skills': ['Java', 'Spring Boot', 'AWS'],
      'applicants': 78,
      'isApplied': false,
      'description': 'Looking for talented interns...',
    },
    {
      'id': 4,
      'name': 'Goldman Sachs',
      'logo': 'https://logo.clearbit.com/goldmansachs.com',
      'role': 'Analyst',
      'package': '32 LPA',
      'location': 'Mumbai',
      'deadline': 'Apr 1, 2024',
      'eligibleBranches': ['CSE', 'IT', 'Finance'],
      'minCGPA': 8.5,
      'skills': ['Financial Analysis', 'Python'],
      'applicants': 23,
      'isApplied': false,
      'description': 'Looking for financial analysts...',
    },
  ];

  final List<String> _filters = [
    'All Companies',
    'Eligible',
    'Applied',
    'New',
    'Deadline Soon'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          'Campus Placements',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Notification Icon
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.white),
                onPressed: () {
                  // Navigate to notifications
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Profile Icon
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentProfileScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16, left: 8),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                backgroundImage: const NetworkImage(
                  'https://via.placeholder.com/150',
                ),
                onBackgroundImageError: (_, __) => const Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Welcome Banner
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome back,',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'John Doe!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'CGPA',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                          Text(
                            '8.75',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem('Applied', '5', Icons.description),
                    _buildStatItem('Shortlisted', '2', Icons.star),
                    _buildStatItem('Companies', '12', Icons.business),
                  ],
                ),
              ],
            ),
          ),

          // Filter Chips
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: _selectedFilter == filter,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: Colors.blue,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      color: _selectedFilter == filter
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                );
              },
            ),
          ),

          // Companies List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _hiringCompanies.length,
              itemBuilder: (context, index) {
                final company = _hiringCompanies[index];
                return _buildCompanyCard(company);
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            activeIcon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Updates',
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCompanyCard(Map<String, dynamic> company) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Header
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.business, color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        company['role'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: company['isApplied'] ? Colors.green : Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    company['isApplied'] ? 'Applied' : 'Apply Now',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Package & Location
            Row(
              children: [
                _buildInfoChip(
                    Icons.attach_money, company['package'], Colors.green),
                const SizedBox(width: 8),
                _buildInfoChip(
                    Icons.location_on, company['location'], Colors.red),
                const SizedBox(width: 8),
                _buildInfoChip(
                    Icons.calendar_today, company['deadline'], Colors.blue),
              ],
            ),

            const SizedBox(height: 12),

            // Eligibility
            Wrap(
              spacing: 8,
              children: [
                _buildEligibilityChip(
                    'CGPA: ${company['minCGPA']}+', Colors.purple),
                ...company['eligibleBranches'].map<Widget>((branch) {
                  return _buildEligibilityChip(branch, Colors.blue);
                }).toList(),
              ],
            ),

            const SizedBox(height: 12),

            // Skills
            const Text(
              'Required Skills:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: company['skills'].map<Widget>((skill) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            // Applicants and Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.people_outline,
                        size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      '${company['applicants']} applicants',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                if (!company['isApplied'])
                  ElevatedButton(
                    onPressed: () {
                      _showApplyDialog(company);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Apply Now'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEligibilityChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: color,
        ),
      ),
    );
  }

  void _showApplyDialog(Map<String, dynamic> company) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Apply to ${company['name']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('You are applying for:'),
            const SizedBox(height: 8),
            Text(
              company['role'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Selected Resume:'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.picture_as_pdf, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text('John_Doe_Resume.pdf'),
                  ),
                  Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Application submitted successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Submit Application'),
          ),
        ],
      ),
    );
  }
}
