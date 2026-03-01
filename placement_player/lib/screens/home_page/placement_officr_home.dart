// lib/screens/home/placement_officer_home.dart
import 'package:flutter/material.dart';
//import 'package:placement_player/screens/profile/placement_officer_profile.dart'
import 'package:placement_player/screens/profile/placement_officer_profile.dart';

class PlacementOfficerHomeScreen extends StatefulWidget {
  const PlacementOfficerHomeScreen({Key? key}) : super(key: key);

  @override
  State<PlacementOfficerHomeScreen> createState() =>
      _PlacementOfficerHomeScreenState();
}

class _PlacementOfficerHomeScreenState
    extends State<PlacementOfficerHomeScreen> {
  int _selectedIndex = 0;
  String _selectedTab = 'Companies';

  // Sample data for companies to approve
  final List<Map<String, dynamic>> _pendingCompanies = [
    {
      'id': 1,
      'name': 'Tesla',
      'logo': 'https://logo.clearbit.com/tesla.com',
      'industry': 'Automotive',
      'contactPerson': 'Elon Musk',
      'email': 'recruitment@tesla.com',
      'phone': '+1 234 567 890',
      'jobs': 3,
      'status': 'pending',
      'requestDate': 'Feb 28, 2024',
    },
    {
      'id': 2,
      'name': 'Netflix',
      'logo': 'https://logo.clearbit.com/netflix.com',
      'industry': 'Entertainment',
      'contactPerson': 'Reed Hastings',
      'email': 'hr@netflix.com',
      'phone': '+1 987 654 321',
      'jobs': 2,
      'status': 'pending',
      'requestDate': 'Feb 27, 2024',
    },
  ];

  // Sample data for approved companies
  final List<Map<String, dynamic>> _approvedCompanies = [
    {
      'id': 3,
      'name': 'Google',
      'logo': 'https://logo.clearbit.com/google.com',
      'industry': 'Technology',
      'jobs': 5,
      'activeDrives': 2,
      'studentsApplied': 156,
    },
    {
      'id': 4,
      'name': 'Microsoft',
      'logo': 'https://logo.clearbit.com/microsoft.com',
      'industry': 'Technology',
      'jobs': 4,
      'activeDrives': 3,
      'studentsApplied': 203,
    },
  ];

  // Sample data for eligible students for specific roles
  final List<Map<String, dynamic>> _eligibleStudents = [
    {
      'id': 1,
      'name': 'John Doe',
      'usn': '1MS20CS001',
      'branch': 'CSE',
      'cgpa': 8.9,
      'skills': ['Flutter', 'Java', 'Python'],
      'backlogs': 0,
      'resume': 'resume_john.pdf',
      'status': 'eligible',
    },
    {
      'id': 2,
      'name': 'Jane Smith',
      'usn': '1MS20CS002',
      'branch': 'CSE',
      'cgpa': 9.2,
      'skills': ['React', 'Node.js', 'MongoDB'],
      'backlogs': 0,
      'resume': 'resume_jane.pdf',
      'status': 'eligible',
    },
    {
      'id': 3,
      'name': 'Mike Johnson',
      'usn': '1MS20EC001',
      'branch': 'ECE',
      'cgpa': 7.8,
      'skills': ['VLSI', 'Embedded', 'C++'],
      'backlogs': 1,
      'resume': 'resume_mike.pdf',
      'status': 'not_eligible',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          'Placement Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Profile Icon
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlacementOfficerProfileScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Cards
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Companies',
                    '45',
                    Icons.business,
                    Colors.blue,
                    '+5 this month',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Active Drives',
                    '12',
                    Icons.event,
                    Colors.orange,
                    '8 ongoing',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Placed Students',
                    '380',
                    Icons.people,
                    Colors.green,
                    '85% placed',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Pending Approvals',
                    '3',
                    Icons.pending,
                    Colors.red,
                    '2 companies',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Tab Selection
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton('Companies', 0),
                const SizedBox(width: 8),
                _buildTabButton('Eligible Students', 1),
                const SizedBox(width: 8),
                _buildTabButton('Reports', 2),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Content based on selected tab
          Expanded(
            child: _selectedTab == 'Companies'
                ? _buildCompaniesTab()
                : _selectedTab == 'Eligible Students'
                    ? _buildEligibleStudentsTab()
                    : _buildReportsTab(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            label: 'Companies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Analytics',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color, String subtitle) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isSelected = _selectedTab ==
        (index == 0
            ? 'Companies'
            : index == 1
                ? 'Eligible Students'
                : 'Reports');
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedTab = index == 0
                ? 'Companies'
                : index == 1
                    ? 'Eligible Students'
                    : 'Reports';
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.green : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? Colors.green : Colors.grey.shade300,
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildCompaniesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Pending Approvals Section
        if (_pendingCompanies.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pending Approvals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_pendingCompanies.length} New',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ..._pendingCompanies
              .map((company) => _buildPendingCompanyCard(company))
              .toList(),
          const SizedBox(height: 24),
        ],

        // Approved Companies Section
        const Text(
          'Active Companies',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ..._approvedCompanies
            .map((company) => _buildApprovedCompanyCard(company))
            .toList(),
      ],
    );
  }

  Widget _buildPendingCompanyCard(Map<String, dynamic> company) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.business, color: Colors.green),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        company['industry'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        'Pending',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  company['contactPerson'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.email_outlined, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  company['email'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Requested: ${company['requestDate']}',
                  style: TextStyle(color: Colors.grey[600], fontSize: 11),
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        _showApproveDialog(company);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.green,
                      ),
                      child: const Text('Approve'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        _showRejectDialog(company);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Reject'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApprovedCompanyCard(Map<String, dynamic> company) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.business, color: Colors.green),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        company['industry'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Active',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCompanyStat(
                    'Jobs', company['jobs'].toString(), Icons.work),
                _buildCompanyStat(
                    'Drives', company['activeDrives'].toString(), Icons.event),
                _buildCompanyStat('Applied',
                    company['studentsApplied'].toString(), Icons.people),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_outlined),
                  label: const Text('View Jobs'),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    _showEligibleStudentsDialog(company);
                  },
                  icon: const Icon(Icons.person_search),
                  label: const Text('Find Students'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 16, color: Colors.green),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildEligibleStudentsTab() {
    return Column(
      children: [
        // Search and Filter Bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search students by name or USN',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.filter_list, color: Colors.white),
              ),
            ],
          ),
        ),

        // Filters
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterChip('All', true),
                _buildFilterChip('CSE', false),
                _buildFilterChip('ECE', false),
                _buildFilterChip('ME', false),
                _buildFilterChip('CGPA > 8', false),
                _buildFilterChip('No Backlogs', false),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Students List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _eligibleStudents.length,
            itemBuilder: (context, index) {
              final student = _eligibleStudents[index];
              return _buildStudentCard(student);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.green,
        checkmarkColor: Colors.white,
      ),
    );
  }

  Widget _buildStudentCard(Map<String, dynamic> student) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green.withOpacity(0.1),
                  child: Text(
                    student['name'][0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        student['usn'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              student['branch'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'CGPA: ${student['cgpa']}',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: student['status'] == 'eligible'
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    student['status'] == 'eligible'
                        ? 'Eligible'
                        : 'Not Eligible',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Skills
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: student['skills'].map<Widget>((skill) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(fontSize: 11),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.picture_as_pdf, color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      student['resume'],
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.visibility_outlined, size: 18),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.download_outlined, size: 18),
                      onPressed: () {},
                    ),
                    if (student['status'] == 'eligible')
                      ElevatedButton(
                        onPressed: () {
                          _showShortlistDialog(student);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          textStyle: const TextStyle(fontSize: 11),
                        ),
                        child: const Text('Shortlist'),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Generate Reports',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildReportItem(
                  'Placement Statistics',
                  'Overall placement data',
                  Icons.pie_chart,
                  Colors.blue,
                ),
                _buildReportItem(
                  'Company-wise Report',
                  'Details of companies visited',
                  Icons.business,
                  Colors.green,
                ),
                _buildReportItem(
                  'Student Performance',
                  'CGPA and skills analysis',
                  Icons.analytics,
                  Colors.orange,
                ),
                _buildReportItem(
                  'Branch-wise Analysis',
                  'Department wise placement',
                  Icons.account_tree,
                  Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReportItem(
      String title, String subtitle, IconData icon, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.download_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showApproveDialog(Map<String, dynamic> company) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Approve ${company['name']}'),
        content: Text(
            'Are you sure you want to approve this company? They will be able to post jobs and conduct drives.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${company['name']} approved successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text('Approve'),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(Map<String, dynamic> company) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reject ${company['name']}'),
        content: const TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Reason for rejection',
            border: OutlineInputBorder(),
          ),
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
                SnackBar(
                  content: Text('${company['name']} rejected'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Reject'),
          ),
        ],
      ),
    );
  }

  void _showEligibleStudentsDialog(Map<String, dynamic> company) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Eligible Students',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _eligibleStudents.length,
                  itemBuilder: (context, index) {
                    final student = _eligibleStudents[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.withOpacity(0.1),
                        child: Text(student['name'][0]),
                      ),
                      title: Text(student['name']),
                      subtitle: Text(
                          '${student['branch']} • CGPA: ${student['cgpa']}'),
                      trailing: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Students shortlisted successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('Shortlist Selected'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showShortlistDialog(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Shortlist Student'),
        content: Text('Shortlist ${student['name']} for which company?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${student['name']} shortlisted'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Shortlist'),
          ),
        ],
      ),
    );
  }
}
