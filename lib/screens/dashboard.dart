// // import 'package:flutter/material.dart';
// // import '../widgets/app_drawer.dart';
// // import '../widgets/bottom_nav.dart';
// // import 'profile.dart';
// // import 'setting.dart';

// // class DashboardScreen extends StatefulWidget {
// //   @override
// //   _DashboardScreenState createState() => _DashboardScreenState();
// // }

// // class _DashboardScreenState extends State<DashboardScreen> {
// //   int _selectedIndex = 0;

// //   // Screens for bottom navigation
// //   final List<Widget> _screens = [
// //     Center(child: Text("Home Page Content", style: TextStyle(fontSize: 20))),
// //     ProfileScreen(),
// //     SettingScreen(),
// //   ];

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("MeetHalf"),
// //         backgroundColor: Colors.teal,
// //       ),
// //       drawer: AppDrawer(), // side navigation
// //       body: _screens[_selectedIndex], // show selected page
// //       bottomNavigationBar: BottomNavBar(
// //         selectedIndex: _selectedIndex,
// //         onItemTapped: _onItemTapped,
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MeetHalfApp());
// }

// class MeetHalfApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MeetHalf+',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         primaryColor: Color(0xFFE91E63), // Magenta
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Color(0xFFE91E63),
//           elevation: 0,
//           systemOverlayStyle: SystemUiOverlayStyle.dark,
//         ),
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor: Colors.white,
//           selectedItemColor: Color(0xFFE91E63),
//           unselectedItemColor: Colors.grey[400],
//         ),
//       ),
//       home: DashboardScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     MeetupsScreen(),
//     DiscoverScreen(),
//     ChatScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) => setState(() => _currentIndex = index),
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Meetups'),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

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

// class MeetupsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Your Meetups',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFE91E63),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return _buildMeetupCard(context, index);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMeetupCard(BuildContext context, int index) {
//     final meetups = [
//       {
//         'title': 'Weekend Hangout at CP',
//         'location': 'Connaught Place',
//         'time': 'Tomorrow, 6:30 PM',
//         'friends': ['Raj', 'Priya', 'Amit'],
//         'status': 'confirmed',
//       },
//       {
//         'title': 'Coffee Meet',
//         'location': 'Khan Market',
//         'time': 'Aug 25, 4:00 PM',
//         'friends': ['Sarah', 'Dev'],
//         'status': 'voting',
//       },
//       {
//         'title': 'India Gate Picnic',
//         'location': 'India Gate',
//         'time': 'Aug 28, 10:00 AM',
//         'friends': ['Ravi', 'Neha', 'Karan', 'Meera'],
//         'status': 'planning',
//       },
//     ];

//     if (index >= meetups.length) return SizedBox.shrink();

//     final meetup = meetups[index];
//     final statusColor = meetup['status'] == 'confirmed' 
//         ? Colors.green 
//         : meetup['status'] == 'voting' 
//             ? Colors.orange 
//             : Colors.blue;

