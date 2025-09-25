// // // import 'package:flutter/material.dart';
// // // import '../dashboard.dart'; // After signup, go to dashboard

// // // class SignupScreen extends StatefulWidget {
// // //   @override
// // //   _SignupScreenState createState() => _SignupScreenState();
// // // }

// // // class _SignupScreenState extends State<SignupScreen> {
// // //   final _formKey = GlobalKey<FormState>();
// // //   String name = "";
// // //   String email = "";
// // //   String password = "";

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(20.0),
// // //         child: Center(
// // //           child: SingleChildScrollView(
// // //             child: Form(
// // //               key: _formKey,
// // //               child: Column(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   Icon(Icons.app_registration, size: 80, color: Colors.teal),
// // //                   SizedBox(height: 20),
// // //                   Text(
// // //                     "Create Account",
// // //                     style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
// // //                   ),
// // //                   SizedBox(height: 40),
// // //                   TextFormField(
// // //                     decoration: InputDecoration(
// // //                       labelText: "Full Name",
// // //                       border: OutlineInputBorder(),
// // //                     ),
// // //                     onChanged: (val) => name = val,
// // //                     validator: (val) =>
// // //                         val!.isEmpty ? "Enter your name" : null,
// // //                   ),
// // //                   SizedBox(height: 20),
// // //                   TextFormField(
// // //                     decoration: InputDecoration(
// // //                       labelText: "Email",
// // //                       border: OutlineInputBorder(),
// // //                     ),
// // //                     onChanged: (val) => email = val,
// // //                     validator: (val) =>
// // //                         val!.isEmpty ? "Enter a valid email" : null,
// // //                   ),
// // //                   SizedBox(height: 20),
// // //                   TextFormField(
// // //                     decoration: InputDecoration(
// // //                       labelText: "Password",
// // //                       border: OutlineInputBorder(),
// // //                     ),
// // //                     obscureText: true,
// // //                     onChanged: (val) => password = val,
// // //                     validator: (val) =>
// // //                         val!.length < 6 ? "Password too short" : null,
// // //                   ),
// // //                   SizedBox(height: 30),
// // //                   ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       minimumSize: Size(double.infinity, 50),
// // //                       backgroundColor: Colors.teal,
// // //                     ),
// // //                     onPressed: () {
// // //                       if (_formKey.currentState!.validate()) {
// // //                         // For now directly go to dashboard
// // //                         Navigator.pushReplacement(
// // //                           context,
// // //                           MaterialPageRoute(
// // //                             builder: (context) => DashboardScreen(),
// // //                           ),
// // //                         );
// // //                       }
// // //                     },
// // //                     child: Text("Sign Up"),
// // //                   ),
// // //                   TextButton(
// // //                     onPressed: () {
// // //                       Navigator.pop(context); // Go back to login
// // //                     },
// // //                     child: Text("Already have an account? Login"),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }





// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'dart:ui';
// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import '../dashboard.dart';
// // // import 'login.dart';

// // // class SignupScreen extends StatefulWidget {
// // //   @override
// // //   _SignupScreenState createState() => _SignupScreenState();
// // // }

// // // class _SignupScreenState extends State<SignupScreen> with TickerProviderStateMixin {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _nameController = TextEditingController();
// // //   final _emailController = TextEditingController();
// // //   final _passwordController = TextEditingController();
// // //   final _confirmPasswordController = TextEditingController();
// // //   bool _isPasswordVisible = false;
// // //   bool _isConfirmPasswordVisible = false;
// // //   bool _isLoading = false;
// // //   bool _acceptTerms = false;
// // //   late AnimationController _animationController;
// // //   late AnimationController _floatingController;
// // //   late Animation<double> _fadeAnimation;
// // //   late Animation<double> _slideAnimation;
// // //   late Animation<double> _floatingAnimation;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _animationController = AnimationController(
// // //       duration: Duration(milliseconds: 800),
// // //       vsync: this,
// // //     );
// // //     _floatingController = AnimationController(
// // //       duration: Duration(seconds: 4),
// // //       vsync: this,
// // //     )..repeat(reverse: true);
    
// // //     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
// // //       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
// // //     );
// // //     _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
// // //       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
// // //     );
// // //     _floatingAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
// // //       CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
// // //     );
    
// // //     _animationController.forward();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _nameController.dispose();
// // //     _emailController.dispose();
// // //     _passwordController.dispose();
// // //     _confirmPasswordController.dispose();
// // //     _animationController.dispose();
// // //     _floatingController.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.grey[50],
// // //       body: SafeArea(
// // //         child: Stack(
// // //           children: [
// // //             // Background Elements
// // //             _buildBackgroundElements(),
            
