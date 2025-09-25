// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/services.dart';
// // // // import 'dart:ui';
// // // // import '../dashboard.dart';
// // // // import 'signup.dart';

// // // // class LoginScreen extends StatefulWidget {
// // // //   @override
// // // //   _LoginScreenState createState() => _LoginScreenState();
// // // // }

// // // // class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
// // // //   final _formKey = GlobalKey<FormState>();
// // // //   final _emailController = TextEditingController();
// // // //   final _passwordController = TextEditingController();
// // // //   bool _isPasswordVisible = false;
// // // //   bool _isLoading = false;
// // // //   bool _rememberMe = false;
// // // //   late AnimationController _animationController;
// // // //   late AnimationController _floatingController;
// // // //   late Animation<double> _fadeAnimation;
// // // //   late Animation<double> _slideAnimation;
// // // //   late Animation<double> _floatingAnimation;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _animationController = AnimationController(
// // // //       duration: Duration(milliseconds: 800),
// // // //       vsync: this,
// // // //     );
// // // //     _floatingController = AnimationController(
// // // //       duration: Duration(seconds: 4),
// // // //       vsync: this,
// // // //     )..repeat(reverse: true);
    
// // // //     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
// // // //       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
// // // //     );
// // // //     _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
// // // //       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
// // // //     );
// // // //     _floatingAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
// // // //       CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
// // // //     );
    
// // // //     _animationController.forward();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _emailController.dispose();
// // // //     _passwordController.dispose();
// // // //     _animationController.dispose();
// // // //     _floatingController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.grey[50],
// // // //       body: SafeArea(
// // // //         child: Stack(
// // // //           children: [
// // // //             // Background Elements
// // // //             _buildBackgroundElements(),
            
// // // //             // Main Content
// // // //             FadeTransition(
// // // //               opacity: _fadeAnimation,
// // // //               child: AnimatedBuilder(
// // // //                 animation: _slideAnimation,
// // // //                 builder: (context, child) {
// // // //                   return Transform.translate(
// // // //                     offset: Offset(0, _slideAnimation.value),
// // // //                     child: Center(
// // // //                       child: SingleChildScrollView(
// // // //                         padding: EdgeInsets.all(24),
// // // //                         child: _buildMainContent(),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildBackgroundElements() {
// // // //     return Stack(
// // // //       children: [
// // // //         // Floating Blur Elements
// // // //         AnimatedBuilder(
// // // //           animation: _floatingAnimation,
// // // //           builder: (context, child) {
// // // //             return Positioned(
// // // //               top: 80 + _floatingAnimation.value,
// // // //               right: 20,
// // // //               child: Container(
// // // //                 width: 120,
// // // //                 height: 120,
// // // //                 decoration: BoxDecoration(
// // // //                   shape: BoxShape.circle,
// // // //                   color: Color(0xFFE91E63).withOpacity(0.1),
// // // //                 ),
// // // //                 child: ClipOval(
// // // //                   child: BackdropFilter(
// // // //                     filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
// // // //                     child: Container(
// // // //                       color: Color(0xFFE91E63).withOpacity(0.05),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //         ),
// // // //         AnimatedBuilder(
// // // //           animation: _floatingAnimation,
// // // //           builder: (context, child) {
// // // //             return Positioned(
// // // //               top: 200 - _floatingAnimation.value,
// // // //               left: 10,
// // // //               child: Container(
// // // //                 width: 80,
// // // //                 height: 80,
// // // //                 decoration: BoxDecoration(
// // // //                   shape: BoxShape.circle,
// // // //                   color: Color(0xFFE91E63).withOpacity(0.08),
// // // //                 ),
// // // //                 child: ClipOval(
// // // //                   child: BackdropFilter(
// // // //                     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
// // // //                     child: Container(
// // // //                       color: Color(0xFFE91E63).withOpacity(0.03),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //         ),
// // // //         AnimatedBuilder(
// // // //           animation: _floatingAnimation,
// // // //           builder: (context, child) {
// // // //             return Positioned(
// // // //               bottom: 120 + _floatingAnimation.value * 0.5,
// // // //               right: 40,
// // // //               child: Container(
// // // //                 width: 100,
// // // //                 height: 100,
// // // //                 decoration: BoxDecoration(
// // // //                   borderRadius: BorderRadius.circular(30),
// // // //                   color: Color(0xFFE91E63).withOpacity(0.06),
// // // //                 ),
// // // //                 child: ClipRRect(
// // // //                   borderRadius: BorderRadius.circular(30),
// // // //                   child: BackdropFilter(
// // // //                     filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
// // // //                     child: Container(
// // // //                       color: Color(0xFFE91E63).withOpacity(0.02),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildMainContent() {
// // // //     return Container(
// // // //       constraints: BoxConstraints(maxWidth: 400),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.white,
// // // //         borderRadius: BorderRadius.circular(24),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: Colors.black.withOpacity(0.08),
// // // //             blurRadius: 32,
// // // //             offset: Offset(0, 16),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: ClipRRect(
// // // //         borderRadius: BorderRadius.circular(24),
// // // //         child: BackdropFilter(
// // // //           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
// // // //           child: Container(
// // // //             padding: EdgeInsets.all(32),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white.withOpacity(0.95),
// // // //             ),
// // // //             child: Form(
// // // //               key: _formKey,
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.center,
// // // //                 children: [
// // // //                   // Header
// // // //                   _buildHeader(),
// // // //                   SizedBox(height: 40),
                  
// // // //                   // Login Form
// // // //                   _buildLoginForm(),
// // // //                   SizedBox(height: 20),
                  
// // // //                   // Additional Options
// // // //                   _buildAdditionalOptions(),
// // // //                   SizedBox(height: 28),
                  
// // // //                   // Login Button
// // // //                   _buildLoginButton(),
// // // //                   SizedBox(height: 32),
                  
// // // //                   // Divider
// // // //                   _buildDivider(),
// // // //                   SizedBox(height: 32),
                  
// // // //                   // Social Login
// // // //                   _buildSocialLogin(),
// // // //                   SizedBox(height: 28),
                  
