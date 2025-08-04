import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String avatar;
  final String timestamp;
  final String badge;
  final Color badgeColor;
  final String content;
  final bool hasImage;
  final String? imageUrl;
  final int likes;
  final int comments;
  final String commentPreview;
  final VoidCallback onLike;
  final VoidCallback onComment;

  const PostCard({
    super.key,
    required this.username,
    required this.avatar,
    required this.timestamp,
    required this.badge,
    required this.badgeColor,
    required this.content,
    this.hasImage = false,
    this.imageUrl,
    required this.likes,
    required this.comments,
    required this.commentPreview,
    required this.onLike,
    required this.onComment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Header
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Text(
                    avatar,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      Text(
                        timestamp,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: badgeColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: badgeColor,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Content
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.onSurface,
              ),
            ),
            
            // Image (if any)
            if (hasImage && imageUrl != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            
            const SizedBox(height: 16),
            
            // Engagement Metrics
            Row(
              children: [
                _buildEngagementButton(
                  icon: Icons.favorite_border,
                  label: likes.toString(),
                  onTap: onLike,
                  color: AppColors.like,
                ),
                const SizedBox(width: 24),
                _buildEngagementButton(
                  icon: Icons.chat_bubble_outline,
                  label: comments.toString(),
                  onTap: onComment,
                  color: AppColors.comment,
                ),
              ],
            ),
            
            // Comments Preview
            if (comments > 0) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commentPreview,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.onSurface,
                      ),
                    ),
                    if (comments > 1) ...[
                      const SizedBox(height: 4),
                      Text(
                        'View all $comments comments',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEngagementButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
} 