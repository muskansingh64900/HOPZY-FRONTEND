import 'package:flutter/material.dart';
import 'chat_detail_page.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '💬 Chat & Voting',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _buildChatCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatCard(BuildContext context, int index) {
    final chats = [
      {
        'title': 'CP Hangout Group',
        'lastMessage': 'Raj: I vote for Odeon Social! 🍕',
        'time': '2m ago',
        'unread': 3,
      },
      {
        'title': 'Coffee Lovers',
        'lastMessage': 'Sarah: Blue Tokai or Starbucks?',
        'time': '15m ago',
        'unread': 1,
      },
      {
        'title': 'Weekend Warriors',
        'lastMessage': 'You: India Gate sounds perfect!',
        'time': '1h ago',
        'unread': 0,
      },
    ];

    final chat = chats[index];
    
    return Container(
      margin: EdgeInsets.only(bottom: 16),
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
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Color(0xFFE91E63).withOpacity(0.1),
          child: Text(
            (chat['title'] as String)[0],
            style: TextStyle(
              color: Color(0xFFE91E63),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          chat['title'] as String,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          chat['lastMessage'] as String,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              chat['time'] as String,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            if ((chat['unread'] as int) > 0) ...[
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Color(0xFFE91E63),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${chat['unread']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
        onTap: () => _openChat(context, chat['title'] as String),
      ),
    );
  }

  void _openChat(BuildContext context, String chatName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(chatName: chatName),
      ),
    );
  }
}