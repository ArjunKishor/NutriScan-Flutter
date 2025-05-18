import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for SystemChrome and InputFormatters
import 'login_screen.dart'; // Import LoginScreen for navigation

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _createAccount() {
    // TODO: Implement actual account creation logic
    print('Attempting to create account with:');
    print('Username: ${_usernameController.text}');
    print('Email: ${_emailController.text}');
    print('Phone: ${_phoneController.text}');
    print('Password: ${_passwordController.text}');
    print('Age: ${_ageController.text}');
    print('Agreed to terms: $_agreeToTerms');

    if (!_agreeToTerms) {
      // Show a warning if terms not agreed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please agree to the terms and conditions.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return; // Stop the creation process
    }

    // Basic validation example (can be expanded)
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty || _usernameController.text.isEmpty || _phoneController.text.isEmpty || _ageController.text.isEmpty) {
         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please fill in all fields.'),
              backgroundColor: Colors.redAccent,
            ),
          );
        return;
    }

    // Proceed with account creation (e.g., call API)
    // On success, navigate to the next screen (e.g., Home or verification)
    // On failure, show an error message

    // Example of success navigation:
    // Navigator.pushReplacementNamed(context, '/home'); // Or pushReplacement to a specific Home screen widget
  }

  void _signInWithGoogle() {
    // TODO: Implement Google Sign-Up logic
    print('Sign Up with Google tapped');
  }

  void _signInWithApple() {
    // TODO: Implement Apple Sign-Up logic
    print('Sign Up with Apple tapped');
  }

  void _viewTermsAndConditions() {
    // TODO: Implement navigation or showing terms (e.g., launch URL or show dialog)
    print('View Terms & Conditions tapped');
    // Example: Launch URL (requires url_launcher package)
    // launch('https://yourwebsite.com/terms');
  }

  void _viewPrivacyPolicy() {
    // TODO: Implement navigation or showing policy (e.g., launch URL or show dialog)
    print('View Privacy Policy tapped');
     // Example: Launch URL (requires url_launcher package)
    // launch('https://yourwebsite.com/privacy');
  }

  void _goToLogin() {
    // Navigate back to the Login screen
    Navigator.pop(context); // Simple back navigation
    // Or use Navigator.pushReplacement if you want to clear the stack
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    print('Sign in tapped (Navigating)');
  }

  @override
  Widget build(BuildContext context) {
    // Set status bar color (optional)
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Wrap the content Column with SingleChildScrollView
        child: SingleChildScrollView(
          // Add padding here to wrap the entire scrollable content
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Keep alignment
            children: <Widget>[
              // Back Button (Optional, but good practice)
               IconButton(
                 icon: Icon(Icons.arrow_back_ios),
                 onPressed: _goToLogin, // Navigate back
                 padding: EdgeInsets.zero, // Remove default padding
                 constraints: BoxConstraints(), // Remove default constraints
               ),
               SizedBox(height: 16), // Space after back button

              // Title
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),

              // Subtitle
              Text(
                'Provide the requested information to create your account and access the platform. Your details are securely handled, ensuring a seamless sign-up process.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40.0),

              // Username Label
              Text(
                'Username',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),
              // Username Input (Using global inputDecorationTheme from main.dart is optional)
              TextFormField(
                controller: _usernameController,
                // decoration: InputDecoration(...), // Can override global theme here
                decoration: InputDecoration(hintText: 'Write here'), // Or rely on global theme
              ),
              SizedBox(height: 20.0),

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
              // Email Input
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(hintText: '@mail.com'),
              ),
              SizedBox(height: 20.0),

              // Phone Label
               Text(
                'Phone',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),
              // Phone Input
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: 'Write here'),
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
              // Password Input
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Write here',
                  // Relying on global theme for filled, fill color, border, content padding
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              // Age Label
              Text(
                'Age',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.0),
              // Age Input
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Only allow digits
                ],
                decoration: InputDecoration(hintText: 'Write here'),
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

              // Sign In with Google Button (Assuming asset paths are correct)
              ElevatedButton(
                onPressed: _signInWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black87,
                  minimumSize: Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Image.asset(
                       'assets/images/google-logo.png', // Using asset path
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

              // Sign In with Apple Button (Assuming asset paths are correct)
              ElevatedButton(
                onPressed: _signInWithApple,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black87,
                  minimumSize: Size(double.infinity, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Image.asset(
                       'assets/images/apple-logo.png', // Using asset path
                       height: 24.0,
                       width: 24.0,
                       color: Colors.black87,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Sign In with Apple',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Terms and Privacy Checkbox & Text
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to top
                children: [
                  SizedBox( // Wrap checkbox in SizedBox to control size if needed
                     width: 24.0,
                     height: 24.0,
                     child: Checkbox(
                        value: _agreeToTerms,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _agreeToTerms = newValue ?? false;
                          });
                        },
                        activeColor: Colors.tealAccent[700], // Match button color
                        // Checkbox splash radius (optional)
                         splashRadius: 12.0,
                     ),
                   ),
                  SizedBox(width: 8.0), // Space between checkbox and text
                  Expanded( // Let text wrap
                    child: RichText(
                      text: TextSpan(
                        text: 'Agree to ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[700],
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'terms & conditions',
                            style: TextStyle(
                              color: Colors.teal, // Distinct color for link
                              decoration: TextDecoration.underline,
                            ),
                           // Add tap gesture recognizer for clickable links
                           // Make sure to import 'package:flutter/gestures.dart';
                           // recognizer: TapGestureRecognizer()..onTap = _viewTermsAndConditions,
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          TextSpan(
                            text: 'privacy policy',
                            style: TextStyle(
                              color: Colors.teal, // Distinct color for link
                              decoration: TextDecoration.underline,
                            ),
                           // Add tap gesture recognizer for clickable links
                           // recognizer: TapGestureRecognizer()..onTap = _viewPrivacyPolicy,
                          ),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),

              // Main Create Account Button
              ElevatedButton(
                onPressed: _createAccount, // Call create account function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent[700],
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 55.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30.0),

              // Already have an account? Sign in
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
                    onPressed: _goToLogin, // Navigate back to Login
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
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