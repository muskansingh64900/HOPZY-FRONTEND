import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            _buildProfileHeader(),
            SizedBox(height: 30),
            
            // Stats Cards
            _buildStatsCards(),
            SizedBox(height: 30),
            
            // Badges Section
            _buildBadgesSection(),
            SizedBox(height: 30),
            
            // Recent Activity
            _buildRecentActivity(),
            SizedBox(height: 30),
            
            // Settings Options
            _buildSettingsOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xFFE91E63).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'M',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Muskan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Delhi, India',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Meetup Enthusiast 🎉',
          style: TextStyle(
            color: Color(0xFFE91E63),
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsCards() {
    return Row(
      children: [
        Expanded(child: _buildStatCard('12', 'Meetups\nOrganized')),
        SizedBox(width: 12),
        Expanded(child: _buildStatCard('45', 'Friends\nMet')),
        SizedBox(width: 12),
        Expanded(child: _buildStatCard('8', 'Places\nDiscovered')),
      ],
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE91E63),
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🎖️ Your Badges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildBadge('🎯', 'Plan Master', 'Organized 10+ meetups'),
            _buildBadge('⏰', 'Always On Time', 'Never late to meetups'),
            _buildBadge('🍕', 'Foodie Explorer', 'Tried 20+ restaurants'),
            _buildBadge('📍', 'Navigator', 'Found 15+ new places'),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String emoji, String title, String description) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFE91E63).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE91E63).withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Text(emoji, style: TextStyle(fontSize: 24)),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📅 Recent Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        _buildActivityItem('Created "Weekend CP Hangout"', '2 hours ago'),
        _buildActivityItem('Joined "Coffee Lovers Meet"', '1 day ago'),
        _buildActivityItem('Earned "Foodie Explorer" badge', '3 days ago'),
        _buildActivityItem('Rated Odeon Social ⭐⭐⭐⭐⭐', '5 days ago'),
      ],
    );
  }

  Widget _buildActivityItem(String activity, String time) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Color(0xFFE91E63),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '⚙️ Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        _buildSettingsItem(Icons.edit, 'Edit Profile', () {}),
        _buildSettingsItem(Icons.notifications, 'Notifications', () {}),
        _buildSettingsItem(Icons.privacy_tip, 'Privacy Settings', () {}),
        _buildSettingsItem(Icons.help, 'Help & Support', () {}),
        _buildSettingsItem(Icons.info, 'About MeetHalf+', () {}),
        _buildSettingsItem(Icons.logout, 'Logout', () {}, isDestructive: true),
      ],
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : Color(0xFFE91E63),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey[400],
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Colors.grey[50],
      ),
    );
  }
}