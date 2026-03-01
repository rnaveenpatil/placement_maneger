// lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:placement_player/screens/Role_Selection_Screen.dart';
import 'package:placement_player/screens/home_page/HOD_home_page.dart';
import 'package:placement_player/screens/home_page/placement_officr_home.dart';
import 'package:placement_player/screens/home_page/recruter_home.dart';
import 'package:placement_player/screens/home_page/student_home_page.dart';
import 'package:placement_player/screens/profile/HOD_profile.dart';
import 'package:placement_player/screens/profile/placement_officer_profile.dart';
import 'package:placement_player/screens/profile/recruter_profile.dart';
import 'package:placement_player/screens/profile/student_profile.dart';
import 'package:placement_player/screens/log_in/HOD_Faculty_Login.dart';
import 'package:placement_player/screens/log_in/Placement_Officer_Login.dart';
import 'package:placement_player/screens/log_in/Recruiter_Login.dart';
import 'package:placement_player/screens/log_in/Student_Login.dart';
import 'package:placement_player/screens/sign_up/HOD_sign_up.dart';
import 'package:placement_player/screens/sign_up/placement_officer.dart';
import 'package:placement_player/screens/sign_up/recruter_sign_up.dart';
import 'package:placement_player/screens/sign_up/student_sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load saved authentication state
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final userRole = prefs.getString('userRole') ?? '';
  final userEmail = prefs.getString('userEmail') ?? '';
  final userName = prefs.getString('userName') ?? '';

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    userRole: userRole,
    userEmail: userEmail,
    userName: userName,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String userRole;
  final String userEmail;
  final String userName;

  const MyApp({
    Key? key,
    required this.isLoggedIn,
    required this.userRole,
    required this.userEmail,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Placements',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
        ),
      ),
      // Set the initial route based on login status
      home: AuthWrapper(
        isLoggedIn: isLoggedIn,
        userRole: userRole,
        userEmail: userEmail,
        userName: userName,
      ),
      // Define routes for navigation
      routes: {
        // Login Routes
        '/role-selection': (context) => const RoleSelectionScreen(),
        '/student-login': (context) => const StudentLoginScreen(),
        '/placement-officer-login': (context) =>
            const PlacementOfficerLoginScreen(),
        '/hod-login': (context) => const HODLoginScreen(),
        '/recruiter-login': (context) => const RecruiterLoginScreen(),

        // Sign Up Routes
        '/student-signup': (context) => const StudentSignUpScreen(),
        '/placement-officer-signup': (context) =>
            const PlacementOfficerSignUpScreen(),
        '/hod-signup': (context) => const HODSignUpScreen(),
        '/recruiter-signup': (context) => const RecruiterSignUpScreen(),

        // Home Routes
        '/student-home': (context) => const StudentHomeScreen(),
        '/placement-officer-home': (context) =>
            const PlacementOfficerHomeScreen(),
        '/hod-home': (context) => const HODHomeScreen(),
        '/recruiter-home': (context) => const RecruiterHomeScreen(),

        // Profile Routes
        '/student-profile': (context) => const StudentProfileScreen(),
        '/placement-officer-profile': (context) =>
            const PlacementOfficerProfileScreen(),
        '/hod-profile': (context) => const HODProfileScreen(),
        '/recruiter-profile': (context) => const RecruiterProfileScreen(),
      },
    );
  }
}

// Authentication Wrapper - Decides which screen to show
class AuthWrapper extends StatefulWidget {
  final bool isLoggedIn;
  final String userRole;
  final String userEmail;
  final String userName;

  const AuthWrapper({
    Key? key,
    required this.isLoggedIn,
    required this.userRole,
    required this.userEmail,
    required this.userName,
  }) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  // MASTER SWITCH - Set this to false for production, true for testing
  // When true, it will bypass login and go directly to the specified role
  final bool _bypassLogin = true; // Change to false for production

  // Select which role to use when bypassing login
  // Options: 'student', 'placement_officer', 'hod', 'recruiter'
  final String _bypassRole =
      'HOD/faculty'; // Change this to test different roles

  @override
  Widget build(BuildContext context) {
    // Check if we should bypass login (for testing)
    if (_bypassLogin) {
      return _getHomeScreenForRole(_bypassRole);
    }

    // Normal flow - check if user is logged in
    if (widget.isLoggedIn && widget.userRole.isNotEmpty) {
      return _getHomeScreenForRole(widget.userRole);
    }

    // Not logged in, go to role selection
    return const RoleSelectionScreen();
  }

