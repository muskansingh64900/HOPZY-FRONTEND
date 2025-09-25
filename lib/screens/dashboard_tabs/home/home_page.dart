// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Section
//             _buildHeader(),
//             SizedBox(height: 20),
            
//             // Quick Action Buttons
//             _buildQuickActions(context),
//             SizedBox(height: 30),
            
//             // Feature Cards
//             _buildFeatureCards(context),
//             SizedBox(height: 20),
            
//             // Recent Meetups
//             _buildRecentMeetups(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '👋 Hi, Muskan!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFE91E63),
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               'Ready for your next adventure?',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: Color(0xFFE91E63).withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: IconButton(
//             icon: Icon(Icons.notifications, color: Color(0xFFE91E63)),
//             onPressed: () {},
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildQuickActions(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildActionButton(
//             context,
//             '➕ Create Meetup',
//             Color(0xFFE91E63),
//             Colors.white,
//             () => _showCreateMeetupDialog(context),
//           ),
//         ),
//         SizedBox(width: 12),
//         Expanded(
//           child: _buildActionButton(
//             context,
//             '🔗 Join via Code',
//             Colors.white,
//             Color(0xFFE91E63),
//             () => _showJoinDialog(context),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildActionButton(BuildContext context, String text, Color bgColor, Color textColor, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: bgColor,
//         foregroundColor: textColor,
//         padding: EdgeInsets.symmetric(vertical: 16),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//           side: bgColor == Colors.white ? BorderSide(color: Color(0xFFE91E63)) : BorderSide.none,
//         ),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(fontWeight: FontWeight.w600),
//       ),
//     );
//   }

//   Widget _buildFeatureCards(BuildContext context) {
//     final features = [
//       {
//         'icon': '🔍',
//         'title': 'Search Hangout Spots',
//         'subtitle': 'Discover places anywhere',
//         'color': Colors.blue[50],
//       },
//       {
//         'icon': '📍',
//         'title': 'Smart Midpoint',
//         'subtitle': 'Fair meeting spots',
//         'color': Colors.green[50],
//       },
//       {
//         'icon': '🎯',
//         'title': 'Suggested Itineraries',
//         'subtitle': 'Curated experiences',
//         'color': Colors.orange[50],
//       },
//       {
//         'icon': '⚡',
//         'title': 'Quick Polls',
//         'subtitle': 'Vote with friends',
//         'color': Colors.purple[50],
//       },
//     ];

//     return GridView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         childAspectRatio: 1.2,
//       ),
//       itemCount: features.length,
//       itemBuilder: (context, index) {
//         final feature = features[index];
//         return Container(
//           decoration: BoxDecoration(
//             color: feature['color'] as Color?,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.grey[200]!),
//           ),
//           child: InkWell(
//             onTap: () => _navigateToFeature(context, feature['title'] as String),
//             borderRadius: BorderRadius.circular(16),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     feature['icon'] as String,
//                     style: TextStyle(fontSize: 32),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     feature['title'] as String,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey[800],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     feature['subtitle'] as String,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildRecentMeetups() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '🕘 Recent Meetups',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[800],
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text('View All', style: TextStyle(color: Color(0xFFE91E63))),
//             ),
//           ],
//         ),
//         SizedBox(height: 12),
//         Container(
//           height: 120,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               final meetups = [
//                 {'name': 'CP Hangout', 'date': 'Aug 15', 'friends': '5 friends'},
//                 {'name': 'India Gate', 'date': 'Aug 10', 'friends': '3 friends'},
//                 {'name': 'Khan Market', 'date': 'Aug 5', 'friends': '4 friends'},
//               ];
              
//               return Container(
//                 width: 160,
//                 margin: EdgeInsets.only(right: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.1),
//                       spreadRadius: 1,
//                       blurRadius: 6,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         meetups[index]['name']!,
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         meetups[index]['date']!,
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         meetups[index]['friends']!,
//                         style: TextStyle(
//                           color: Color(0xFFE91E63),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   void _showCreateMeetupDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Create New Meetup'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Meetup Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Description (optional)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Meetup created! Share the link with friends.')),
//               );
//             },
//             child: Text('Create'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showJoinDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Join Meetup'),
//         content: TextField(
//           decoration: InputDecoration(
//             labelText: 'Enter meetup code',
//             border: OutlineInputBorder(),
//             hintText: 'e.g., MEET123',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Joined meetup successfully!')),
//               );
//             },
//             child: Text('Join'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _navigateToFeature(BuildContext context, String featureName) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Opening $featureName...')),
//     );
//   }
// }



















import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  final Map<String, dynamic> user;
  HomeScreen({required this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _floatingController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _floatingController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _floatingAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _floatingController.dispose();
    super.dispose();
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
              Color(0xFFFFF8E1), // Very light cream at bottom
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              _buildTravelBackground(),
              _buildFloatingElements(),
              FadeTransition(
                opacity: _fadeAnimation,
                child: AnimatedBuilder(
                  animation: _slideAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: _buildMainContent(),
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
        // Mountains Layers
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.3),
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
            size: Size(screenWidth, screenHeight * 0.25),
            painter: MountainPainter(
              color: Color(0xFF2C5F5D).withOpacity(0.3),
              peaks: [0.6, 0.4, 0.8, 0.3, 0.7],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CustomPaint(
            size: Size(screenWidth, screenHeight * 0.2),
            painter: MountainPainter(
              color: Color(0xFF2C5F5D).withOpacity(0.5),
              peaks: [0.3, 0.6, 0.4, 0.7, 0.3],
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
              top: 60 + _floatingAnimation.value * 0.3,
              left: 30,
              child: CustomPaint(
                size: Size(80, 40),
                painter: CloudPainter(color: Colors.white.withOpacity(0.8)),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 100 - _floatingAnimation.value * 0.4,
              right: 40,
              child: CustomPaint(
                size: Size(100, 50),
                painter: CloudPainter(color: Colors.white.withOpacity(0.7)),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 140 + _floatingAnimation.value * 0.2,
              left: 10,
              child: CustomPaint(
                size: Size(60, 30),
                painter: CloudPainter(color: Colors.white.withOpacity(0.6)),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildTravelIcons() {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              bottom: 180 + _floatingAnimation.value * 0.3,
              left: 20,
              child: Icon(
                Icons.luggage,
                size: 22,
                color: Color(0xFFFF8A00).withOpacity(0.4),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 120,
              right: 30,
              child: Transform.translate(
                offset: Offset(0, -_floatingAnimation.value * 0.4),
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Color(0xFF2C5F5D).withOpacity(0.4),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              bottom: 140,
              right: 60,
              child: Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.5),
                child: Icon(
                  Icons.map,
                  size: 18,
                  color: Color(0xFF4A90A4).withOpacity(0.3),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Positioned(
              top: 180,
              left: 60,
              child: Transform.translate(
                offset: Offset(0, -_floatingAnimation.value * 0.6),
                child: Icon(
                  Icons.explore,
                  size: 20,
                  color: Color(0xFFFF8A00).withOpacity(0.3),
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
              top: 50 + _floatingAnimation.value,
              right: 10,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFFFF8A00).withOpacity(0.1),
                      Color(0xFFFF8A00).withOpacity(0.02),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      color: Color(0xFFFF8A00).withOpacity(0.01),
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
              top: 150 - _floatingAnimation.value,
              left: 5,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF4A90A4).withOpacity(0.08),
                      Color(0xFF4A90A4).withOpacity(0.01),
                    ],
                  ),
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
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

  Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: 20),
          _buildQuickActions(),
          SizedBox(height: 30),
          _buildFeatureCards(),
          SizedBox(height: 20),
          _buildRecentMeetups(),
        ],
      ),
    );
  }



  Widget _buildHeader() {
  // Get user name and city from the user map passed from Dashboard
  String userName = widget.user['full_name'] ?? 'Traveler'; // default if null
  String userLocation = widget.user['city'] ?? 'Your City'; // default if null

  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 20,
          offset: Offset(0, 10),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2C5F5D),
                                Color(0xFFFF8A00),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.waving_hand,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, $userName!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C5F5D),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: Colors.grey[600],
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '$userLocation',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  // Future: Make this clickable to open map for selecting location
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     // TODO: Open map to select location
                                  //   },
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF8A00).withOpacity(0.2),
                      Color(0xFF2C5F5D).withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  icon: Icon(Icons.notifications, color: Color(0xFF2C5F5D)),
                  onPressed: () {
                    _showSnackBar('Notifications feature coming soon!');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}







  // Widget _buildHeader() {
  //   return Container(
  //     padding: EdgeInsets.all(20),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.08),
  //           blurRadius: 20,
  //           offset: Offset(0, 10),
  //         ),
  //       ],
  //     ),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(20),
  //       child: BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white.withOpacity(0.9),
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Container(
  //                           padding: EdgeInsets.all(8),
  //                           decoration: BoxDecoration(
  //                             gradient: LinearGradient(
  //                               colors: [
  //                                 Color(0xFF2C5F5D),
  //                                 Color(0xFFFF8A00),
  //                               ],
  //                             ),
  //                             borderRadius: BorderRadius.circular(12),
  //                           ),
  //                           child: Icon(
  //                             Icons.waving_hand,
  //                             color: Colors.white,
  //                             size: 20,
  //                           ),
  //                         ),
  //                         SizedBox(width: 12),
  //                         Expanded(
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 'Hi, Muskan!',
  //                                 style: TextStyle(
  //                                   fontSize: 24,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: Color(0xFF2C5F5D),
  //                                 ),
  //                               ),
  //                               Text(
  //                                 'Ready for your next adventure?',
  //                                 style: TextStyle(
  //                                   fontSize: 16,
  //                                   color: Colors.grey[600],
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               Container(
  //                 decoration: BoxDecoration(
  //                   gradient: LinearGradient(
  //                     colors: [
  //                       Color(0xFFFF8A00).withOpacity(0.2),
  //                       Color(0xFF2C5F5D).withOpacity(0.1),
  //                     ],
  //                   ),
  //                   borderRadius: BorderRadius.circular(16),
  //                 ),
  //                 child: IconButton(
  //                   icon: Icon(Icons.notifications, color: Color(0xFF2C5F5D)),
  //                   onPressed: () {
  //                     _showSnackBar('Notifications feature coming soon!');
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildQuickActions() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            'Create Meetup',
            Icons.add_circle,
            Color(0xFF2C5F5D),
            Colors.white,
            () => _showCreateMeetupDialog(),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            'Join via Code',
            Icons.link,
            Colors.white,
            Color(0xFF2C5F5D),
            () => _showJoinDialog(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, IconData icon, Color bgColor, Color textColor, VoidCallback onPressed) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: bgColor == Colors.white 
            ? null 
            : LinearGradient(
                colors: [Color(0xFF2C5F5D), Color(0xFF4A90A4)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        color: bgColor == Colors.white ? Colors.white : null,
        borderRadius: BorderRadius.circular(16),
        border: bgColor == Colors.white 
            ? Border.all(color: Color(0xFF2C5F5D), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: bgColor == Colors.white 
                ? Colors.black.withOpacity(0.05)
                : Color(0xFF2C5F5D).withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: textColor, size: 20),
                SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCards() {
    final features = [
      {
        'icon': Icons.search,
        'title': 'Search Hangout Spots',
        'subtitle': 'Discover places anywhere',
        'color': Color(0xFF2C5F5D),
        'bgColor': Color(0xFF2C5F5D).withOpacity(0.1),
      },
      {
        'icon': Icons.location_on,
        'title': 'Smart Midpoint',
        'subtitle': 'Fair meeting spots',
        'color': Color(0xFF4A90A4),
        'bgColor': Color(0xFF4A90A4).withOpacity(0.1),
      },
      {
        'icon': Icons.route,
        'title': 'Suggested Itineraries',
        'subtitle': 'Curated experiences',
        'color': Color(0xFFFF8A00),
        'bgColor': Color(0xFFFF8A00).withOpacity(0.1),
      },
      {
        'icon': Icons.poll,
        'title': 'Quick Polls',
        'subtitle': 'Vote with friends',
        'color': Color(0xFF2C5F5D),
        'bgColor': Color(0xFF2C5F5D).withOpacity(0.1),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _navigateToFeature(feature['title'] as String),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: feature['bgColor'] as Color,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              feature['icon'] as IconData,
                              color: feature['color'] as Color,
                              size: 28,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            feature['title'] as String,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            feature['subtitle'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentMeetups() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2C5F5D).withOpacity(0.2),
                                Color(0xFFFF8A00).withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.history,
                            color: Color(0xFF2C5F5D),
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Recent Meetups',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        _showSnackBar('View All feature coming soon!');
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFFFF8A00),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      final meetups = [
                        {
                          'name': 'CP Hangout',
                          'date': 'Aug 15',
                          'friends': '5 friends',
                          'icon': Icons.shopping_bag,
                        },
                        {
                          'name': 'India Gate',
                          'date': 'Aug 10',
                          'friends': '3 friends',
                          'icon': Icons.account_balance,
                        },
                        {
                          'name': 'Khan Market',
                          'date': 'Aug 5',
                          'friends': '4 friends',
                          'icon': Icons.store,
                        },
                      ];
                      
                      return Container(
                        width: 180,
                        margin: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF2C5F5D).withOpacity(0.05),
                              Color(0xFFFF8A00).withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Color(0xFF2C5F5D).withOpacity(0.1),
                            width: 1,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              _showSnackBar('Opening ${meetups[index]['name']}...');
                            },
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF2C5F5D).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      meetups[index]['icon'] as IconData,
                                      color: Color(0xFF2C5F5D),
                                      size: 24,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    meetups[index]['name'] as String,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    meetups[index]['date'] as String,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    meetups[index]['friends'] as String,
                                    style: TextStyle(
                                      color: Color(0xFFFF8A00),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }

  void _showCreateMeetupDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2C5F5D), Color(0xFFFF8A00)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.add_circle, color: Colors.white, size: 20),
            ),
            SizedBox(width: 12),
            Text(
              'Create New Meetup',
              style: TextStyle(
                color: Color(0xFF2C5F5D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Meetup Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2C5F5D), width: 2),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF2C5F5D), width: 2),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C5F5D), Color(0xFFFF8A00)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackBar('Meetup created! Share the link with friends.');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Create',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showJoinDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2C5F5D), Color(0xFFFF8A00)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.link, color: Colors.white, size: 20),
            ),
            SizedBox(width: 12),
            Text(
              'Join Meetup',
              style: TextStyle(
                color: Color(0xFF2C5F5D),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: TextField(
          decoration: InputDecoration(
            labelText: 'Enter meetup code',
            hintText: 'e.g., MEET123',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xFF2C5F5D), width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2C5F5D), Color(0xFFFF8A00)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSnackBar('Joined meetup successfully!');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Join',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToFeature(String featureName) {
    _showSnackBar('Opening $featureName...');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Color(0xFF2C5F5D),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        action: SnackBarAction(
          label: 'OK',
          textColor: Color(0xFFFF8A00),
          onPressed: () {},
        ),
      ),
    );
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

    final peakWidth = size.width / (peaks.length - 1);
    
    for (int i = 0; i < peaks.length; i++) {
      final x = i * peakWidth;
      final peakHeight = size.height * peaks[i];
      
      if (i == 0) {
        path.lineTo(x, size.height - peakHeight);
      } else if (i == peaks.length - 1) {
        path.lineTo(x, size.height - peakHeight);
      } else {
        final controlX1 = x - peakWidth * 0.3;
        final controlY1 = size.height - peakHeight * 0.7;
        
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
    
    final radius1 = size.height * 0.35;
    final radius2 = size.height * 0.45;
    final radius3 = size.height * 0.4;
    final radius4 = size.height * 0.3;

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

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}