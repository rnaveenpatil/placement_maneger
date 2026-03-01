// lib/screens/home/hod_home.dart
import 'package:flutter/material.dart';
import 'package:placement_player/screens/profile/HOD_profile.dart';

class HODHomeScreen extends StatefulWidget {
  const HODHomeScreen({Key? key}) : super(key: key);

  @override
  State<HODHomeScreen> createState() => _HODHomeScreenState();
}

class _HODHomeScreenState extends State<HODHomeScreen> {
  int _selectedIndex = 0;
  String _selectedBranch = 'CSE';
  String _searchQuery = '';

  final List<Map<String, dynamic>> _departmentStudents = [
    {
      'id': 1,
      'name': 'John Doe',
      'usn': '1MS20CS001',
      'branch': 'CSE',
      'semester': 8,
      'cgpa': 8.9,
      'skills': ['Flutter', 'Java', 'Python', 'Machine Learning'],
      'projects': ['E-commerce App', 'AI Chatbot'],
      'placed': true,
      'company': 'Google',
      'package': '45 LPA',
      'backlogs': 0,
      'attendance': 92,
    },
    {
      'id': 2,
      'name': 'Jane Smith',
      'usn': '1MS20CS002',
      'branch': 'CSE',
      'semester': 8,
      'cgpa': 9.2,
      'skills': ['React', 'Node.js', 'MongoDB', 'AWS'],
      'projects': ['Social Media Platform', 'Cloud Storage'],
      'placed': true,
      'company': 'Microsoft',
      'package': '38 LPA',
      'backlogs': 0,
      'attendance': 95,
    },
    {
      'id': 3,
      'name': 'Mike Johnson',
      'usn': '1MS20EC001',
      'branch': 'ECE',
      'semester': 8,
      'cgpa': 7.8,
      'skills': ['VLSI', 'Embedded Systems', 'C++', 'MATLAB'],
      'projects': ['Robotics Arm', 'IoT Device'],
      'placed': false,
      'company': null,
      'package': null,
      'backlogs': 1,
      'attendance': 78,
    },
    {
      'id': 4,
      'name': 'Sarah Williams',
      'usn': '1MS20CS003',
      'branch': 'CSE',
      'semester': 8,
      'cgpa': 8.5,
      'skills': ['Python', 'Django', 'PostgreSQL', 'Docker'],
      'projects': ['Hospital Management', 'API Gateway'],
      'placed': false,
      'company': null,
      'package': null,
      'backlogs': 0,
      'attendance': 88,
    },
    {
      'id': 5,
      'name': 'David Brown',
      'usn': '1MS20CS004',
      'branch': 'CSE',
      'semester': 8,
      'cgpa': 7.2,
      'skills': ['Java', 'Spring Boot', 'MySQL'],
      'projects': ['Banking App'],
      'placed': false,
      'company': null,
      'package': null,
      'backlogs': 2,
      'attendance': 65,
    },
  ];

  final List<String> _branches = ['CSE', 'ECE', 'ME', 'CE', 'EE'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: const Text(
          'Department Dashboard',
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
                  builder: (context) => const HODProfileScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Department Stats
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.orange,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Computer Science Engineering',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        '2020-2024 Batch',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDeptStat('Total Students', '120', Icons.people),
                    _buildDeptStat('Placed', '85', Icons.work),
                    _buildDeptStat('Companies', '25', Icons.business),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildDeptStat(
                        'Avg Package', '12.5 LPA', Icons.attach_money),
                    _buildDeptStat('Highest', '45 LPA', Icons.trending_up),
                    _buildDeptStat('Placement %', '71%', Icons.percent),
                  ],
                ),
              ],
            ),
          ),

          // Branch Filter
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _branches.map((branch) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(branch),
                      selected: _selectedBranch == branch,
                      onSelected: (selected) {
                        setState(() {
                          _selectedBranch = branch;
                        });
                      },
                      backgroundColor: Colors.white,
                      selectedColor: Colors.orange,
                      checkmarkColor: Colors.white,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        hintText: 'Search students by name, USN or skills',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Tab Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton('All Students', 0),
                const SizedBox(width: 8),
                _buildTabButton('Placed', 1),
                const SizedBox(width: 8),
                _buildTabButton('Unplaced', 2),
                const SizedBox(width: 8),
                _buildTabButton('Skill Analysis', 3),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Students List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _departmentStudents.length,
              itemBuilder: (context, index) {
                final student = _departmentStudents[index];
                return _buildStudentCard(student);
              },
            ),
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
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Reports',
          ),
        ],
      ),
    );
  }

  Widget _buildDeptStat(String label, String value, IconData icon) {
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
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isSelected = index == 0 ? true : false; // Simplified for demo
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.orange : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? Colors.orange : Colors.grey.shade300,
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildStudentCard(Map<String, dynamic> student) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Header
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: student['placed']
                      ? Colors.green.withOpacity(0.1)
                      : Colors.orange.withOpacity(0.1),
                  child: Text(
                    student['name'][0],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: student['placed'] ? Colors.green : Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            student['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: student['placed']
                                  ? Colors.green
                                  : Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              student['placed'] ? 'Placed' : 'Not Placed',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
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
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Sem ${student['semester']}',
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Skills Section
            const Text(
              'Skills:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: student['skills'].map<Widget>((skill) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
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

            // Projects
            const Text(
              'Projects:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              student['projects'].join(' • '),
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 12),

            // Additional Info
            Row(
              children: [
                _buildInfoItem(Icons.analytics_outlined, 'Attendance',
                    '${student['attendance']}%'),
                const SizedBox(width: 16),
                _buildInfoItem(Icons.warning_outlined, 'Backlogs',
                    student['backlogs'].toString()),
                const SizedBox(width: 16),
                if (student['placed'])
                  _buildInfoItem(
                      Icons.work_outline, 'Company', student['company']!),
              ],
            ),

            if (student['placed']) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Placement Details:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${student['company']} • ${student['package']}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 12),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    _showStudentDetails(student);
                  },
                  icon: const Icon(Icons.visibility_outlined, size: 16),
                  label: const Text('View Details'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.orange,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download_outlined, size: 16),
                  label: const Text('Resume'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey[600]),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                color: Colors.grey[600],
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showStudentDetails(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Student Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Full Name'),
                subtitle: Text(student['name']),
              ),
              ListTile(
                leading: const Icon(Icons.numbers),
                title: const Text('USN'),
                subtitle: Text(student['usn']),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Branch & Semester'),
                subtitle:
                    Text('${student['branch']} - Sem ${student['semester']}'),
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('CGPA'),
                subtitle: Text(student['cgpa'].toString()),
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text('Skills'),
                subtitle: Text(student['skills'].join(', ')),
              ),
              ListTile(
                leading: const Icon(Icons.analytics),
                title: const Text('Attendance'),
                subtitle: Text('${student['attendance']}%'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