// // // //                   // Sign Up Link
// // // //                   _buildSignupLink(),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildHeader() {
// // // //     return Column(
// // // //       children: [
// // // //         // Logo
// // // //         Container(
// // // //           width: 80,
// // // //           height: 80,
// // // //           decoration: BoxDecoration(
// // // //             color: Color(0xFFE91E63),
// // // //             shape: BoxShape.circle,
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Color(0xFFE91E63).withOpacity(0.3),
// // // //                 blurRadius: 24,
// // // //                 offset: Offset(0, 12),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           child: Icon(
// // // //             Icons.location_on,
// // // //             size: 40,
// // // //             color: Colors.white,
// // // //           ),
// // // //         ),
// // // //         SizedBox(height: 24),
        
// // // //         // App Name
// // // //         Text(
// // // //           "HOPZY",
// // // //           style: TextStyle(
// // // //             fontSize: 32,
// // // //             fontWeight: FontWeight.w800,
// // // //             color: Colors.black,
// // // //             letterSpacing: 1.5,
// // // //           ),
// // // //         ),
// // // //         SizedBox(height: 8),
        
// // // //         // Tagline
// // // //         Text(
// // // //           "Connect • Meet • Explore Together",
// // // //           style: TextStyle(
// // // //             fontSize: 15,
// // // //             color: Colors.grey[600],
// // // //             fontWeight: FontWeight.w500,
// // // //             letterSpacing: 0.5,
// // // //           ),
// // // //         ),
// // // //         SizedBox(height: 12),
        
// // // //         // Welcome Text
// // // //         Text(
// // // //           "Welcome back! Ready for your next adventure?",
// // // //           textAlign: TextAlign.center,
// // // //           style: TextStyle(
// // // //             fontSize: 14,
// // // //             color: Colors.grey[500],
// // // //             fontWeight: FontWeight.w400,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildLoginForm() {
// // // //     return Column(
// // // //       children: [
// // // //         // Email Field
// // // //         _buildTextField(
// // // //           controller: _emailController,
// // // //           label: "Email Address",
// // // //           hint: "Enter your email",
// // // //           icon: Icons.email_outlined,
// // // //           keyboardType: TextInputType.emailAddress,
// // // //           validator: (val) {
// // // //             if (val == null || val.isEmpty) {
// // // //               return "Please enter your email";
// // // //             }
// // // //             if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
// // // //               return "Please enter a valid email";
// // // //             }
// // // //             return null;
// // // //           },
// // // //         ),
// // // //         SizedBox(height: 20),
        
