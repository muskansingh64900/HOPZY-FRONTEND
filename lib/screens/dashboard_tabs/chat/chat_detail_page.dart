import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  final String chatName;
  
  ChatDetailScreen({required this.chatName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatName),
        actions: [
          IconButton(
            icon: Icon(Icons.poll),
            onPressed: () => _showVotingDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildMessage('Raj', 'Hey everyone! Ready for tomorrow?', '5:30 PM'),
                _buildMessage('You', 'Yes! Can\'t wait 🎉', '5:32 PM'),
                _buildMessage('Priya', 'What about the venue?', '5:35 PM'),
                _buildVotingCard(),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String sender, String message, String time) {
    final isMe = sender == 'You';
    
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: isMe ? 50 : 0, right: isMe ? 0 : 50),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Color(0xFFE91E63) : Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMe)
              Text(
                sender,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
              ),
            if (!isMe) SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
              ),
            ),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                fontSize: 10,
                color: isMe ? Colors.white70 : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVotingCard() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE91E63).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFE91E63).withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.poll, color: Color(0xFFE91E63)),
              SizedBox(width: 8),
              Text(
                'Vote for Venue',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          _buildVoteOption('Odeon Social, CP', 3, 4),
          SizedBox(height: 8),
          _buildVoteOption('Khan Market Café', 1, 4),
          SizedBox(height: 8),
          _buildVoteOption('India Gate Lawns', 0, 4),
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                '3 of 4 friends voted',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text('View Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoteOption(String venue, int votes, int total) {
    final percentage = total > 0 ? (votes / total) : 0.0;
    
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(venue, style: TextStyle(fontWeight: FontWeight.w500)),
              Text('$votes votes', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE91E63)),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ),
          SizedBox(width: 8),
          FloatingActionButton.small(
            onPressed: () {},
            backgroundColor: Color(0xFFE91E63),
            child: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _showVotingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Start New Poll'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Poll Question',
                border: OutlineInputBorder(),
                hintText: 'e.g., Where should we meet?',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Option 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: 'Option 2',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Create Poll'),
          ),
        ],
      ),
    );
  }
}