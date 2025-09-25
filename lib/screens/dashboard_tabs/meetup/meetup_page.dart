import 'package:flutter/material.dart';

class MeetupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Meetups',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _buildMeetupCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetupCard(BuildContext context, int index) {
    final meetups = [
      {
        'title': 'Weekend Hangout at CP',
        'location': 'Connaught Place',
        'time': 'Tomorrow, 6:30 PM',
        'friends': ['Raj', 'Priya', 'Amit'],
        'status': 'confirmed',
      },
      {
        'title': 'Coffee Meet',
        'location': 'Khan Market',
        'time': 'Aug 25, 4:00 PM',
        'friends': ['Sarah', 'Dev'],
        'status': 'voting',
      },
      {
        'title': 'India Gate Picnic',
        'location': 'India Gate',
        'time': 'Aug 28, 10:00 AM',
        'friends': ['Ravi', 'Neha', 'Karan', 'Meera'],
        'status': 'planning',
      },
    ];

    if (index >= meetups.length) return SizedBox.shrink();

    final meetup = meetups[index];
    final statusColor = meetup['status'] == 'confirmed' 
        ? Colors.green 
        : meetup['status'] == 'voting' 
            ? Colors.orange 
            : Colors.blue;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    meetup['title'] as String,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    meetup['status'] as String,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                Text(
                  meetup['location'] as String,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.schedule, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                Text(
                  meetup['time'] as String,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Friends: ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Text(
                    (meetup['friends'] as List<String>).join(', '),
                    style: TextStyle(color: Color(0xFFE91E63)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}