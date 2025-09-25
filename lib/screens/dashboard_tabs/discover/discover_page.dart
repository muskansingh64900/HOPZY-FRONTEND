import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✨ Discover',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE91E63),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Popular spots and trending places',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            
            // Filter Chips
            _buildFilterChips(),
            SizedBox(height: 20),
            
            // Popular Places
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildPlaceCard(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    final filters = ['All', 'Cafés', 'Parks', 'Malls', 'Street Food', 'Monuments'];
    
    return Container(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filters[index]),
              selected: isSelected,
              onSelected: (selected) {},
              selectedColor: Color(0xFFE91E63).withOpacity(0.2),
              checkmarkColor: Color(0xFFE91E63),
              labelStyle: TextStyle(
                color: isSelected ? Color(0xFFE91E63) : Colors.grey[600],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceCard(int index) {
    final places = [
      {
        'name': 'Odeon Social',
        'location': 'Connaught Place',
        'price': '₹₹',
        'vibe': 'Party',
        'rating': '4.5',
        'distance': '12 min',
      },
      {
        'name': 'India Gate',
        'location': 'Central Delhi',
        'price': '₹',
        'vibe': 'Family',
        'rating': '4.8',
        'distance': '25 min',
      },
      {
        'name': 'Sarojini Market',
        'location': 'South Delhi',
        'price': '₹',
        'vibe': 'Shopping',
        'rating': '4.2',
        'distance': '18 min',
      },
      {
        'name': 'Cyber Café',
        'location': 'Cyber City',
        'price': '₹₹',
        'vibe': 'Chill',
        'rating': '4.3',
        'distance': '30 min',
      },
      {
        'name': 'Humayun\'s Tomb',
        'location': 'South Delhi',
        'price': '₹',
        'vibe': 'Heritage',
        'rating': '4.7',
        'distance': '22 min',
      },
      {
        'name': 'Khan Market',
        'location': 'Central Delhi',
        'price': '₹₹₹',
        'vibe': 'Upscale',
        'rating': '4.4',
        'distance': '15 min',
      },
    ];

    if (index >= places.length) return SizedBox.shrink();

    final place = places[index];
    
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFE91E63).withOpacity(0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Text(
                '📍',
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  place['name'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  place['location'] as String,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      place['price'] as String,
                      style: TextStyle(
                        color: Color(0xFFE91E63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '⭐ ${place['rating']}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      place['vibe'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      place['distance'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}