//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 8,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     meetup['title'] as String,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: statusColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     meetup['status'] as String,
//                     style: TextStyle(
//                       color: statusColor,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 8),
//             Row(
//               children: [
//                 Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
//                 SizedBox(width: 4),
//                 Text(
//                   meetup['location'] as String,
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//             SizedBox(height: 4),
//             Row(
//               children: [
//                 Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
//                 SizedBox(width: 4),
//                 Text(
//                   meetup['time'] as String,
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             Row(
//               children: [
//                 Text(
//                   'Friends: ',
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 Expanded(
//                   child: Text(
//                     (meetup['friends'] as List<String>).join(', '),
//                     style: TextStyle(color: Color(0xFFE91E63)),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DiscoverScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '✨ Discover',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFE91E63),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Popular spots and trending places',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 20),
            
//             // Filter Chips
//             _buildFilterChips(),
//             SizedBox(height: 20),
            
//             // Popular Places
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   childAspectRatio: 0.8,
//                 ),
//                 itemCount: 6,
//                 itemBuilder: (context, index) {
//                   return _buildPlaceCard(index);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterChips() {
//     final filters = ['All', 'Cafés', 'Parks', 'Malls', 'Street Food', 'Monuments'];
    
//     return Container(
//       height: 40,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: filters.length,
//         itemBuilder: (context, index) {
//           final isSelected = index == 0;
//           return Container(
//             margin: EdgeInsets.only(right: 8),
//             child: FilterChip(
//               label: Text(filters[index]),
//               selected: isSelected,
//               onSelected: (selected) {},
//               selectedColor: Color(0xFFE91E63).withOpacity(0.2),
//               checkmarkColor: Color(0xFFE91E63),
//               labelStyle: TextStyle(
//                 color: isSelected ? Color(0xFFE91E63) : Colors.grey[600],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildPlaceCard(int index) {
//     final places = [
//       {
//         'name': 'Odeon Social',
//         'location': 'Connaught Place',
//         'price': '₹₹',
//         'vibe': 'Party',
//         'rating': '4.5',
//         'distance': '12 min',
//       },
//       {
//         'name': 'India Gate',
//         'location': 'Central Delhi',
//         'price': '₹',
//         'vibe': 'Family',
//         'rating': '4.8',
//         'distance': '25 min',
//       },
//       {
//         'name': 'Sarojini Market',
//         'location': 'South Delhi',
//         'price': '₹',
//         'vibe': 'Shopping',
//         'rating': '4.2',
//         'distance': '18 min',
//       },
//       {
//         'name': 'Cyber Café',
//         'location': 'Cyber City',
//         'price': '₹₹',
//         'vibe': 'Chill',
//         'rating': '4.3',
//         'distance': '30 min',
//       },
//       {
//         'name': 'Humayun\'s Tomb',
//         'location': 'South Delhi',
//         'price': '₹',
//         'vibe': 'Heritage',
//         'rating': '4.7',
//         'distance': '22 min',
//       },
//       {
//         'name': 'Khan Market',
//         'location': 'Central Delhi',
//         'price': '₹₹₹',
//         'vibe': 'Upscale',
//         'rating': '4.4',
//         'distance': '15 min',
//       },
//     ];

//     if (index >= places.length) return SizedBox.shrink();

//     final place = places[index];
    
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 100,
//             decoration: BoxDecoration(
//               color: Color(0xFFE91E63).withOpacity(0.1),
//               borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//             ),
//             child: Center(
//               child: Text(
//                 '📍',
//                 style: TextStyle(fontSize: 32),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   place['name'] as String,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   place['location'] as String,
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 12,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       place['price'] as String,
//                       style: TextStyle(
//                         color: Color(0xFFE91E63),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       '⭐ ${place['rating']}',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       place['vibe'] as String,
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     Text(
//                       place['distance'] as String,
//                       style: TextStyle(
//                         fontSize: 10,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '💬 Chat & Voting',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFE91E63),
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return _buildChatCard(context, index);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildChatCard(BuildContext context, int index) {
//     final chats = [
//       {
//         'title': 'CP Hangout Group',
//         'lastMessage': 'Raj: I vote for Odeon Social! 🍕',
//         'time': '2m ago',
//         'unread': 3,
//       },
//       {
//         'title': 'Coffee Lovers',
//         'lastMessage': 'Sarah: Blue Tokai or Starbucks?',
//         'time': '15m ago',
//         'unread': 1,
//       },
//       {
//         'title': 'Weekend Warriors',
//         'lastMessage': 'You: India Gate sounds perfect!',
//         'time': '1h ago',
//         'unread': 0,
//       },
//     ];

//     final chat = chats[index];
    
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(16),
//         leading: CircleAvatar(
//           backgroundColor: Color(0xFFE91E63).withOpacity(0.1),
//           child: Text(
//             (chat['title'] as String)[0],
//             style: TextStyle(
//               color: Color(0xFFE91E63),
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         title: Text(
//           chat['title'] as String,
//           style: TextStyle(fontWeight: FontWeight.w600),
//         ),
//         subtitle: Text(
//           chat['lastMessage'] as String,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               chat['time'] as String,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),
//             if ((chat['unread'] as int) > 0) ...[
//               SizedBox(height: 4),
//               Container(
//                 padding: EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFE91E63),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   '${chat['unread']}',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//         onTap: () => _openChat(context, chat['title'] as String),
//       ),
//     );
//   }

//   void _openChat(BuildContext context, String chatName) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ChatDetailScreen(chatName: chatName),
//       ),
//     );
//   }
// }

// class ChatDetailScreen extends StatelessWidget {
//   final String chatName;
  
//   ChatDetailScreen({required this.chatName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(chatName),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.poll),
//             onPressed: () => _showVotingDialog(context),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(16),
//               children: [
//                 _buildMessage('Raj', 'Hey everyone! Ready for tomorrow?', '5:30 PM'),
//                 _buildMessage('You', 'Yes! Can\'t wait 🎉', '5:32 PM'),
//                 _buildMessage('Priya', 'What about the venue?', '5:35 PM'),
//                 _buildVotingCard(),
//               ],
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessage(String sender, String message, String time) {
//     final isMe = sender == 'You';
    
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.only(bottom: 12, left: isMe ? 50 : 0, right: isMe ? 0 : 50),
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: isMe ? Color(0xFFE91E63) : Colors.grey[200],
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (!isMe)
//               Text(
//                 sender,
//                 style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFE91E63),
//                 ),
//               ),
//             if (!isMe) SizedBox(height: 4),
//             Text(
//               message,
//               style: TextStyle(
//                 color: isMe ? Colors.white : Colors.black87,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               time,
//               style: TextStyle(
//                 fontSize: 10,
//                 color: isMe ? Colors.white70 : Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildVotingCard() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 16),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Color(0xFFE91E63).withOpacity(0.05),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Color(0xFFE91E63).withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.poll, color: Color(0xFFE91E63)),
//               SizedBox(width: 8),
//               Text(
//                 'Vote for Venue',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFE91E63),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12),
//           _buildVoteOption('Odeon Social, CP', 3, 4),
//           SizedBox(height: 8),
//           _buildVoteOption('Khan Market Café', 1, 4),
//           SizedBox(height: 8),
//           _buildVoteOption('India Gate Lawns', 0, 4),
//           SizedBox(height: 12),
//           Row(
//             children: [
//               Text(
//                 '3 of 4 friends voted',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               Spacer(),
//               TextButton(
//                 onPressed: () {},
//                 child: Text('View Details'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildVoteOption(String venue, int votes, int total) {
//     final percentage = total > 0 ? (votes / total) : 0.0;
    
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(venue, style: TextStyle(fontWeight: FontWeight.w500)),
//               Text('$votes votes', style: TextStyle(color: Colors.grey[600])),
//             ],
//           ),
//           SizedBox(height: 4),
//           LinearProgressIndicator(
//             value: percentage,
//             backgroundColor: Colors.grey[300],
//             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE91E63)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInput() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.grey[200]!)),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Type a message...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           FloatingActionButton.small(
//             onPressed: () {},
//             backgroundColor: Color(0xFFE91E63),
//             child: Icon(Icons.send, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showVotingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Start New Poll'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Poll Question',
//                 border: OutlineInputBorder(),
//                 hintText: 'e.g., Where should we meet?',
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Option 1',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 8),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Option 2',
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
//             onPressed: () => Navigator.pop(context),
//             child: Text('Create Poll'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           children: [
//             // Profile Header
//             _buildProfileHeader(),
//             SizedBox(height: 30),
            
//             // Stats Cards
//             _buildStatsCards(),
//             SizedBox(height: 30),
            
//             // Badges Section
//             _buildBadgesSection(),
//             SizedBox(height: 30),
            
//             // Recent Activity
//             _buildRecentActivity(),
//             SizedBox(height: 30),
            
//             // Settings Options
//             _buildSettingsOptions(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileHeader() {
//     return Column(
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//             color: Color(0xFFE91E63).withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Center(
//             child: Text(
//               'M',
//               style: TextStyle(
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFFE91E63),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 16),
//         Text(
//           'Muskan',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(
//           'Delhi, India',
//           style: TextStyle(
//             color: Colors.grey[600],
//             fontSize: 16,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'Meetup Enthusiast 🎉',
//           style: TextStyle(
//             color: Color(0xFFE91E63),
//             fontSize: 14,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatsCards() {
//     return Row(
//       children: [
//         Expanded(child: _buildStatCard('12', 'Meetups\nOrganized')),
//         SizedBox(width: 12),
//         Expanded(child: _buildStatCard('45', 'Friends\nMet')),
//         SizedBox(width: 12),
//         Expanded(child: _buildStatCard('8', 'Places\nDiscovered')),
//       ],
//     );
//   }

//   Widget _buildStatCard(String number, String label) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Text(
//             number,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFFE91E63),
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBadgesSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '🎖️ Your Badges',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 16),
//         Wrap(
//           spacing: 12,
//           runSpacing: 12,
//           children: [
//             _buildBadge('🎯', 'Plan Master', 'Organized 10+ meetups'),
//             _buildBadge('⏰', 'Always On Time', 'Never late to meetups'),
//             _buildBadge('🍕', 'Foodie Explorer', 'Tried 20+ restaurants'),
//             _buildBadge('📍', 'Navigator', 'Found 15+ new places'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildBadge(String emoji, String title, String description) {
//     return Container(
//       width: 160,
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Color(0xFFE91E63).withOpacity(0.05),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Color(0xFFE91E63).withOpacity(0.2)),
//       ),
//       child: Column(
//         children: [
//           Text(emoji, style: TextStyle(fontSize: 24)),
//           SizedBox(height: 8),
//           Text(
//             title,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             description,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 10,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRecentActivity() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '📅 Recent Activity',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 16),
//         _buildActivityItem('Created "Weekend CP Hangout"', '2 hours ago'),
//         _buildActivityItem('Joined "Coffee Lovers Meet"', '1 day ago'),
//         _buildActivityItem('Earned "Foodie Explorer" badge', '3 days ago'),
//         _buildActivityItem('Rated Odeon Social ⭐⭐⭐⭐⭐', '5 days ago'),
//       ],
//     );
//   }

//   Widget _buildActivityItem(String activity, String time) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12),
//       child: Row(
//         children: [
//           Container(
//             width: 8,
//             height: 8,
//             decoration: BoxDecoration(
//               color: Color(0xFFE91E63),
//               shape: BoxShape.circle,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   activity,
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 Text(
//                   time,
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsOptions(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '⚙️ Settings',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 16),
//         _buildSettingsItem(Icons.edit, 'Edit Profile', () {}),
//         _buildSettingsItem(Icons.notifications, 'Notifications', () {}),
//         _buildSettingsItem(Icons.privacy_tip, 'Privacy Settings', () {}),
//         _buildSettingsItem(Icons.help, 'Help & Support', () {}),
//         _buildSettingsItem(Icons.info, 'About MeetHalf+', () {}),
//         _buildSettingsItem(Icons.logout, 'Logout', () {}, isDestructive: true),
//       ],
//     );
//   }

//   Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 8),
//       child: ListTile(
//         leading: Icon(
//           icon,
//           color: isDestructive ? Colors.red : Color(0xFFE91E63),
//         ),
//         title: Text(
//           title,
//           style: TextStyle(
//             color: isDestructive ? Colors.red : Colors.black87,
//           ),
//         ),
//         trailing: Icon(
//           Icons.chevron_right,
//           color: Colors.grey[400],
//         ),
//         onTap: onTap,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//         tileColor: Colors.grey[50],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'dashboard_tabs/home/home_page.dart';
import 'dashboard_tabs/meetup/meetup_page.dart';
import 'dashboard_tabs/discover/discover_page.dart';
import 'dashboard_tabs/chat/chat_screen.dart';
import 'dashboard_tabs/profile/profile_page.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MeetupScreen(),
    DiscoverScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Meetups'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}