// // //             // Main Content
// // //             FadeTransition(
// // //               opacity: _fadeAnimation,
// // //               child: AnimatedBuilder(
// // //                 animation: _slideAnimation,
// // //                 builder: (context, child) {
// // //                   return Transform.translate(
// // //                     offset: Offset(0, _slideAnimation.value),
// // //                     child: Center(
// // //                       child: SingleChildScrollView(
// // //                         padding: EdgeInsets.all(24),
// // //                         child: _buildMainContent(),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildBackgroundElements() {
// // //     return Stack(
// // //       children: [
// // //         // Floating Blur Elements
// // //         AnimatedBuilder(
// // //           animation: _floatingAnimation,
// // //           builder: (context, child) {
// // //             return Positioned(
// // //               top: 80 + _floatingAnimation.value,
// // //               right: 20,
// // //               child: Container(
// // //                 width: 120,
// // //                 height: 120,
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Color(0xFFE91E63).withOpacity(0.1),
// // //                 ),
// // //                 child: ClipOval(
// // //                   child: BackdropFilter(
// // //                     filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
// // //                     child: Container(
// // //                       color: Color(0xFFE91E63).withOpacity(0.05),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         ),
// // //         AnimatedBuilder(
// // //           animation: _floatingAnimation,
// // //           builder: (context, child) {
// // //             return Positioned(
// // //               top: 200 - _floatingAnimation.value,
// // //               left: 10,
// // //               child: Container(
// // //                 width: 80,
// // //                 height: 80,
// // //                 decoration: BoxDecoration(
// // //                   shape: BoxShape.circle,
// // //                   color: Color(0xFFE91E63).withOpacity(0.08),
// // //                 ),
// // //                 child: ClipOval(
// // //                   child: BackdropFilter(
// // //                     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
// // //                     child: Container(
// // //                       color: Color(0xFFE91E63).withOpacity(0.03),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         ),
// // //         AnimatedBuilder(
// // //           animation: _floatingAnimation,
// // //           builder: (context, child) {
// // //             return Positioned(
// // //               bottom: 120 + _floatingAnimation.value * 0.5,
// // //               right: 40,
// // //               child: Container(
// // //                 width: 100,
// // //                 height: 100,
// // //                 decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(30),
// // //                   color: Color(0xFFE91E63).withOpacity(0.06),
// // //                 ),
// // //                 child: ClipRRect(
// // //                   borderRadius: BorderRadius.circular(30),
// // //                   child: BackdropFilter(
// // //                     filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
// // //                     child: Container(
// // //                       color: Color(0xFFE91E63).withOpacity(0.02),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             );
// // //           },
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildMainContent() {
// // //     return Container(
// // //       constraints: BoxConstraints(maxWidth: 400),
// // //       decoration: BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.circular(24),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black.withOpacity(0.08),
// // //             blurRadius: 32,
// // //             offset: Offset(0, 16),
// // //           ),
// // //         ],
// // //       ),
// // //       child: ClipRRect(
// // //         borderRadius: BorderRadius.circular(24),
// // //         child: BackdropFilter(
// // //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // //           child: Container(
// // //             padding: EdgeInsets.all(32),
// // //             decoration: BoxDecoration(
// // //               color: Colors.white.withOpacity(0.95),
// // //             ),
// // //             child: Form(
// // //               key: _formKey,
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // //                 children: [
// // //                   // Header
// // //                   _buildHeader(),
// // //                   SizedBox(height: 40),
                  
// // //                   // Signup Form
// // //                   _buildSignupForm(),
// // //                   SizedBox(height: 20),
                  
// // //                   // Terms & Conditions
// // //                   _buildTermsAcceptance(),
// // //                   SizedBox(height: 28),
                  
// // //                   // Signup Button
// // //                   _buildSignupButton(),
// // //                   SizedBox(height: 32),
                  
// // //                   // Divider
// // //                   _buildDivider(),
// // //                   SizedBox(height: 32),
                  
// // //                   // Social Login
// // //                   _buildSocialLogin(),
// // //                   SizedBox(height: 28),
                  
// // //                   // Login Link
// // //                   _buildLoginLink(),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildHeader() {
// // //     return Column(
// // //       children: [
// // //         // Logo
// // //         Container(
// // //           width: 80,
// // //           height: 80,
// // //           decoration: BoxDecoration(
// // //             color: Color(0xFFE91E63),
// // //             shape: BoxShape.circle,
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Color(0xFFE91E63).withOpacity(0.3),
// // //                 blurRadius: 24,
// // //                 offset: Offset(0, 12),
// // //               ),
// // //             ],
// // //           ),
// // //           child: Icon(
// // //             Icons.person_add,
// // //             size: 40,
// // //             color: Colors.white,
// // //           ),
// // //         ),
// // //         SizedBox(height: 24),
        
// // //         // App Name
// // //         Text(
// // //           "HOPZY",
// // //           style: TextStyle(
// // //             fontSize: 32,
// // //             fontWeight: FontWeight.w800,
// // //             color: Colors.black,
// // //             letterSpacing: 1.5,
// // //           ),
// // //         ),
// // //         SizedBox(height: 8),
        
// // //         // Tagline
// // //         Text(
// // //           "Connect • Meet • Explore Together",
// // //           style: TextStyle(
// // //             fontSize: 15,
// // //             color: Colors.grey[600],
// // //             fontWeight: FontWeight.w500,
// // //             letterSpacing: 0.5,
// // //           ),
// // //         ),
// // //         SizedBox(height: 12),
        
// // //         // Welcome Text
// // //         Text(
// // //           "Create your account to start your journey!",
// // //           textAlign: TextAlign.center,
// // //           style: TextStyle(
// // //             fontSize: 14,
// // //             color: Colors.grey[500],
// // //             fontWeight: FontWeight.w400,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildSignupForm() {
// // //     return Column(
// // //       children: [
// // //         // Name Field
// // //         _buildTextField(
// // //           controller: _nameController,
// // //           label: "Full Name",
// // //           hint: "Enter your full name",
// // //           icon: Icons.person_outlined,
// // //           validator: (val) {
// // //             if (val == null || val.isEmpty) {
// // //               return "Please enter your name";
// // //             }
// // //             return null;
// // //           },
// // //         ),
// // //         SizedBox(height: 20),
        
// // //         // Email Field
// // //         _buildTextField(
// // //           controller: _emailController,
// // //           label: "Email Address",
// // //           hint: "Enter your email",
// // //           icon: Icons.email_outlined,
// // //           keyboardType: TextInputType.emailAddress,
// // //           validator: (val) {
// // //             if (val == null || val.isEmpty) {
// // //               return "Please enter your email";
// // //             }
// // //             if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
// // //               return "Please enter a valid email";
// // //             }
// // //             return null;
// // //           },
// // //         ),
// // //         SizedBox(height: 20),
        
// // //         // Password Field
// // //         _buildTextField(
// // //           controller: _passwordController,
// // //           label: "Password",
// // //           hint: "Enter your password",
// // //           icon: Icons.lock_outlined,
// // //           isPassword: true,
// // //           isPasswordVisible: _isPasswordVisible,
// // //           onPasswordToggle: () {
// // //             setState(() {
// // //               _isPasswordVisible = !_isPasswordVisible;
// // //             });
// // //           },
// // //           validator: (val) {
// // //             if (val == null || val.isEmpty) {
// // //               return "Please enter your password";
// // //             }
// // //             if (val.length < 6) {
// // //               return "Password must be at least 6 characters";
// // //             }
// // //             return null;
// // //           },
// // //         ),
// // //         SizedBox(height: 20),
        
// // //         // Confirm Password Field
// // //         _buildTextField(
// // //           controller: _confirmPasswordController,
// // //           label: "Confirm Password",
// // //           hint: "Confirm your password",
// // //           icon: Icons.lock_outlined,
// // //           isPassword: true,
// // //           isPasswordVisible: _isConfirmPasswordVisible,
// // //           onPasswordToggle: () {
// // //             setState(() {
// // //               _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
// // //             });
// // //           },
// // //           validator: (val) {
// // //             if (val == null || val.isEmpty) {
// // //               return "Please confirm your password";
// // //             }
// // //             if (val != _passwordController.text) {
// // //               return "Passwords don't match";
// // //             }
// // //             return null;
// // //           },
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildTextField({
// // //     required TextEditingController controller,
// // //     required String label,
// // //     required String hint,
// // //     required IconData icon,
// // //     bool isPassword = false,
// // //     bool isPasswordVisible = false,
// // //     VoidCallback? onPasswordToggle,
// // //     TextInputType? keyboardType,
// // //     String? Function(String?)? validator,
// // //   }) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Text(
// // //           label,
// // //           style: TextStyle(
// // //             fontSize: 15,
// // //             fontWeight: FontWeight.w600,
// // //             color: Colors.grey[800],
// // //           ),
// // //         ),
// // //         SizedBox(height: 8),
// // //         Container(
// // //           decoration: BoxDecoration(
// // //             color: Colors.grey[50],
// // //             borderRadius: BorderRadius.circular(16),
// // //             border: Border.all(color: Colors.grey[200]!, width: 1),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Colors.black.withOpacity(0.04),
// // //                 blurRadius: 8,
// // //                 offset: Offset(0, 2),
// // //               ),
// // //             ],
// // //           ),
// // //           child: TextFormField(
// // //             controller: controller,
// // //             keyboardType: keyboardType,
// // //             obscureText: isPassword && !isPasswordVisible,
// // //             style: TextStyle(
// // //               fontSize: 16,
// // //               color: Colors.grey[900],
// // //               fontWeight: FontWeight.w500,
// // //             ),
// // //             decoration: InputDecoration(
// // //               hintText: hint,
// // //               hintStyle: TextStyle(
// // //                 color: Colors.grey[400],
// // //                 fontSize: 16,
// // //                 fontWeight: FontWeight.w400,
// // //               ),
// // //               prefixIcon: Container(
// // //                 margin: EdgeInsets.all(12),
// // //                 padding: EdgeInsets.all(8),
// // //                 decoration: BoxDecoration(
// // //                   color: Color(0xFFE91E63).withOpacity(0.1),
// // //                   borderRadius: BorderRadius.circular(10),
// // //                 ),
// // //                 child: Icon(icon, color: Color(0xFFE91E63), size: 20),
// // //               ),
// // //               suffixIcon: isPassword
// // //                   ? IconButton(
// // //                       icon: Icon(
// // //                         isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
// // //                         color: Colors.grey[500],
// // //                         size: 20,
// // //                       ),
// // //                       onPressed: onPasswordToggle,
// // //                     )
// // //                   : null,
// // //               border: OutlineInputBorder(
// // //                 borderRadius: BorderRadius.circular(16),
// // //                 borderSide: BorderSide.none,
// // //               ),
// // //               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
// // //             ),
// // //             validator: validator,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildTermsAcceptance() {
// // //     return Row(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Transform.scale(
// // //           scale: 0.9,
// // //           child: Checkbox(
// // //             value: _acceptTerms,
// // //             onChanged: (value) {
// // //               setState(() {
// // //                 _acceptTerms = value ?? false;
// // //               });
// // //             },
// // //             activeColor: Color(0xFFE91E63),
// // //             shape: RoundedRectangleBorder(
// // //               borderRadius: BorderRadius.circular(4),
// // //             ),
// // //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// // //           ),
// // //         ),
// // //         Expanded(
// // //           child: Padding(
// // //             padding: EdgeInsets.only(top: 12),
// // //             child: RichText(
// // //               text: TextSpan(
// // //                 style: TextStyle(
// // //                   color: Colors.grey[600],
// // //                   fontSize: 14,
// // //                   fontWeight: FontWeight.w400,
// // //                 ),
// // //                 children: [
// // //                   TextSpan(text: "I agree to the "),
// // //                   TextSpan(
// // //                     text: "Terms of Service",
// // //                     style: TextStyle(
// // //                       color: Color(0xFFE91E63),
// // //                       fontWeight: FontWeight.w600,
// // //                     ),
// // //                   ),
// // //                   TextSpan(text: " and "),
// // //                   TextSpan(
// // //                     text: "Privacy Policy",
// // //                     style: TextStyle(
// // //                       color: Color(0xFFE91E63),
// // //                       fontWeight: FontWeight.w600,
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildSignupButton() {
// // //     return Container(
// // //       width: double.infinity,
// // //       height: 56,
// // //       decoration: BoxDecoration(
// // //         color: Color(0xFFE91E63),
// // //         borderRadius: BorderRadius.circular(16),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Color(0xFFE91E63).withOpacity(0.3),
// // //             blurRadius: 16,
// // //             offset: Offset(0, 8),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Material(
// // //         color: Colors.transparent,
// // //         child: InkWell(
// // //           onTap: _isLoading ? null : _handleSignup,
// // //           borderRadius: BorderRadius.circular(16),
// // //           child: Center(
// // //             child: _isLoading
// // //                 ? SizedBox(
// // //                     height: 24,
// // //                     width: 24,
// // //                     child: CircularProgressIndicator(
// // //                       strokeWidth: 2.5,
// // //                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
// // //                     ),
// // //                   )
// // //                 : Text(
// // //                     "Create HOPZY Account",
// // //                     style: TextStyle(
// // //                       fontSize: 17,
// // //                       fontWeight: FontWeight.w600,
// // //                       color: Colors.white,
// // //                       letterSpacing: 0.3,
// // //                     ),
// // //                   ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDivider() {
// // //     return Row(
// // //       children: [
// // //         Expanded(
// // //           child: Container(
// // //             height: 1,
// // //             color: Colors.grey[200],
// // //           ),
// // //         ),
// // //         Padding(
// // //           padding: EdgeInsets.symmetric(horizontal: 20),
// // //           child: Text(
// // //             "OR CONTINUE WITH",
// // //             style: TextStyle(
// // //               color: Colors.grey[500],
// // //               fontSize: 12,
// // //               fontWeight: FontWeight.w600,
// // //               letterSpacing: 1,
// // //             ),
// // //           ),
// // //         ),
// // //         Expanded(
// // //           child: Container(
// // //             height: 1,
// // //             color: Colors.grey[200],
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildSocialLogin() {
// // //     return Row(
// // //       children: [
// // //         Expanded(
// // //           child: _buildSocialButton(
// // //             "Google",
// // //             Icons.g_mobiledata,
// // //             Colors.white,
// // //             Colors.grey[700]!,
// // //           ),
// // //         ),
// // //         SizedBox(width: 16),
// // //         Expanded(
// // //           child: _buildSocialButton(
// // //             "Apple",
// // //             Icons.apple,
// // //             Colors.black,
// // //             Colors.white,
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildSocialButton(String provider, IconData icon, Color bgColor, Color contentColor) {
// // //     return Container(
// // //       height: 52,
// // //       decoration: BoxDecoration(
// // //         color: bgColor,
// // //         borderRadius: BorderRadius.circular(16),
// // //         border: Border.all(color: Colors.grey[200]!, width: 1),
// // //         boxShadow: [
// // //           BoxShadow(
// // //             color: Colors.black.withOpacity(0.04),
// // //             blurRadius: 8,
// // //             offset: Offset(0, 2),
// // //           ),
// // //         ],
// // //       ),
// // //       child: Material(
// // //         color: Colors.transparent,
// // //         child: InkWell(
// // //           onTap: () => _handleSocialLogin(provider),
// // //           borderRadius: BorderRadius.circular(16),
// // //           child: Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               Icon(icon, color: contentColor, size: 24),
// // //               SizedBox(width: 8),
// // //               Text(
// // //                 provider,
// // //                 style: TextStyle(
// // //                   color: contentColor,
// // //                   fontWeight: FontWeight.w600,
// // //                   fontSize: 15,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildLoginLink() {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       children: [
// // //         Text(
// // //           "Already have an account? ",
// // //           style: TextStyle(
// // //             color: Colors.grey[600],
// // //             fontSize: 15,
// // //             fontWeight: FontWeight.w400,
// // //           ),
// // //         ),
// // //         TextButton(
// // //           onPressed: () {
// // //             Navigator.pop(context);
// // //           },
// // //           style: TextButton.styleFrom(
// // //             padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
// // //           ),
// // //           child: Text(
// // //             "Sign In",
// // //             style: TextStyle(
// // //               color: Color(0xFFE91E63),
// // //               fontSize: 15,
// // //               fontWeight: FontWeight.w600,
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Future<void> _handleSignup() async {
// // //     if (!_formKey.currentState!.validate()) {
// // //       return;
// // //     }

// // //     if (!_acceptTerms) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text("Please accept the Terms of Service and Privacy Policy"),
// // //           backgroundColor: Colors.red,
// // //           behavior: SnackBarBehavior.floating,
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(12),
// // //           ),
// // //         ),
// // //       );
// // //       return;
// // //     }

// // //     setState(() {
// // //       _isLoading = true;
// // //     });

// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse('https://hopzy-backend.onrender.com/api/auth/signup'),
// // //         headers: {'Content-Type': 'application/json'},
// // //         body: json.encode({
// // //           'name': _nameController.text.trim(),
// // //           'email': _emailController.text.trim(),
// // //           'password': _passwordController.text,
// // //         }),
// // //       );

// // //       if (response.statusCode == 200 || response.statusCode == 201) {
// // //         final responseData = json.decode(response.body);
        
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(
// // //             content: Text("Account created successfully! Welcome to HOPZY! 🎉"),
// // //             backgroundColor: Color(0xFFE91E63),
// // //             behavior: SnackBarBehavior.floating,
// // //             shape: RoundedRectangleBorder(
// // //               borderRadius: BorderRadius.circular(12),
// // //             ),
// // //           ),
// // //         );

// // //         // Navigate to dashboard
// // //         Navigator.pushReplacement(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => DashboardScreen(),
// // //           ),
// // //         );
// // //       } else {
// // //         final errorData = json.decode(response.body);
// // //         throw Exception(errorData['message'] ?? 'Signup failed');
// // //       }
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text("Signup failed: ${e.toString().replaceFirst('Exception: ', '')}"),
// // //           backgroundColor: Colors.red,
// // //           behavior: SnackBarBehavior.floating,
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(12),
// // //           ),
// // //         ),
// // //       );
// // //     } finally {
// // //       setState(() {
// // //         _isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   void _handleSocialLogin(String provider) {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text("$provider signup integration coming soon! 🚀"),
// // //         backgroundColor: Color(0xFFE91E63),
// // //         behavior: SnackBarBehavior.floating,
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(12),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }














// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'login.dart'; // Import your login screen

// // class SignupScreen extends StatefulWidget {
// //   @override
// //   _SignupScreenState createState() => _SignupScreenState();
// // }

// // class _SignupScreenState extends State<SignupScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
  
// //   bool _isLoading = false;
// //   bool _obscurePassword = true;

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     _passwordController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _signup() async {
// //     if (!_formKey.currentState!.validate()) return;

// //     setState(() {
// //       _isLoading = true;
// //     });

// //     try {
// //       final response = await http.post(
// //         Uri.parse('https://hopzy-backend.onrender.com/api/auth/signup'),
// //         headers: {
// //           'Content-Type': 'application/json',
// //         },
// //         body: json.encode({
// //           'name': _nameController.text.trim(),
// //           'email': _emailController.text.trim(),
// //           'password': _passwordController.text.trim(),
// //         }),
// //       );

// //       final data = json.decode(response.body);

// //       if (response.statusCode == 201) {
// //         // Success
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text('Account created successfully!'),
// //             backgroundColor: Colors.green,
// //           ),
// //         );
        
// //         // Navigate to login screen
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => LoginScreen()),
// //         );
// //       } else {
// //         // Error
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text(data['message'] ?? 'Signup failed'),
// //             backgroundColor: Colors.red,
// //           ),
// //         );
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Network error. Please try again.'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     } finally {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 SizedBox(height: 40),
                
// //                 // Header
// //                 Center(
// //                   child: Column(
// //                     children: [
// //                       Icon(
// //                         Icons.person_add_rounded,
// //                         size: 80,
// //                         color: Colors.blue,
// //                       ),
// //                       SizedBox(height: 16),
// //                       Text(
// //                         'Create Account',
// //                         style: TextStyle(
// //                           fontSize: 28,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.black87,
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         'Sign up to get started',
// //                         style: TextStyle(
// //                           fontSize: 16,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
                
// //                 SizedBox(height: 40),
                
// //                 // Name Field
// //                 TextFormField(
// //                   controller: _nameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Full Name',
// //                     hintText: 'Enter your full name',
// //                     prefixIcon: Icon(Icons.person_outline),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide: BorderSide(color: Colors.blue, width: 2),
// //                     ),
// //                   ),
// //                   validator: (value) {
// //                     if (value == null || value.trim().isEmpty) {
// //                       return 'Please enter your name';
// //                     }
// //                     if (value.trim().length < 2) {
// //                       return 'Name must be at least 2 characters';
// //                     }
// //                     return null;
// //                   },
// //                 ),
                
// //                 SizedBox(height: 20),
                
// //                 // Email Field
// //                 TextFormField(
// //                   controller: _emailController,
// //                   keyboardType: TextInputType.emailAddress,
// //                   decoration: InputDecoration(
// //                     labelText: 'Email',
// //                     hintText: 'Enter your email',
// //                     prefixIcon: Icon(Icons.email_outlined),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide: BorderSide(color: Colors.blue, width: 2),
// //                     ),
// //                   ),
// //                   validator: (value) {
// //                     if (value == null || value.trim().isEmpty) {
// //                       return 'Please enter your email';
// //                     }
// //                     if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
// //                       return 'Please enter a valid email';
// //                     }
// //                     return null;
// //                   },
// //                 ),
                
// //                 SizedBox(height: 20),
                
// //                 // Password Field
// //                 TextFormField(
// //                   controller: _passwordController,
// //                   obscureText: _obscurePassword,
// //                   decoration: InputDecoration(
// //                     labelText: 'Password',
// //                     hintText: 'Enter your password',
// //                     prefixIcon: Icon(Icons.lock_outline),
// //                     suffixIcon: IconButton(
// //                       icon: Icon(
// //                         _obscurePassword ? Icons.visibility_off : Icons.visibility,
// //                       ),
// //                       onPressed: () {
// //                         setState(() {
// //                           _obscurePassword = !_obscurePassword;
// //                         });
// //                       },
// //                     ),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                       borderSide: BorderSide(color: Colors.blue, width: 2),
// //                     ),
// //                   ),
// //                   validator: (value) {
// //                     if (value == null || value.trim().isEmpty) {
// //                       return 'Please enter a password';
// //                     }
// //                     if (value.trim().length < 3) {
// //                       return 'Password must be at least 3 characters';
// //                     }
// //                     return null;
// //                   },
// //                 ),
                
// //                 SizedBox(height: 32),
                
// //                 // Signup Button
// //                 SizedBox(
// //                   width: double.infinity,
// //                   height: 50,
// //                   child: ElevatedButton(
// //                     onPressed: _isLoading ? null : _signup,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.blue,
// //                       foregroundColor: Colors.white,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       elevation: 2,
// //                     ),
// //                     child: _isLoading
// //                         ? CircularProgressIndicator(
// //                             color: Colors.white,
// //                             strokeWidth: 2,
// //                           )
// //                         : Text(
// //                             'Sign Up',
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                   ),
// //                 ),
                
// //                 SizedBox(height: 24),
                
// //                 // Login Navigation
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Text(
// //                       'Already have an account? ',
// //                       style: TextStyle(
// //                         color: Colors.grey[600],
// //                         fontSize: 14,
// //                       ),
// //                     ),
// //                     GestureDetector(
// //                       onTap: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => LoginScreen()),
// //                         );
// //                       },
// //                       child: Text(
// //                         'Login',
// //                         style: TextStyle(
// //                           color: Colors.blue,
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }







// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final _formKey = GlobalKey<FormState>();

//   String fullName = '';
//   String email = '';
//   String phoneNumber = '';
//   String password = '';
//   String city = '';
//   String? gender;
//   int? ageGroup;
//   List<String> travelInterests = [];
//   String? signupMethod;

//   List<String> genders = ['Male', 'Female', 'Other'];
//   List<String> signupMethods = ['email', 'phone', 'google'];
//   List<String> interestsOptions = [
//     'Adventure',
//     'Food',
//     'History',
//     'Mountains',
//     'Beach'
//   ];

//   bool isLoading = false;

//   Future<void> signup() async {
//     if (!_formKey.currentState!.validate()) return;
//     _formKey.currentState!.save();

//     setState(() => isLoading = true);

//     final url = Uri.parse('http://localhost:5000/api/auth/signup');

//     final body = jsonEncode({
//       'full_name': fullName,
//       'email': email,
//       'phone_number': phoneNumber,
//       'password': password,
//       'city': city,
//       'gender': gender,
//       'age_group': ageGroup,
//       'travel_interests': travelInterests,
//       'signup_method': signupMethod
//     });

//     try {
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: body,
//       );

//       final data = jsonDecode(response.body);

//       if (response.statusCode == 201) {
//         // Success
//         showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             title: const Text('Success'),
//             content: Text(data['message']),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               )
//             ],
//           ),
//         );
//       } else {
//         // Error
//         showDialog(
//           context: context,
//           builder: (_) => AlertDialog(
//             title: const Text('Error'),
//             content: Text(data['message'] ?? 'Unknown error'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('OK'),
//               )
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       print('Signup error: $e');
//     } finally {
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Signup')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Full Name'),
//                 validator: (val) => val!.isEmpty ? 'Required' : null,
//                 onSaved: (val) => fullName = val!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 validator: (val) =>
//                     val!.isEmpty || !val.contains('@') ? 'Invalid email' : null,
//                 onSaved: (val) => email = val!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone,
//                 onSaved: (val) => phoneNumber = val ?? '',
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (val) =>
//                     val!.length < 6 ? 'At least 6 characters' : null,
//                 onSaved: (val) => password = val!,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'City'),
//                 onSaved: (val) => city = val ?? '',
//               ),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(labelText: 'Gender'),
//                 items: genders
//                     .map((g) => DropdownMenuItem(value: g, child: Text(g)))
//                     .toList(),
//                 onChanged: (val) => setState(() => gender = val),
//                 validator: (val) => val == null ? 'Select gender' : null,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Age'),
//                 keyboardType: TextInputType.number,
//                 validator: (val) {
//                   if (val == null || val.isEmpty) return 'Enter age';
//                   if (int.tryParse(val) == null) return 'Invalid age';
//                   if (int.parse(val) < 13) return 'Must be 13 or older';
//                   return null;
//                 },
//                 onSaved: (val) => ageGroup = int.parse(val!),
//               ),
//               const SizedBox(height: 10),
//               Wrap(
//                 spacing: 8,
//                 children: interestsOptions
//                     .map((i) => FilterChip(
//                           label: Text(i),
//                           selected: travelInterests.contains(i),
//                           onSelected: (selected) {
//                             setState(() {
//                               if (selected) {
//                                 travelInterests.add(i);
//                               } else {
//                                 travelInterests.remove(i);
//                               }
//                             });
//                           },
//                         ))
//                     .toList(),
//               ),
//               const SizedBox(height: 16),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(labelText: 'Signup Method'),
//                 items: signupMethods
//                     .map((s) => DropdownMenuItem(value: s, child: Text(s)))
//                     .toList(),
//                 onChanged: (val) => setState(() => signupMethod = val),
//                 validator: (val) => val == null ? 'Select signup method' : null,
//               ),
//               const SizedBox(height: 20),
//               isLoading
//                   ? const CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: signup,
//                       child: const Text('Sign Up'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
























import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'dart:convert';
import '../../utils/constants.dart';
import '../dashboard_tabs/home/home_page.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  
  // Form Controllers
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cityController = TextEditingController();
  final _ageController = TextEditingController();

  // Form Values
  String? gender;
  List<String> travelInterests = [];
  String? signupMethod;
  bool _isPasswordVisible = false;
  bool isLoading = false;
  int currentPage = 0;

  // Animation Controllers
  late AnimationController _animationController;
  late AnimationController _floatingController;
  late AnimationController _planeController;
  late AnimationController _rotationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _planeAnimation;
  late Animation<double> _rotationAnimation;

  // Data Lists
  List<String> genders = ['Male', 'Female', 'Other'];
  List<String> signupMethods = ['email', 'phone', 'google'];
  List<String> interestsOptions = [
    'Adventure',
    'Food', 
    'History',
    'Mountains',
    'Beach',
    'Culture',
    'Photography',
    'Wildlife'
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _floatingController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    
    _planeController = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    )..repeat();
    
    _rotationController = AnimationController(
      duration: Duration(seconds: 8),
      vsync: this,
    )..repeat();
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _floatingAnimation = Tween<double>(begin: -15.0, end: 15.0).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
    
    _rotationAnimation = Tween<double>(begin: 0.0, end: 6.28).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );
    
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    _planeAnimation = Tween<double>(
      begin: -100.0, 
      end: screenWidth + 100
    ).animate(
      CurvedAnimation(parent: _planeController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _cityController.dispose();
    _ageController.dispose();
    _pageController.dispose();
    _animationController.dispose();
    _floatingController.dispose();
    _planeController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  Future<void> signup() async {
  if (!_formKey.currentState!.validate()) return;

  _formKey.currentState!.save();
  setState(() => isLoading = true);

  final body = jsonEncode({
    'full_name': _fullNameController.text.trim(),
    'email': _emailController.text.trim().toLowerCase(),
    'phone_number': _phoneController.text.trim(),
    'password': _passwordController.text.trim(),
    'city': _cityController.text.trim(),
    'gender': gender,
    'age_group': int.tryParse(_ageController.text.trim()),
    'travel_interests': travelInterests,
    'signup_method': signupMethod,
  });

  try {
    final response = await http.post(
      Uri.parse(API.SIGNUP),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    print("Response code: ${response.statusCode}");
    print("Response body: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 201 || data['message'] == 'User created successfully') {
      _showSnackBar('Welcome to HOPZY! Account created successfully! ✈️', isSuccess: true);
      // Navigate to HomeScreen directly after signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen(user: data['user'])),
      );
    } else {
      _showSnackBar(data['message'] ?? 'Signup failed. Please try again.');
    }
  } catch (e) {
    _showSnackBar('Network error. Please check your connection.');
    print('Signup error: $e');
  } finally {
    setState(() => isLoading = false);
  }
}


  void _showSnackBar(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Color(0xFF2C5F5D) : Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _nextPage() {
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8F5E8), // Light green sky
              Color(0xFFE3F2FD), // Light blue
              Color(0xFFFFE0B2), // Light orange
              Color(0xFFFFF3E0), // Very light orange at bottom
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              _buildTravelBackground(),
              _buildEnhancedAnimatedPlane(),
              _buildFloatingElements(),
              FadeTransition(
                opacity: _fadeAnimation,
                child: AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Column(
                        children: [
                          _buildHeader(),
                          Expanded(
                            child: _buildMainContent(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTravelBackground() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Stack(
      children: [
        // Enhanced Mountains with more layers
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.4),
            painter: MountainPainter(
              color: Color(0xFF4A90A4).withOpacity(0.2),
              peaks: [0.4, 0.7, 0.3, 0.8, 0.5, 0.6],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.35),
            painter: MountainPainter(
              color: Color(0xFF2C5F5D).withOpacity(0.3),
              peaks: [0.6, 0.4, 0.8, 0.3, 0.7, 0.4],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.3),
            painter: MountainPainter(
              color: Color(0xFF2C5F5D).withOpacity(0.5),
              peaks: [0.3, 0.6, 0.4, 0.7, 0.3, 0.5],
            ),
          ),
        ),
        
        _buildClouds(),
        _buildTravelIcons(),
      ],
    );
  }

  Widget _buildClouds() {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 80 + _floatingAnimation.value * 0.3,
              left: 40,
              child: CustomPaint(
                size: Size(90, 45),
                painter: CloudPainter(color: Colors.white.withOpacity(0.8)),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 140 - _floatingAnimation.value * 0.4,
              right: 50,
              child: CustomPaint(
                size: Size(110, 55),
                painter: CloudPainter(color: Colors.white.withOpacity(0.7)),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 200 + _floatingAnimation.value * 0.2,
              left: 15,
              child: CustomPaint(
                size: Size(70, 35),
                painter: CloudPainter(color: Colors.white.withOpacity(0.6)),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEnhancedAnimatedPlane() {
    return AnimatedBuilder(
      animation: Listenable.merge([_planeAnimation, _floatingAnimation]),
      builder: (context, child) {
        // Calculate realistic flight path with altitude variation
        final progress = (_planeController.value * 2) % 2;
        final altitude = progress < 1 
            ? 100 + (progress * 60) + (_floatingAnimation.value * 5)
            : 160 - ((progress - 1) * 60) + (_floatingAnimation.value * 5);
        
        // Realistic banking angle based on flight path
        final bankingAngle = progress < 1 
            ? -0.1 - (progress * 0.3) 
            : -0.4 + ((progress - 1) * 0.3);
        
        return Positioned(
          top: altitude,
          left: _planeAnimation.value,
          child: Transform.rotate(
            angle: bankingAngle,
            child: Container(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Main airplane
                  Icon(
                    Icons.airplanemode_active,
                    size: 28,
                    color: Color(0xFFFF8A00),
                  ),
                  // Contrail/vapor trail
                  Positioned(
                    left: -40,
                    top: 10,
                    child: Container(
                      width: 35,
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.7),
                            Colors.transparent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                  ),
                  // Wing tip contrails
                  Positioned(
                    left: -30,
                    top: 5,
                    child: Container(
                      width: 25,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(0.5),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    top: 15,
                    child: Container(
                      width: 25,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTravelIcons() {
    return Stack(
      children: [
        // Enhanced travel icons with more variety
        AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Positioned(
              bottom: 220 + (_floatingAnimation.value * 0.3),
              left: 25,
              child: Transform.rotate(
                angle: _rotationAnimation.value * 0.1,
                child: Icon(
                  Icons.luggage,
                  size: 26,
                  color: Color(0xFFFF8A00).withOpacity(0.6),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 160,
              right: 35,
              child: Transform.translate(
                offset: Offset(0, -_floatingAnimation.value * 0.4),
                child: Icon(
                  Icons.camera_alt,
                  size: 22,
                  color: Color(0xFF2C5F5D).withOpacity(0.5),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              bottom: 180,
              right: 70,
              child: Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.5),
                child: Icon(
                  Icons.map,
                  size: 20,
                  color: Color(0xFF4A90A4).withOpacity(0.4),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 240,
              left: 70,
              child: Transform.translate(
                offset: Offset(0, -_floatingAnimation.value * 0.6),
                child: Icon(
                  Icons.explore,
                  size: 24,
                  color: Color(0xFFFF8A00).withOpacity(0.4),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              bottom: 160,
              left: 90,
              child: Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.3),
                child: Icon(
                  Icons.landscape,
                  size: 18,
                  color: Color(0xFF2C5F5D).withOpacity(0.3),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFloatingElements() {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 70 + _floatingAnimation.value,
              right: 15,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFFFF8A00).withOpacity(0.12),
                      Color(0xFFFF8A00).withOpacity(0.03),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(
                      color: Color(0xFFFF8A00).withOpacity(0.02),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 190 - _floatingAnimation.value,
              left: 5,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF4A90A4).withOpacity(0.1),
                      Color(0xFF4A90A4).withOpacity(0.02),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: Color(0xFF4A90A4).withOpacity(0.01),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF2C5F5D),
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF2C5F5D),
                              Color(0xFF4A90A4),
                              Color(0xFFFF8A00),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF2C5F5D).withOpacity(0.3),
                              blurRadius: 20,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.travel_explore,
                          size: 28,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Color(0xFF2C5F5D), Color(0xFFFF8A00)],
                        ).createShader(bounds),
                        child: Text(
                          "HOPZY",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 48), // Balance the back button
            ],
          ),
          SizedBox(height: 16),
          Text(
            "Join the Adventure!",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C5F5D),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Create your account to explore amazing destinations",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Column(
              children: [
                _buildProgressIndicator(),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => currentPage = index);
                      },
                      children: [
                        _buildPersonalInfoPage(),
                        _buildPreferencesPage(),
                        _buildAccountSetupPage(),
                      ],
                    ),
                  ),
                ),
                _buildNavigationButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: 4,
                decoration: BoxDecoration(
                  color: i <= currentPage 
                      ? Color(0xFF2C5F5D) 
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C5F5D),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Tell us about yourself",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          
          _buildTextField(
            controller: _fullNameController,
            label: "Full Name",
            hint: "Enter your full name",
            icon: Icons.person_outline,
            validator: (val) => val!.isEmpty ? 'Full name is required' : null,
          ),
          SizedBox(height: 20),
          
          _buildTextField(
            controller: _emailController,
            label: "Email Address",
            hint: "Enter your email",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: (val) {
              if (val!.isEmpty) return 'Email is required';
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          
          _buildTextField(
            controller: _phoneController,
            label: "Phone Number",
            hint: "Enter your phone number",
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          
          _buildTextField(
            controller: _cityController,
            label: "City",
            hint: "Enter your city",
            icon: Icons.location_city_outlined,
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildPreferencesPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Travel Preferences",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C5F5D),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Help us personalize your experience",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          
          _buildDropdownField(
            label: "Gender",
            value: gender,
            items: genders,
            onChanged: (val) => setState(() => gender = val),
            validator: (val) => val == null ? 'Please select your gender' : null,
          ),
          SizedBox(height: 20),
          
          _buildTextField(
            controller: _ageController,
            label: "Age",
            hint: "Enter your age",
            icon: Icons.cake_outlined,
            keyboardType: TextInputType.number,
            validator: (val) {
              if (val == null || val.isEmpty) return 'Age is required';
              final age = int.tryParse(val);
              if (age == null) return 'Please enter a valid age';
              if (age < 13) return 'You must be at least 13 years old';
              return null;
            },
          ),
          SizedBox(height: 20),
          
          Text(
            "Travel Interests",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: interestsOptions.map((interest) {
              final isSelected = travelInterests.contains(interest);
              return FilterChip(
                label: Text(interest),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      travelInterests.add(interest);
                    } else {
                      travelInterests.remove(interest);
                    }
                  });
                },
                backgroundColor: Colors.grey[100],
                selectedColor: Color(0xFF2C5F5D).withOpacity(0.2),
                checkmarkColor: Color(0xFF2C5F5D),
                labelStyle: TextStyle(
                  color: isSelected ? Color(0xFF2C5F5D) : Colors.grey[700],
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildAccountSetupPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account Setup",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C5F5D),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Secure your account",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 24),
          
          _buildTextField(
            controller: _passwordController,
            label: "Password",
            hint: "Create a strong password",
            icon: Icons.lock_outlined,
            isPassword: true,
            isPasswordVisible: _isPasswordVisible,
            onPasswordToggle: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            validator: (val) {
              if (val!.length < 6) return 'Password must be at least 6 characters';
              return null;
            },
          ),
          SizedBox(height: 20),
          
          _buildDropdownField(
            label: "Signup Method",
            value: signupMethod,
            items: signupMethods,
            onChanged: (val) => setState(() => signupMethod = val),
            validator: (val) => val == null ? 'Please select a signup method' : null,
          ),
          SizedBox(height: 32),
          
          // Terms and Privacy
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF2C5F5D).withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "By creating an account, you agree to our Terms of Service and Privacy Policy. Your data will be used to enhance your travel experience.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onPasswordToggle,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: isPassword && !isPasswordVisible,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[900],
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2C5F5D).withOpacity(0.1),
                      Color(0xFFFF8A00).withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Color(0xFF2C5F5D), size: 20),
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey[500],
                        size: 20,
                      ),
                      onPressed: onPasswordToggle,
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            ),
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Color(0xFF2C5F5D),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          if (currentPage > 0)
            Expanded(
              child: Container(
                height: 52,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _previousPage,
                    borderRadius: BorderRadius.circular(16),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back, color: Colors.grey[700], size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Previous",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            flex: currentPage > 0 ? 1 : 1,
            child: Container(
              height: 52,
              margin: EdgeInsets.only(left: currentPage > 0 ? 8 : 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2C5F5D), Color(0xFF4A90A4), Color(0xFFFF8A00)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF2C5F5D).withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (currentPage < 2) {
                      _nextPage();
                    } else {
                      signup();
                    }
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Center(
                    child: isLoading && currentPage == 2
                        ? SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                currentPage < 2 ? "Continue" : "Create Account",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                currentPage < 2 ? Icons.arrow_forward : Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Mountains - Enhanced
class MountainPainter extends CustomPainter {
  final Color color;
  final List<double> peaks;

  MountainPainter({required this.color, required this.peaks});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    final peakWidth = size.width / (peaks.length - 1);
    
    for (int i = 0; i < peaks.length; i++) {
      final x = i * peakWidth;
      final peakHeight = size.height * peaks[i];
      
      if (i == 0) {
        path.lineTo(x, size.height - peakHeight);
      } else if (i == peaks.length - 1) {
        path.lineTo(x, size.height - peakHeight);
      } else {
        // Add some randomness to make mountains more realistic
        final controlX1 = x - peakWidth * 0.3;
        final controlY1 = size.height - peakHeight * 0.7;
        final controlX2 = x - peakWidth * 0.1;
        final controlY2 = size.height - peakHeight * 0.9;
        
        path.quadraticBezierTo(controlX1, controlY1, x, size.height - peakHeight);
      }
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Clouds - Enhanced
class CloudPainter extends CustomPainter {
  final Color color;

  CloudPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // More realistic cloud shape
    final radius1 = size.height * 0.35;
    final radius2 = size.height * 0.45;
    final radius3 = size.height * 0.4;
    final radius4 = size.height * 0.3;
    final radius5 = size.height * 0.25;

    // Create overlapping circles for cloud effect
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.2, size.height * 0.65),
      radius: radius1,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.4, size.height * 0.4),
      radius: radius2,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.6, size.height * 0.5),
      radius: radius3,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.8, size.height * 0.7),
      radius: radius4,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.9, size.height * 0.8),
      radius: radius5,
    ));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}