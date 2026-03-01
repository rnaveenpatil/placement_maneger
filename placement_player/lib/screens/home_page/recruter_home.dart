// lib/screens/home/recruiter_home.dart
import 'package:flutter/material.dart';
import 'package:placement_player/screens/profile/recruter_profile.dart';

class RecruiterHomeScreen extends StatefulWidget {
  const RecruiterHomeScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterHomeScreen> createState() => _RecruiterHomeScreenState();
}

class _RecruiterHomeScreenState extends State<RecruiterHomeScreen> {
  int _selectedIndex = 0;
  String _selectedCollege = 'All Colleges';

  final List<Map<String, dynamic>> _colleges = [
    {
      'id': 1,
      'name': 'MS Ramaiah Institute of Technology',
      'location': 'Bangalore',
      'students': 2500,
      'avgCGPA': 8.2,
      'topBranches': ['CSE', 'ECE', 'ISE'],
      'previousHires': 45,
      'rating': 4.5,
    },
    {
      'id': 2,
      'name': 'RV College of Engineering',
      'location': 'Bangalore',
      'students': 2800,
      'avgCGPA': 8.5,
      'topBranches': ['CSE', 'ECE', 'ME'],
      'previousHires': 62,
      'rating': 4.7,
    },
    {
      'id': 3,
      'name': 'BMS College of Engineering',
      'location': 'Bangalore',
      'students': 2200,
      'avgCGPA': 8.0,
      'topBranches': ['CSE', 'ISE', 'ECE'],
      'previousHires': 38,
      'rating': 4.3,
    },
    {
      'id': 4,
      'name': 'PES University',
      'location': 'Bangalore',
      'students': 3000,
      'avgCGPA': 8.3,
      'topBranches': ['CSE', 'ECE', 'EEE'],
      'previousHires': 51,
      'rating': 4.4,
    },
  ];

