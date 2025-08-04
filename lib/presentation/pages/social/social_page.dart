import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/colors.dart';
import 'widgets/post_card_widget.dart';

class SocialPage extends ConsumerWidget {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Community',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.onSurface,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Implement menu functionality
            },
            icon: const Icon(
              Icons.menu,
              color: AppColors.onSurface,
              size: 24,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Workout Post
            PostCard(
              username: 'Lump',
              avatar: '🐧',
              timestamp: '2 hours ago',
              badge: 'Workout',
              badgeColor: AppColors.secondary,
              content: 'Morning HIIT Session',
              likes: 12,
              comments: 2,
              commentPreview: '🏃 Lump: Lets workout together next time!',
              onLike: () {
                // TODO: Implement like functionality
              },
              onComment: () {
                // TODO: Implement comment functionality
              },
            ),
            
            const SizedBox(height: 16),
            
            // Food Post
            PostCard(
              username: 'Corvidae',
              avatar: '🐧',
              timestamp: '4 hours ago',
              badge: 'Meal',
              badgeColor: AppColors.primary,
              content: 'Burrito Bowl',
              hasImage: true,
              imageUrl: 'https://via.placeholder.com/300x200/4CAF50/FFFFFF?text=Burrito+Bowl',
              likes: 8,
              comments: 1,
              commentPreview: '😊 Corvidae: Need to try this',
              onLike: () {
                // TODO: Implement like functionality
              },
              onComment: () {
                // TODO: Implement comment functionality
              },
            ),
            
            const SizedBox(height: 16),
            
            // Another Workout Post
            PostCard(
              username: 'Globby',
              avatar: '🐧',
              timestamp: '6 hours ago',
              badge: 'Workout',
              badgeColor: AppColors.secondary,
              content: 'Just finished my evening run! Feeling great!',
              likes: 15,
              comments: 3,
              commentPreview: '💪 Globby: Great job! Keep it up!',
              onLike: () {
                // TODO: Implement like functionality
              },
              onComment: () {
                // TODO: Implement comment functionality
              },
            ),
            
            const SizedBox(height: 16),
            
            // Food Post with Image
            PostCard(
              username: 'Lump',
              avatar: '🐧',
              timestamp: '8 hours ago',
              badge: 'Meal',
              badgeColor: AppColors.primary,
              content: 'Healthy breakfast bowl with fruits and granola',
              hasImage: true,
              imageUrl: 'https://via.placeholder.com/300x200/FF9800/FFFFFF?text=Breakfast+Bowl',
              likes: 20,
              comments: 5,
              commentPreview: '🍎 Lump: Looks delicious!',
              onLike: () {
                // TODO: Implement like functionality
              },
              onComment: () {
                // TODO: Implement comment functionality
              },
            ),
          ],
        ),
      ),
    );
  }
} 