  // Get the appropriate home screen based on role
  Widget _getHomeScreenForRole(String role) {
    switch (role) {
      case 'student':
        return const StudentHomeScreen();
      case 'placement_officer':
        return const PlacementOfficerHomeScreen();
      case 'hod':
        return const HODHomeScreen();
      case 'recruiter':
        return const RecruiterHomeScreen();
      default:
        return const StudentHomeScreen();
    }
  }
}

// Authentication Service (Mock) - For managing login state
class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // SharedPreferences instance
  late SharedPreferences _prefs;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Login method
  Future<bool> login({
    required String role,
    required String email,
    required String password,
    String? name,
    String? college,
    String? department,
  }) async {
    try {
      // Mock login - In real app, this would call an API
      await Future.delayed(const Duration(seconds: 1));

      // Save user data
      await _prefs.setBool('isLoggedIn', true);
      await _prefs.setString('userRole', role);
      await _prefs.setString('userEmail', email);
      await _prefs.setString('userName', name ?? 'User');
      if (college != null) await _prefs.setString('userCollege', college);
      if (department != null)
        await _prefs.setString('userDepartment', department);

      return true;
    } catch (e) {
      return false;
    }
  }

  // Sign up method
  Future<bool> signUp({
    required String role,
    required String email,
    required String password,
    required String name,
    String? college,
    String? department,
    String? usn,
    String? course,
    String? branch,
    String? companyName,
  }) async {
    try {
      // Mock sign up - In real app, this would call an API
      await Future.delayed(const Duration(seconds: 1));

      // After sign up, automatically log in
      return await login(
        role: role,
        email: email,
        password: password,
        name: name,
        college: college,
        department: department,
      );
    } catch (e) {
      return false;
    }
  }

  // Logout method
  Future<void> logout() async {
    // Clear all user data
    await _prefs.remove('isLoggedIn');
    await _prefs.remove('userRole');
    await _prefs.remove('userEmail');
    await _prefs.remove('userName');
    await _prefs.remove('userCollege');
    await _prefs.remove('userDepartment');
  }

  // Check if user is logged in
  bool get isLoggedIn => _prefs.getBool('isLoggedIn') ?? false;

  // Get current user role
  String get userRole => _prefs.getString('userRole') ?? '';

  // Get current user email
  String get userEmail => _prefs.getString('userEmail') ?? '';

  // Get current user name
  String get userName => _prefs.getString('userName') ?? '';

  // Get current user college
  String get userCollege => _prefs.getString('userCollege') ?? '';

  // Get current user department
  String get userDepartment => _prefs.getString('userDepartment') ?? '';
}

// Example of how to use AuthService in your login screens
class LoginHandler {
  // Handle student login
  static Future<void> handleStudentLogin(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
    required String usn,
    required String course,
    required String year,
    required String college,
  }) async {
    final auth = AuthService();
    final success = await auth.login(
      role: 'student',
      email: email,
      password: password,
      name: name,
      college: college,
    );

    if (success && context.mounted) {
      Navigator.pushReplacementNamed(context, '/student-home');
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Handle placement officer login
  static Future<void> handlePlacementOfficerLogin(
    BuildContext context, {
    required String email,
    required String password,
    required String college,
  }) async {
    final auth = AuthService();
    final success = await auth.login(
      role: 'placement_officer',
      email: email,
      password: password,
      college: college,
    );

    if (success && context.mounted) {
      Navigator.pushReplacementNamed(context, '/placement-officer-home');
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Handle HOD login
  static Future<void> handleHODLogin(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
    required String department,
  }) async {
    final auth = AuthService();
    final success = await auth.login(
      role: 'hod',
      email: email,
      password: password,
      name: name,
      department: department,
    );

    if (success && context.mounted) {
      Navigator.pushReplacementNamed(context, '/hod-home');
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Handle recruiter login
  static Future<void> handleRecruiterLogin(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final auth = AuthService();
    final success = await auth.login(
      role: 'recruiter',
      email: email,
      password: password,
    );

    if (success && context.mounted) {
      Navigator.pushReplacementNamed(context, '/recruiter-home');
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Logout
  static Future<void> handleLogout(BuildContext context) async {
    final auth = AuthService();
    await auth.logout();

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/role-selection');
    }
  }
}