// // // //         // Password Field
// // // //         _buildTextField(
// // // //           controller: _passwordController,
// // // //           label: "Password",
// // // //           hint: "Enter your password",
// // // //           icon: Icons.lock_outlined,
// // // //           isPassword: true,
// // // //           validator: (val) {
// // // //             if (val == null || val.isEmpty) {
// // // //               return "Please enter your password";
// // // //             }
// // // //             if (val.length < 6) {
// // // //               return "Password must be at least 6 characters";
// // // //             }
// // // //             return null;
// // // //           },
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildTextField({
// // // //     required TextEditingController controller,
// // // //     required String label,
// // // //     required String hint,
// // // //     required IconData icon,
// // // //     bool isPassword = false,
// // // //     TextInputType? keyboardType,
// // // //     String? Function(String?)? validator,
// // // //   }) {
// // // //     return Column(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         Text(
// // // //           label,
// // // //           style: TextStyle(
// // // //             fontSize: 15,
// // // //             fontWeight: FontWeight.w600,
// // // //             color: Colors.grey[800],
// // // //           ),
// // // //         ),
// // // //         SizedBox(height: 8),
// // // //         Container(
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.grey[50],
// // // //             borderRadius: BorderRadius.circular(16),
// // // //             border: Border.all(color: Colors.grey[200]!, width: 1),
// // // //             boxShadow: [
// // // //               BoxShadow(
// // // //                 color: Colors.black.withOpacity(0.04),
// // // //                 blurRadius: 8,
// // // //                 offset: Offset(0, 2),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           child: TextFormField(
// // // //             controller: controller,
// // // //             keyboardType: keyboardType,
// // // //             obscureText: isPassword && !_isPasswordVisible,
// // // //             style: TextStyle(
// // // //               fontSize: 16,
// // // //               color: Colors.grey[900],
// // // //               fontWeight: FontWeight.w500,
// // // //             ),
// // // //             decoration: InputDecoration(
// // // //               hintText: hint,
// // // //               hintStyle: TextStyle(
// // // //                 color: Colors.grey[400],
// // // //                 fontSize: 16,
// // // //                 fontWeight: FontWeight.w400,
// // // //               ),
// // // //               prefixIcon: Container(
// // // //                 margin: EdgeInsets.all(12),
// // // //                 padding: EdgeInsets.all(8),
// // // //                 decoration: BoxDecoration(
// // // //                   color: Color(0xFFE91E63).withOpacity(0.1),
// // // //                   borderRadius: BorderRadius.circular(10),
// // // //                 ),
// // // //                 child: Icon(icon, color: Color(0xFFE91E63), size: 20),
// // // //               ),
// // // //               suffixIcon: isPassword
// // // //                   ? IconButton(
// // // //                       icon: Icon(
// // // //                         _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
// // // //                         color: Colors.grey[500],
// // // //                         size: 20,
// // // //                       ),
// // // //                       onPressed: () {
// // // //                         setState(() {
// // // //                           _isPasswordVisible = !_isPasswordVisible;
// // // //                         });
// // // //                       },
// // // //                     )
// // // //                   : null,
// // // //               border: OutlineInputBorder(
// // // //                 borderRadius: BorderRadius.circular(16),
// // // //                 borderSide: BorderSide.none,
// // // //               ),
// // // //               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
// // // //             ),
// // // //             validator: validator,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildAdditionalOptions() {
// // // //     return Row(
// // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //       children: [
// // // //         Row(
// // // //           children: [
// // // //             Transform.scale(
// // // //               scale: 0.9,
// // // //               child: Checkbox(
// // // //                 value: _rememberMe,
// // // //                 onChanged: (value) {
// // // //                   setState(() {
// // // //                     _rememberMe = value ?? false;
// // // //                   });
// // // //                 },
// // // //                 activeColor: Color(0xFFE91E63),
// // // //                 shape: RoundedRectangleBorder(
// // // //                   borderRadius: BorderRadius.circular(4),
// // // //                 ),
// // // //                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// // // //               ),
// // // //             ),
// // // //             Text(
// // // //               "Remember me",
// // // //               style: TextStyle(
// // // //                 color: Colors.grey[600],
// // // //                 fontSize: 14,
// // // //                 fontWeight: FontWeight.w500,
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         TextButton(
// // // //           onPressed: () {
// // // //             ScaffoldMessenger.of(context).showSnackBar(
// // // //               SnackBar(
// // // //                 content: Text("Password reset link sent to your email! 📧"),
// // // //                 backgroundColor: Color(0xFFE91E63),
// // // //                 behavior: SnackBarBehavior.floating,
// // // //                 shape: RoundedRectangleBorder(
// // // //                   borderRadius: BorderRadius.circular(12),
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           },
// // // //           style: TextButton.styleFrom(
// // // //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// // // //           ),
// // // //           child: Text(
// // // //             "Forgot Password?",
// // // //             style: TextStyle(
// // // //               color: Color(0xFFE91E63),
// // // //               fontWeight: FontWeight.w600,
// // // //               fontSize: 14,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildLoginButton() {
// // // //     return Container(
// // // //       width: double.infinity,
// // // //       height: 56,
// // // //       decoration: BoxDecoration(
// // // //         color: Color(0xFFE91E63),
// // // //         borderRadius: BorderRadius.circular(16),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: Color(0xFFE91E63).withOpacity(0.3),
// // // //             blurRadius: 16,
// // // //             offset: Offset(0, 8),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: Material(
// // // //         color: Colors.transparent,
// // // //         child: InkWell(
// // // //           onTap: _isLoading ? null : _handleLogin,
// // // //           borderRadius: BorderRadius.circular(16),
// // // //           child: Center(
// // // //             child: _isLoading
// // // //                 ? SizedBox(
// // // //                     height: 24,
// // // //                     width: 24,
// // // //                     child: CircularProgressIndicator(
// // // //                       strokeWidth: 2.5,
// // // //                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
// // // //                     ),
// // // //                   )
// // // //                 : Text(
// // // //                     "Sign In to HOPZY",
// // // //                     style: TextStyle(
// // // //                       fontSize: 17,
// // // //                       fontWeight: FontWeight.w600,
// // // //                       color: Colors.white,
// // // //                       letterSpacing: 0.3,
// // // //                     ),
// // // //                   ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildDivider() {
// // // //     return Row(
// // // //       children: [
// // // //         Expanded(
// // // //           child: Container(
// // // //             height: 1,
// // // //             color: Colors.grey[200],
// // // //           ),
// // // //         ),
// // // //         Padding(
// // // //           padding: EdgeInsets.symmetric(horizontal: 20),
// // // //           child: Text(
// // // //             "OR CONTINUE WITH",
// // // //             style: TextStyle(
// // // //               color: Colors.grey[500],
// // // //               fontSize: 12,
// // // //               fontWeight: FontWeight.w600,
// // // //               letterSpacing: 1,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         Expanded(
// // // //           child: Container(
// // // //             height: 1,
// // // //             color: Colors.grey[200],
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildSocialLogin() {
// // // //     return Row(
// // // //       children: [
// // // //         Expanded(
// // // //           child: _buildSocialButton(
// // // //             "Google",
// // // //             Icons.g_mobiledata,
// // // //             Colors.white,
// // // //             Colors.grey[700]!,
// // // //           ),
// // // //         ),
// // // //         SizedBox(width: 16),
// // // //         Expanded(
// // // //           child: _buildSocialButton(
// // // //             "Apple",
// // // //             Icons.apple,
// // // //             Colors.black,
// // // //             Colors.white,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildSocialButton(String provider, IconData icon, Color bgColor, Color contentColor) {
// // // //     return Container(
// // // //       height: 52,
// // // //       decoration: BoxDecoration(
// // // //         color: bgColor,
// // // //         borderRadius: BorderRadius.circular(16),
// // // //         border: Border.all(color: Colors.grey[200]!, width: 1),
// // // //         boxShadow: [
// // // //           BoxShadow(
// // // //             color: Colors.black.withOpacity(0.04),
// // // //             blurRadius: 8,
// // // //             offset: Offset(0, 2),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       child: Material(
// // // //         color: Colors.transparent,
// // // //         child: InkWell(
// // // //           onTap: () => _handleSocialLogin(provider),
// // // //           borderRadius: BorderRadius.circular(16),
// // // //           child: Row(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               Icon(icon, color: contentColor, size: 24),
// // // //               SizedBox(width: 8),
// // // //               Text(
// // // //                 provider,
// // // //                 style: TextStyle(
// // // //                   color: contentColor,
// // // //                   fontWeight: FontWeight.w600,
// // // //                   fontSize: 15,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildSignupLink() {
// // // //     return Row(
// // // //       mainAxisAlignment: MainAxisAlignment.center,
// // // //       children: [
// // // //         Text(
// // // //           "New to HOPZY? ",
// // // //           style: TextStyle(
// // // //             color: Colors.grey[600],
// // // //             fontSize: 15,
// // // //             fontWeight: FontWeight.w400,
// // // //           ),
// // // //         ),
// // // //         TextButton(
// // // //           onPressed: () {
// // // //             Navigator.push(
// // // //               context,
// // // //               MaterialPageRoute(builder: (context) => SignupScreen()),
// // // //             );
// // // //           },
// // // //           style: TextButton.styleFrom(
// // // //             padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
// // // //           ),
// // // //           child: Text(
// // // //             "Create Account",
// // // //             style: TextStyle(
// // // //               color: Color(0xFFE91E63),
// // // //               fontSize: 15,
// // // //               fontWeight: FontWeight.w600,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   void _handleLogin() async {
// // // //     if (_formKey.currentState!.validate()) {
// // // //       setState(() {
// // // //         _isLoading = true;
// // // //       });

// // // //       await Future.delayed(Duration(seconds: 2));

// // // //       setState(() {
// // // //         _isLoading = false;
// // // //       });

// // // //       Navigator.pushReplacement(
// // // //         context,
// // // //         MaterialPageRoute(
// // // //           builder: (context) => DashboardScreen(),
// // // //         ),
// // // //       );
// // // //     }
// // // //   }

// // // //   void _handleSocialLogin(String provider) {
// // // //     ScaffoldMessenger.of(context).showSnackBar(
// // // //       SnackBar(
// // // //         content: Text("$provider login integration coming soon! 🚀"),
// // // //         backgroundColor: Color(0xFFE91E63),
// // // //         behavior: SnackBarBehavior.floating,
// // // //         shape: RoundedRectangleBorder(
// // // //           borderRadius: BorderRadius.circular(12),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }




// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/services.dart';
// // // import 'dart:ui';
// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import '../dashboard.dart';
// // // import 'signup.dart';

// // // class LoginScreen extends StatefulWidget {
// // //   @override
// // //   _LoginScreenState createState() => _LoginScreenState();
// // // }

// // // class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
// // //   final _formKey = GlobalKey<FormState>();
// // //   final _emailController = TextEditingController();
// // //   final _passwordController = TextEditingController();
// // //   bool _isPasswordVisible = false;
// // //   bool _isLoading = false;
// // //   bool _rememberMe = false;
// // //   late AnimationController _animationController;
// // //   late AnimationController _floatingController;
// // //   late Animation<double> _fadeAnimation;
// // //   late Animation<double> _slideAnimation;
// // //   late Animation<double> _floatingAnimation;

// // //   // API endpoint
// // //   static const String API_URL = 'http://localhost:5000/api/auth/login';

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
// // //     _emailController.dispose();
// // //     _passwordController.dispose();
// // //     _animationController.dispose();
// // //     _floatingController.dispose();
// // //     super.dispose();
// // //   }

// // //   // API call method
// // //   Future<Map<String, dynamic>?> _loginUser(String email, String password) async {
// // //     try {
// // //       final response = await http.post(
// // //         Uri.parse(API_URL),
// // //         headers: {
// // //           'Content-Type': 'application/json',
// // //         },
// // //         body: json.encode({
// // //           'email': email,
// // //           'password': password,
// // //         }),
// // //       );

// // //       if (response.statusCode == 200) {
// // //         return json.decode(response.body);
// // //       } else {
// // //         final errorData = json.decode(response.body);
// // //         return {'error': errorData['message'] ?? 'Login failed'};
// // //       }
// // //     } catch (e) {
// // //       return {'error': 'Network error. Please check your connection.'};
// // //     }
// // //   }

// // //   void _showSnackBar(String message, {bool isError = false}) {
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Row(
// // //           children: [
// // //             Icon(
// // //               isError ? Icons.error_outline : Icons.check_circle_outline,
// // //               color: Colors.white,
// // //               size: 20,
// // //             ),
// // //             SizedBox(width: 8),
// // //             Expanded(
// // //               child: Text(
// // //                 message,
// // //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         backgroundColor: isError ? Colors.red[600] : Color(0xFFE91E63),
// // //         behavior: SnackBarBehavior.floating,
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(12),
// // //         ),
// // //         margin: EdgeInsets.all(16),
// // //         duration: Duration(seconds: 3),
// // //       ),
// // //     );
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
                  
// // //                   // Login Form
// // //                   _buildLoginForm(),
// // //                   SizedBox(height: 20),
                  
// // //                   // Additional Options
// // //                   _buildAdditionalOptions(),
// // //                   SizedBox(height: 28),
                  
// // //                   // Login Button
// // //                   _buildLoginButton(),
// // //                   SizedBox(height: 32),
                  
// // //                   // Divider
// // //                   _buildDivider(),
// // //                   SizedBox(height: 32),
                  
// // //                   // Social Login
// // //                   _buildSocialLogin(),
// // //                   SizedBox(height: 28),
                  
// // //                   // Sign Up Link
// // //                   _buildSignupLink(),
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
// // //             Icons.location_on,
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
// // //           "Welcome back! Ready for your next adventure?",
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

// // //   Widget _buildLoginForm() {
// // //     return Column(
// // //       children: [
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
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildTextField({
// // //     required TextEditingController controller,
// // //     required String label,
// // //     required String hint,
// // //     required IconData icon,
// // //     bool isPassword = false,
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
// // //             obscureText: isPassword && !_isPasswordVisible,
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
// // //                         _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
// // //                         color: Colors.grey[500],
// // //                         size: 20,
// // //                       ),
// // //                       onPressed: () {
// // //                         setState(() {
// // //                           _isPasswordVisible = !_isPasswordVisible;
// // //                         });
// // //                       },
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

// // //   Widget _buildAdditionalOptions() {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //       children: [
// // //         Row(
// // //           children: [
// // //             Transform.scale(
// // //               scale: 0.9,
// // //               child: Checkbox(
// // //                 value: _rememberMe,
// // //                 onChanged: (value) {
// // //                   setState(() {
// // //                     _rememberMe = value ?? false;
// // //                   });
// // //                 },
// // //                 activeColor: Color(0xFFE91E63),
// // //                 shape: RoundedRectangleBorder(
// // //                   borderRadius: BorderRadius.circular(4),
// // //                 ),
// // //                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
// // //               ),
// // //             ),
// // //             Text(
// // //               "Remember me",
// // //               style: TextStyle(
// // //                 color: Colors.grey[600],
// // //                 fontSize: 14,
// // //                 fontWeight: FontWeight.w500,
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //         TextButton(
// // //           onPressed: () {
// // //             _showSnackBar("Password reset link sent to your email! 📧");
// // //           },
// // //           style: TextButton.styleFrom(
// // //             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// // //           ),
// // //           child: Text(
// // //             "Forgot Password?",
// // //             style: TextStyle(
// // //               color: Color(0xFFE91E63),
// // //               fontWeight: FontWeight.w600,
// // //               fontSize: 14,
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildLoginButton() {
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
// // //           onTap: _isLoading ? null : _handleLogin,
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
// // //                     "Sign In to HOPZY",
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

// // //   Widget _buildSignupLink() {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.center,
// // //       children: [
// // //         Text(
// // //           "New to HOPZY? ",
// // //           style: TextStyle(
// // //             color: Colors.grey[600],
// // //             fontSize: 15,
// // //             fontWeight: FontWeight.w400,
// // //           ),
// // //         ),
// // //         TextButton(
// // //           onPressed: () {
// // //             Navigator.push(
// // //               context,
// // //               MaterialPageRoute(builder: (context) => SignupScreen()),
// // //             );
// // //           },
// // //           style: TextButton.styleFrom(
// // //             padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
// // //           ),
// // //           child: Text(
// // //             "Create Account",
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

// // //   void _handleLogin() async {
// // //     if (_formKey.currentState!.validate()) {
// // //       setState(() {
// // //         _isLoading = true;
// // //       });

// // //       try {
// // //         // Call the API
// // //         final result = await _loginUser(_emailController.text, _passwordController.text);

// // //         if (result != null) {
// // //           if (result.containsKey('error')) {
// // //             // Show error message
// // //             _showSnackBar(result['error'], isError: true);
// // //           } else if (result.containsKey('message') && result['message'] == 'Login successful') {
// // //             // Successful login
// // //             final user = result['user'];
// // //             _showSnackBar("Welcome back, ${user['name']}! 🎉");
            
// // //             // Navigate to dashboard after a short delay
// // //             await Future.delayed(Duration(milliseconds: 1500));
// // //             Navigator.pushReplacement(
// // //               context,
// // //               MaterialPageRoute(
// // //                 builder: (context) => DashboardScreen(),
// // //               ),
// // //             );
// // //           }
// // //         } else {
// // //           _showSnackBar("Something went wrong. Please try again.", isError: true);
// // //         }
// // //       } catch (e) {
// // //         _showSnackBar("An unexpected error occurred.", isError: true);
// // //       } finally {
// // //         setState(() {
// // //           _isLoading = false;
// // //         });
// // //       }
// // //     }
// // //   }

// // //   void _handleSocialLogin(String provider) {
// // //     _showSnackBar("$provider login integration coming soon! 🚀");
// // //   }
// // // }





// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import '../../utils/constants.dart';
// // import '../dashboard_tabs/home/home_page.dart';

// // class LoginScreen extends StatefulWidget {
// //   @override
// //   _LoginScreenState createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   bool _isLoading = false;

// //   Future<void> _loginUser() async {
// //     if (!_formKey.currentState!.validate()) return;

// //     final email = _emailController.text.trim().toLowerCase();
// //     final password = _passwordController.text.trim();

// //     setState(() => _isLoading = true);

// //     try {
// //       print("Sending: email='$email', password='$password'");

// //       final response = await http.post(
// //         Uri.parse(API.LOGIN),
// //         headers: {"Content-Type": "application/json"},
// //         body: jsonEncode({"email": email, "password": password}),
// //       );

// //       print("Response code: ${response.statusCode}");
// //       print("Response body: ${response.body}");

// //       final data = jsonDecode(response.body);

// //       if (response.statusCode == 200 && data['message'] == 'Login successful') {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (_) => HomeScreen()),
// //         );
// //       } else {
// //         _showSnackBar(data['message'] ?? 'Login failed');
// //       }
// //     } catch (e) {
// //       _showSnackBar('Network error. Please try again.');
// //     } finally {
// //       setState(() => _isLoading = false);
// //     }
// //   }

// //   void _showSnackBar(String message) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text(message)),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Login')),
// //       body: Padding(
// //         padding: EdgeInsets.all(20),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               TextFormField(
// //                 controller: _emailController,
// //                 decoration: InputDecoration(labelText: 'Email'),
// //                 keyboardType: TextInputType.emailAddress,
// //                 validator: (val) =>
// //                     val!.isEmpty ? 'Please enter your email' : null,
// //               ),
// //               SizedBox(height: 20),
// //               TextFormField(
// //                 controller: _passwordController,
// //                 decoration: InputDecoration(labelText: 'Password'),
// //                 obscureText: true,
// //                 validator: (val) =>
// //                     val!.isEmpty ? 'Please enter your password' : null,
// //               ),
// //               SizedBox(height: 30),
// //               _isLoading
// //                   ? CircularProgressIndicator()
// //                   : ElevatedButton(
// //                       onPressed: _loginUser,
// //                       child: Text('Login'),
// //                     ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

















// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:ui';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../../utils/constants.dart';
// import '../dashboard_tabs/home/home_page.dart';
// import 'signup.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _isLoading = false;
//   bool _rememberMe = false;
//   late AnimationController _animationController;
//   late AnimationController _floatingController;
//   late Animation<double> _fadeAnimation;
//   late Animation<double> _slideAnimation;
//   late Animation<double> _floatingAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _floatingController = AnimationController(
//       duration: Duration(seconds: 4),
//       vsync: this,
//     )..repeat(reverse: true);
    
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );
//     _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );
//     _floatingAnimation = Tween<double>(begin: -8.0, end: 8.0).animate(
//       CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
//     );
    
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _animationController.dispose();
//     _floatingController.dispose();
//     super.dispose();
//   }

//   Future<void> _loginUser() async {
//     if (!_formKey.currentState!.validate()) return;

//     final email = _emailController.text.trim().toLowerCase();
//     final password = _passwordController.text.trim();

//     setState(() => _isLoading = true);

//     try {
//       print("Sending: email='$email', password='$password'");

//       final response = await http.post(
//         Uri.parse(API.LOGIN),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({"email": email, "password": password}),
//       );

//       print("Response code: ${response.statusCode}");
//       print("Response body: ${response.body}");

//       final data = jsonDecode(response.body);

//       if (response.statusCode == 200 && data['message'] == 'Login successful') {
//         _showSnackBar('Welcome back! Login successful! ✈️', isSuccess: true);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (_) => HomeScreen()),
//         );
//       } else {
//         _showSnackBar(data['message'] ?? 'Login failed');
//       }
//     } catch (e) {
//       _showSnackBar('Network error. Please try again.');
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   void _showSnackBar(String message, {bool isSuccess = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isSuccess ? Color(0xFF2C5F5D) : Colors.red,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Background Elements
//             _buildBackgroundElements(),
            
//             // Main Content
//             FadeTransition(
//               opacity: _fadeAnimation,
//               child: AnimatedBuilder(
//                 animation: _slideAnimation,
//                 builder: (context, child) {
//                   return Transform.translate(
//                     offset: Offset(0, _slideAnimation.value),
//                     child: Center(
//                       child: SingleChildScrollView(
//                         padding: EdgeInsets.all(24),
//                         child: _buildMainContent(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBackgroundElements() {
//     return Stack(
//       children: [
//         // Floating Blur Elements
//         AnimatedBuilder(
//           animation: _floatingAnimation,
//           builder: (context, child) {
//             return Positioned(
//               top: 80 + _floatingAnimation.value,
//               right: 20,
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFF2C5F5D).withOpacity(0.1),
//                 ),
//                 child: ClipOval(
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
//                     child: Container(
//                       color: Color(0xFF2C5F5D).withOpacity(0.05),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         AnimatedBuilder(
//           animation: _floatingAnimation,
//           builder: (context, child) {
//             return Positioned(
//               top: 200 - _floatingAnimation.value,
//               left: 10,
//               child: Container(
//                 width: 80,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFFFF8A00).withOpacity(0.08),
//                 ),
//                 child: ClipOval(
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                     child: Container(
//                       color: Color(0xFFFF8A00).withOpacity(0.03),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//         AnimatedBuilder(
//           animation: _floatingAnimation,
//           builder: (context, child) {
//             return Positioned(
//               bottom: 120 + _floatingAnimation.value * 0.5,
//               right: 40,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: Color(0xFF2C5F5D).withOpacity(0.06),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
//                     child: Container(
//                       color: Color(0xFF2C5F5D).withOpacity(0.02),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildMainContent() {
//     return Container(
//       constraints: BoxConstraints(maxWidth: 400),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 32,
//             offset: Offset(0, 16),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(24),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//           child: Container(
//             padding: EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(0.95),
//             ),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Header
//                   _buildHeader(),
//                   SizedBox(height: 40),
                  
//                   // Login Form
//                   _buildLoginForm(),
//                   SizedBox(height: 16),
                  
//                   // Remember Me & Forgot Password
//                   _buildRememberMeSection(),
//                   SizedBox(height: 28),
                  
//                   // Login Button
//                   _buildLoginButton(),
//                   SizedBox(height: 32),
                  
//                   // Divider
//                   _buildDivider(),
//                   SizedBox(height: 32),
                  
//                   // Social Login
//                   _buildSocialLogin(),
//                   SizedBox(height: 28),
                  
//                   // Signup Link
//                   _buildSignupLink(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       children: [
//         // Logo
//         Container(
//           width: 80,
//           height: 80,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF2C5F5D), Color(0xFF4A8B8A)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: Color(0xFF2C5F5D).withOpacity(0.3),
//                 blurRadius: 24,
//                 offset: Offset(0, 12),
//               ),
//             ],
//           ),
//           child: Icon(
//             Icons.travel_explore,
//             size: 40,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(height: 24),
        
//         // App Name
//         Text(
//           "HOPZY",
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.w800,
//             color: Colors.black,
//             letterSpacing: 1.5,
//           ),
//         ),
//         SizedBox(height: 8),
        
//         // Tagline
//         Text(
//           "Explore • Discover • Journey",
//           style: TextStyle(
//             fontSize: 15,
//             color: Colors.grey[600],
//             fontWeight: FontWeight.w500,
//             letterSpacing: 0.5,
//           ),
//         ),
//         SizedBox(height: 12),
        
//         // Welcome Text
//         Text(
//           "Welcome back! Sign in to continue your adventure",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[500],
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLoginForm() {
//     return Column(
//       children: [
//         // Email Field
//         _buildTextField(
//           controller: _emailController,
//           label: "Email Address",
//           hint: "Enter your email",
//           icon: Icons.email_outlined,
//           keyboardType: TextInputType.emailAddress,
//           validator: (val) {
//             if (val == null || val.isEmpty) {
//               return "Please enter your email";
//             }
//             if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
//               return "Please enter a valid email";
//             }
//             return null;
//           },
//         ),
//         SizedBox(height: 20),
        
//         // Password Field
//         _buildTextField(
//           controller: _passwordController,
//           label: "Password",
//           hint: "Enter your password",
//           icon: Icons.lock_outlined,
//           isPassword: true,
//           isPasswordVisible: _isPasswordVisible,
//           onPasswordToggle: () {
//             setState(() {
//               _isPasswordVisible = !_isPasswordVisible;
//             });
//           },
//           validator: (val) {
//             if (val == null || val.isEmpty) {
//               return "Please enter your password";
//             }
//             return null;
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     bool isPassword = false,
//     bool isPasswordVisible = false,
//     VoidCallback? onPasswordToggle,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w600,
//             color: Colors.grey[800],
//           ),
//         ),
//         SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[50],
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.grey[200]!, width: 1),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.04),
//                 blurRadius: 8,
//                 offset: Offset(0, 2),
//               ),
//             ],
//           ),
//           child: TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             obscureText: isPassword && !isPasswordVisible,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[900],
//               fontWeight: FontWeight.w500,
//             ),
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(
//                 color: Colors.grey[400],
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//               ),
//               prefixIcon: Container(
//                 margin: EdgeInsets.all(12),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xFF2C5F5D).withOpacity(0.1),
//                       Color(0xFFFF8A00).withOpacity(0.05),
//                     ],
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Icon(icon, color: Color(0xFF2C5F5D), size: 20),
//               ),
//               suffixIcon: isPassword
//                   ? IconButton(
//                       icon: Icon(
//                         isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
//                         color: Colors.grey[500],
//                         size: 20,
//                       ),
//                       onPressed: onPasswordToggle,
//                     )
//                   : null,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(16),
//                 borderSide: BorderSide.none,
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//             ),
//             validator: validator,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRememberMeSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Transform.scale(
//               scale: 0.9,
//               child: Checkbox(
//                 value: _rememberMe,
//                 onChanged: (value) {
//                   setState(() {
//                     _rememberMe = value ?? false;
//                   });
//                 },
//                 activeColor: Color(0xFF2C5F5D),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               ),
//             ),
//             Text(
//               "Remember Me",
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         TextButton(
//           onPressed: () {
//             _showSnackBar("Forgot password feature coming soon! 🔐");
//           },
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
//           ),
//           child: Text(
//             "Forgot Password?",
//             style: TextStyle(
//               color: Color(0xFFFF8A00),
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLoginButton() {
//     return Container(
//       width: double.infinity,
//       height: 56,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Color(0xFF2C5F5D), Color(0xFF4A8B8A)],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Color(0xFF2C5F5D).withOpacity(0.3),
//             blurRadius: 16,
//             offset: Offset(0, 8),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: _isLoading ? null : _loginUser,
//           borderRadius: BorderRadius.circular(16),
//           child: Center(
//             child: _isLoading
//                 ? SizedBox(
//                     height: 24,
//                     width: 24,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2.5,
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     ),
//                   )
//                 : Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.login,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                       SizedBox(width: 8),
//                       Text(
//                         "Sign In to HOPZY",
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                           letterSpacing: 0.3,
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDivider() {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 1,
//             color: Colors.grey[200],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Text(
//             "OR CONTINUE WITH",
//             style: TextStyle(
//               color: Colors.grey[500],
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             height: 1,
//             color: Colors.grey[200],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSocialLogin() {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildSocialButton(
//             "Google",
//             Icons.g_mobiledata,
//             Colors.white,
//             Colors.grey[700]!,
//           ),
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: _buildSocialButton(
//             "Apple",
//             Icons.apple,
//             Colors.black,
//             Colors.white,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSocialButton(String provider, IconData icon, Color bgColor, Color contentColor) {
//     return Container(
//       height: 52,
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey[200]!, width: 1),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () => _handleSocialLogin(provider),
//           borderRadius: BorderRadius.circular(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, color: contentColor, size: 24),
//               SizedBox(width: 8),
//               Text(
//                 provider,
//                 style: TextStyle(
//                   color: contentColor,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 15,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSignupLink() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Don't have an account? ",
//           style: TextStyle(
//             color: Colors.grey[600],
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SignupScreen()),
//             );
//           },
//           style: TextButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
//           ),
//           child: Text(
//             "Sign Up",
//             style: TextStyle(
//               color: Color(0xFFFF8A00),
//               fontSize: 15,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _handleSocialLogin(String provider) {
//     _showSnackBar("$provider login integration coming soon! 🚀");
//   }
// }















import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../dashboard_tabs/home/home_page.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;
  bool _rememberMe = false;
  late AnimationController _animationController;
  late AnimationController _floatingController;
  late AnimationController _planeController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _floatingAnimation;
  late Animation<double> _planeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    _floatingController = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
    _planeController = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )..repeat();
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _floatingAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
    
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize plane animation here where MediaQuery is available
    _planeAnimation = Tween<double>(
      begin: -200.0, 
      end: MediaQuery.of(context).size.width + 200
    ).animate(
      CurvedAnimation(parent: _planeController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    _floatingController.dispose();
    _planeController.dispose();
    super.dispose();
  }

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim().toLowerCase();
    final password = _passwordController.text.trim();

    setState(() => _isLoading = true);

    try {
      print("Sending: email='$email', password='$password'");

      final response = await http.post(
        Uri.parse(API.LOGIN),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      print("Response code: ${response.statusCode}");
      print("Response body: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['message'] == 'Login successful') {
        _showSnackBar('Welcome back! Login successful! ✈️', isSuccess: true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      } else {
        _showSnackBar(data['message'] ?? 'Login failed');
      }
    } catch (e) {
      _showSnackBar('Network error. Please try again.');
    } finally {
      setState(() => _isLoading = false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD), // Light blue sky
              Color(0xFFBBDEFB), // Medium blue
              Color(0xFF90CAF9), // Deeper blue
              Color(0xFFE1F5FE), // Light cyan at bottom
            ],
            stops: [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Background Travel Elements
              _buildTravelBackground(),
              
              // Animated Plane
              _buildAnimatedPlane(),
              
              // Floating Elements
              _buildFloatingElements(),
              
              // Main Content
              FadeTransition(
                opacity: _fadeAnimation,
                child: AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Center(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(24),
                          child: _buildMainContent(),
                        ),
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
        // Mountains Layer 1 (Back)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.4),
            painter: MountainPainter(
              color: Color(0xFF4A90A4).withOpacity(0.3),
              peaks: [0.3, 0.6, 0.4, 0.8, 0.5],
            ),
          ),
        ),
        
        // Mountains Layer 2 (Middle)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.35),
            painter: MountainPainter(
              color: Color(0xFF2C5F5D).withOpacity(0.4),
              peaks: [0.5, 0.3, 0.7, 0.4, 0.6],
            ),
          ),
        ),
        
        // Mountains Layer 3 (Front)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.3),
            painter: MountainPainter(
              color: Color(0xFF2C5F5D).withOpacity(0.6),
              peaks: [0.4, 0.7, 0.3, 0.6, 0.4],
            ),
          ),
        ),
        
        // Clouds
        _buildClouds(),
        
        // Travel Icons scattered
        _buildTravelIcons(),
      ],
    );
  }

  Widget _buildClouds() {
    return Stack(
      children: [
        // Cloud 1
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 100 + _floatingAnimation.value * 0.5,
              left: 50,
              child: CustomPaint(
                size: Size(80, 40),
                painter: CloudPainter(color: Colors.white.withOpacity(0.7)),
              ),
            );
          },
        ),
        
        // Cloud 2
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 150 - _floatingAnimation.value * 0.3,
              right: 60,
              child: CustomPaint(
                size: Size(100, 50),
                painter: CloudPainter(color: Colors.white.withOpacity(0.6)),
              ),
            );
          },
        ),
        
        // Cloud 3
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 200 + _floatingAnimation.value * 0.4,
              left: 20,
              child: CustomPaint(
                size: Size(60, 30),
                painter: CloudPainter(color: Colors.white.withOpacity(0.5)),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAnimatedPlane() {
    return AnimatedBuilder(
      animation: _planeAnimation,
      builder: (context, child) {
        return Positioned(
          top: 120,
          left: _planeAnimation.value,
          child: Transform.rotate(
            angle: -0.2,
            child: Icon(
              Icons.airplanemode_active,
              size: 30,
              color: Color(0xFFFF8A00).withOpacity(0.8),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTravelIcons() {
    return Stack(
      children: [
        // Luggage
        Positioned(
          bottom: 200,
          left: 30,
          child: AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.5),
                child: Icon(
                  Icons.luggage,
                  size: 24,
                  color: Color(0xFFFF8A00).withOpacity(0.4),
                ),
              );
            },
          ),
        ),
        
        // Camera
        Positioned(
          top: 180,
          right: 40,
          child: AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -_floatingAnimation.value * 0.3),
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Color(0xFF2C5F5D).withOpacity(0.4),
                ),
              );
            },
          ),
        ),
        
        // Train
        Positioned(
          bottom: 160,
          right: 80,
          child: AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.4),
                child: Icon(
                  Icons.train,
                  size: 22,
                  color: Color(0xFF4A90A4).withOpacity(0.5),
                ),
              );
            },
          ),
        ),
        
        // Restaurant/Food
        Positioned(
          top: 250,
          left: 80,
          child: AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, -_floatingAnimation.value * 0.6),
                child: Icon(
                  Icons.restaurant,
                  size: 18,
                  color: Color(0xFFFF8A00).withOpacity(0.3),
                ),
              );
            },
          ),
        ),
        
        // Hotel/Bed
        Positioned(
          bottom: 280,
          right: 30,
          child: AnimatedBuilder(
            animation: _floatingAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.3),
                child: Icon(
                  Icons.hotel,
                  size: 20,
                  color: Color(0xFF2C5F5D).withOpacity(0.3),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingElements() {
    return Stack(
      children: [
        // Floating Blur Elements with travel theme colors
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 80 + _floatingAnimation.value,
              right: 20,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFFFF8A00).withOpacity(0.15),
                      Color(0xFFFF8A00).withOpacity(0.05),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: Container(
                      color: Color(0xFFFF8A00).withOpacity(0.05),
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
              top: 200 - _floatingAnimation.value,
              left: 10,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF4A90A4).withOpacity(0.12),
                      Color(0xFF4A90A4).withOpacity(0.04),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: Color(0xFF4A90A4).withOpacity(0.03),
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
              bottom: 120 + _floatingAnimation.value * 0.5,
              right: 40,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF2C5F5D).withOpacity(0.1),
                      Color(0xFF2C5F5D).withOpacity(0.03),
                    ],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(
                      color: Color(0xFF2C5F5D).withOpacity(0.02),
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

  Widget _buildMainContent() {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 40,
            offset: Offset(0, 20),
          ),
          BoxShadow(
            color: Color(0xFF2C5F5D).withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header
                  _buildHeader(),
                  SizedBox(height: 40),
                  
                  // Login Form
                  _buildLoginForm(),
                  SizedBox(height: 16),
                  
                  // Remember Me & Forgot Password
                  _buildRememberMeSection(),
                  SizedBox(height: 28),
                  
                  // Login Button
                  _buildLoginButton(),
                  SizedBox(height: 32),
                  
                  // Divider
                  _buildDivider(),
                  SizedBox(height: 32),
                  
                  // Social Login
                  _buildSocialLogin(),
                  SizedBox(height: 28),
                  
                  // Signup Link
                  _buildSignupLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo with enhanced travel theme
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2C5F5D),
                Color(0xFF4A90A4),
                Color(0xFFFF8A00).withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0xFF2C5F5D).withOpacity(0.4),
                blurRadius: 30,
                offset: Offset(0, 15),
              ),
              BoxShadow(
                color: Color(0xFFFF8A00).withOpacity(0.3),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.travel_explore,
                size: 35,
                color: Colors.white,
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Icon(
                  Icons.airplanemode_active,
                  size: 16,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        
        // App Name with gradient text effect
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Color(0xFF2C5F5D), Color(0xFFFF8A00)],
          ).createShader(bounds),
          child: Text(
            "HOPZY",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
        ),
        SizedBox(height: 8),
        
        // Enhanced Tagline
        Text(
          "✈️ Explore • 🏔️ Discover • 🌍 Journey",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF4A90A4),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 12),
        
        // Welcome Text
        Text(
          "Welcome back, fellow traveler!\nSign in to continue your adventure",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  // Rest of the methods remain the same...
  Widget _buildLoginForm() {
    return Column(
      children: [
        // Email Field
        _buildTextField(
          controller: _emailController,
          label: "Email Address",
          hint: "Enter your email",
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your email";
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
              return "Please enter a valid email";
            }
            return null;
          },
        ),
        SizedBox(height: 20),
        
        // Password Field
        _buildTextField(
          controller: _passwordController,
          label: "Password",
          hint: "Enter your password",
          icon: Icons.lock_outlined,
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onPasswordToggle: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Please enter your password";
            }
            return null;
          },
        ),
      ],
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
            fontSize: 15,
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

  Widget _buildRememberMeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.9,
              child: Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                activeColor: Color(0xFF2C5F5D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            Text(
              "Remember Me",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            _showSnackBar("Forgot password feature coming soon! 🔐");
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          ),
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: Color(0xFFFF8A00),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2C5F5D), Color(0xFF4A90A4), Color(0xFFFF8A00)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2C5F5D).withOpacity(0.4),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
          BoxShadow(
            color: Color(0xFFFF8A00).withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isLoading ? null : _loginUser,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: _isLoading
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
                      Icon(
                        Icons.login,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Sign In to HOPZY",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey[200],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "OR CONTINUE WITH",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Row(
      children: [
        Expanded(
          child: _buildSocialButton(
            "Google",
            Icons.g_mobiledata,
            Colors.white,
            Colors.grey[700]!,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _buildSocialButton(
            "Apple",
            Icons.apple,
            Colors.black,
            Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String provider, IconData icon, Color bgColor, Color contentColor) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: bgColor,
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
      child: Material(
        color: Colors.transparent,
                  child: InkWell(
          onTap: () => _handleSocialLogin(provider),
          borderRadius: BorderRadius.circular(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: contentColor, size: 24),
              SizedBox(width: 8),
              Text(
                provider,
                style: TextStyle(
                  color: contentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignupLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Color(0xFFFF8A00),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  void _handleSocialLogin(String provider) {
    _showSnackBar("$provider login integration coming soon! 🚀");
  }
}

// Custom Painter for Mountains
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

    // Create mountain silhouette
    final peakWidth = size.width / peaks.length;
    for (int i = 0; i < peaks.length; i++) {
      final x = i * peakWidth;
      final peakHeight = size.height * peaks[i];
      
      if (i == 0) {
        path.lineTo(x + peakWidth * 0.3, size.height - peakHeight * 0.3);
        path.lineTo(x + peakWidth * 0.5, size.height - peakHeight);
        path.lineTo(x + peakWidth * 0.7, size.height - peakHeight * 0.7);
      } else {
        path.lineTo(x + peakWidth * 0.3, size.height - peakHeight * 0.4);
        path.lineTo(x + peakWidth * 0.5, size.height - peakHeight);
        path.lineTo(x + peakWidth * 0.7, size.height - peakHeight * 0.6);
      }
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Clouds
class CloudPainter extends CustomPainter {
  final Color color;

  CloudPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    
    // Create cloud shape using circles
    final radius1 = size.height * 0.3;
    final radius2 = size.height * 0.4;
    final radius3 = size.height * 0.35;
    final radius4 = size.height * 0.25;

    // Main cloud body
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.25, size.height * 0.6),
      radius: radius1,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.5, size.height * 0.4),
      radius: radius2,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.75, size.height * 0.6),
      radius: radius3,
    ));
    
    path.addOval(Rect.fromCircle(
      center: Offset(size.width * 0.85, size.height * 0.75),
      radius: radius4,
    ));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}