  final List<Map<String, dynamic>> _students = [
    {
      'id': 1,
      'name': 'John Doe',
      'college': 'MS Ramaiah Institute of Technology',
      'branch': 'CSE',
      'cgpa': 8.9,
      'skills': ['Flutter', 'Java', 'Python', 'DSA'],
      'projects': ['E-commerce App', 'Portfolio Website'],
      'experience': ['Intern at Google', 'Freelance Developer'],
      'backlogs': 0,
      'placed': false,
    },
    {
      'id': 2,
      'name': 'Jane Smith',
      'college': 'RV College of Engineering',
      'branch': 'CSE',
      'cgpa': 9.2,
      'skills': ['React', 'Node.js', 'MongoDB', 'AWS'],
      'projects': ['Social Media Platform', 'Cloud Storage'],
      'experience': ['Intern at Microsoft'],
      'backlogs': 0,
      'placed': false,
    },
    {
      'id': 3,
      'name': 'Mike Johnson',
      'college': 'BMS College of Engineering',
      'branch': 'ECE',
      'cgpa': 7.8,
      'skills': ['VLSI', 'Embedded Systems', 'C++'],
      'projects': ['Robotics Arm', 'IoT Device'],
      'experience': ['Research Assistant'],
      'backlogs': 1,
      'placed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: const Text(
          'Recruiter Dashboard',
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
                onPressed: () {},
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
                    '5',
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
                  builder: (context) => const RecruiterProfileScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.business, color: Colors.purple),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Company Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.business,
                      size: 40, color: Colors.purple),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Google India',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Technology • 10,000+ employees',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Stats Cards
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Active Jobs',
                    '5',
                    Icons.work,
                    Colors.blue,
                    '2 new applications',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Applications',
                    '156',
                    Icons.people,
                    Colors.green,
                    '+23 today',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Shortlisted',
                    '45',
                    Icons.star,
                    Colors.orange,
                    '12 pending',
                  ),
                ),
              ],
            ),
          ),

          // Tab Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton('Colleges', 0),
                const SizedBox(width: 8),
                _buildTabButton('Students', 1),
                const SizedBox(width: 8),
                _buildTabButton('My Jobs', 2),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Content
          Expanded(
            child: _selectedIndex == 0
                ? _buildCollegesTab()
                : _selectedIndex == 1
                    ? _buildStudentsTab()
                    : _buildMyJobsTab(),
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
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outlined),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
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
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(icon, color: color, size: 16),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 9,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.purple : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.grey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? Colors.purple : Colors.grey.shade300,
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildCollegesTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // College Filter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCollegeFilterChip('All Colleges', true),
              _buildCollegeFilterChip('Bangalore', false),
              _buildCollegeFilterChip('Mumbai', false),
              _buildCollegeFilterChip('Delhi', false),
              _buildCollegeFilterChip('Pune', false),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Colleges List
        ..._colleges.map((college) => _buildCollegeCard(college)).toList(),
      ],
    );
  }

  Widget _buildCollegeFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.purple,
        checkmarkColor: Colors.white,
      ),
    );
  }

  Widget _buildCollegeCard(Map<String, dynamic> college) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
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
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:
                      const Icon(Icons.school, color: Colors.purple, size: 30),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        college['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 12, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            college['location'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
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
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        college['rating'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // College Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCollegeStat(
                    'Students', college['students'].toString(), Icons.people),
                _buildCollegeStat(
                    'Avg CGPA', college['avgCGPA'].toString(), Icons.star),
                _buildCollegeStat('Previous Hires',
                    college['previousHires'].toString(), Icons.work),
              ],
            ),

            const SizedBox(height: 12),

            // Top Branches
            const Text(
              'Top Branches:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: college['topBranches'].map<Widget>((branch) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    branch,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    _showCollegeDetails(college);
                  },
                  icon: const Icon(Icons.visibility_outlined),
                  label: const Text('View Details'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.purple,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    _showStudentsFromCollege(college);
                  },
                  icon: const Icon(Icons.person_search),
                  label: const Text('Find Students'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
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

  Widget _buildCollegeStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 16, color: Colors.purple),
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

  Widget _buildStudentsTab() {
    return Column(
      children: [
        // Search and Filter
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
                            hintText: 'Search students by skills, branch...',
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
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.tune, color: Colors.white),
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
                _buildStudentFilterChip('All', true),
                _buildStudentFilterChip('CSE', false),
                _buildStudentFilterChip('ECE', false),
                _buildStudentFilterChip('CGPA > 8', false),
                _buildStudentFilterChip('No Backlogs', false),
                _buildStudentFilterChip('Has Experience', false),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Students List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _students.length,
            itemBuilder: (context, index) {
              final student = _students[index];
              return _buildStudentCardForRecruiter(student);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStudentFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.purple,
        checkmarkColor: Colors.white,
      ),
    );
  }

  Widget _buildStudentCardForRecruiter(Map<String, dynamic> student) {
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
                  radius: 25,
                  backgroundColor: Colors.purple.withOpacity(0.1),
                  child: Text(
                    student['name'][0],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
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
                      const SizedBox(height: 4),
                      Text(
                        student['college'],
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
                IconButton(
                  icon: const Icon(Icons.bookmark_outline),
                  onPressed: () {},
                  color: Colors.purple,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Skills
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
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.purple,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            // Experience
            if (student['experience'].isNotEmpty) ...[
              const Text(
                'Experience:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              ...student['experience'].map<Widget>((exp) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Icon(Icons.work, size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          exp,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],

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
            ...student['projects'].map<Widget>((project) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    const Icon(Icons.folder, size: 12, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        project,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    _showStudentDetails(student);
                  },
                  icon: const Icon(Icons.visibility_outlined),
                  label: const Text('View Profile'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.purple,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    _showShortlistStudentDialog(student);
                  },
                  icon: const Icon(Icons.star),
                  label: const Text('Shortlist'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
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

  Widget _buildMyJobsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Post New Job Button
        ElevatedButton.icon(
          onPressed: () {
            _showPostJobDialog();
          },
          icon: const Icon(Icons.add),
          label: const Text('Post New Job'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Active Jobs
        const Text(
          'Active Jobs',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        _buildJobCard(
          'Software Engineer',
          'Bangalore',
          '5 positions',
          '156 applicants',
          '2 days left',
        ),
        _buildJobCard(
          'Product Manager',
          'Hyderabad',
          '2 positions',
          '89 applicants',
          '5 days left',
        ),
        _buildJobCard(
          'Data Scientist',
          'Bangalore',
          '3 positions',
          '203 applicants',
          '1 day left',
        ),
      ],
    );
  }

  Widget _buildJobCard(String title, String location, String positions,
      String applicants, String deadline) {
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.work, color: Colors.purple),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              size: 12, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildJobStat(positions, Icons.people),
                _buildJobStat(applicants, Icons.description),
                _buildJobStat(deadline, Icons.timer),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('View Applications'),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('Edit',
                      style: TextStyle(color: Colors.purple)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobStat(String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.purple),
        const SizedBox(width: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  void _showCollegeDetails(Map<String, dynamic> college) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'College Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('College Name'),
                subtitle: Text(college['name']),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Location'),
                subtitle: Text(college['location']),
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Total Students'),
                subtitle: Text(college['students'].toString()),
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Average CGPA'),
                subtitle: Text(college['avgCGPA'].toString()),
              ),
              ListTile(
                leading: const Icon(Icons.work),
                title: const Text('Previous Hires'),
                subtitle: Text(college['previousHires'].toString()),
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

  void _showStudentsFromCollege(Map<String, dynamic> college) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Students from ${college['name']}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: _students.length,
                  itemBuilder: (context, index) {
                    final student = _students[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple.withOpacity(0.1),
                        child: Text(student['name'][0]),
                      ),
                      title: Text(student['name']),
                      subtitle: Text(
                          '${student['branch']} • CGPA: ${student['cgpa']}'),
                      trailing: Checkbox(
                        value: false,
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
                          backgroundColor: Colors.purple,
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
                'Student Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Name'),
                subtitle: Text(student['name']),
              ),
              ListTile(
                leading: const Icon(Icons.school),
                title: const Text('College'),
                subtitle: Text(student['college']),
              ),
              ListTile(
                leading: const Icon(Icons.account_tree),
                title: const Text('Branch'),
                subtitle: Text(student['branch']),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showShortlistStudentDialog(student);
                    },
                    child: const Text('Shortlist'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showShortlistStudentDialog(Map<String, dynamic> student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Shortlist Student'),
        content: Text('Shortlist ${student['name']} for which position?'),
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
                  content: Text('${student['name']} shortlisted successfully'),
                  backgroundColor: Colors.purple,
                ),
              );
            },
            child: const Text('Shortlist'),
          ),
        ],
      ),
    );
  }

  void _showPostJobDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Post New Job',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Number of Positions',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Job Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
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
                          content: Text('Job posted successfully'),
                          backgroundColor: Colors.purple,
                        ),
                      );
                    },
                    child: const Text('Post Job'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
