import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for SystemChrome
import 'signup_screen.dart'; // Import the SignupScreen widget

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // TODO: Implement actual login logic (e.g., call authentication service)
    print('Attempting login with:');
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    // Navigate to home screen or show error
  }

  void _forgotPassword() {
    // TODO: Implement forgot password navigation
    print('Forgot Password tapped');
    // Navigate to Forgot Password screen
  }

  void _signInWithGoogle() {
    // TODO: Implement Google Sign-In logic
    print('Sign In with Google tapped');
  }

  void _signInWithApple() {
    // TODO: Implement Apple Sign-In logic
    print('Sign In with Apple tapped');
  }

  void _goToSignup() {
  // Navigate to the Signup screen
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SignupScreen()),
  );
  print('Signup tapped (Navigating)');
}

  @override
  Widget build(BuildContext context) {
    // Set status bar color (optional, but common for clean UI)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Optional: transparent status bar
      statusBarIconBrightness: Brightness.dark, // Icons dark on light background
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // Avoids content going under status bar/notches
        child: SingleChildScrollView( // Prevents overflow on small screens/keyboard open
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // App Title / Logo Area (Placeholder)
              // In a real app, you might have a logo or app name here
              SizedBox(height: 40), // Space from the top

              // Login Title
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),

              // Subtitle
              Text(
                'Please enter your credential',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40.0),

              // Email Label
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),

              // Email Input Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: '@mail.com',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none, // No visible border line
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                ),
              ),
              SizedBox(height: 20.0),

              // Password Label
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),

              // Password Input Field
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible, // Toggle obscurity based on state
                decoration: InputDecoration(
                  hintText: 'Write here',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none, // No visible border line
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility // Show eye icon when visible
                          : Icons.visibility_off, // Show eye-off icon when hidden
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Toggle password visibility state
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 12.0),

              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _forgotPassword,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                     color: Color(0xFF03C587), // A distinct color, can match the main button green
                      fontSize: 14.0,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove default padding
                    minimumSize: Size(0, 0), // Allow button to be small
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Minimize tap target
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // 'or' Separator
              Center(
                child: Text(
                  'or',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // Sign In with Google Button
              ElevatedButton(
                onPressed: _signInWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200], // Light grey background
                  foregroundColor: Colors.black87, // Black text/icon color
                  minimumSize: Size(double.infinity, 50.0), // Full width, set height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0, // Remove shadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Use an actual Google icon asset or package icon
                    // For now, using a placeholder Icon
                    Image.asset(
                       'assets/images/google-logo.png', // Your asset path
                      height: 24.0,
                      width: 24.0,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Sign In with Google',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),

              // Sign In with Apple Button
              ElevatedButton(
                onPressed: _signInWithApple,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200], // Light grey background
                  foregroundColor: Colors.black87, // Black text/icon color
                  minimumSize: Size(double.infinity, 50.0), // Full width, set height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0, // Remove shadow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Use an actual Apple icon asset or package icon
                    // For now, using a placeholder Icon
                     Image.asset(
  'assets/images/apple-logo.png', // Your asset path
  height: 24.0,
  width: 24.0,
  color: Colors.black87, // Apply color if it's a template image
),
                    SizedBox(width: 12.0),
                    Text(
                      'Sign In with Apple',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),

              // Main Login Button
              ElevatedButton(
                onPressed: _login, // Call the login function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF03C587), // Vibrant green from image
                  foregroundColor: Colors.white, // White text
                  minimumSize: Size(double.infinity, 55.0), // Full width, taller
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  elevation: 5, // Add a little shadow
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // Don't have an account? Signup
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You don't have an account?",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  TextButton(
                    onPressed: _goToSignup,
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, // Bold and dark like the image
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
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