class AppConstants {
  // App Information
  static const String appName = 'Waddle';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'A gamified health and fitness mobile app';
  
  // Dimensions
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
  
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;
  
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  
  // API Configuration
  static const int apiTimeout = 30000; // 30 seconds
  static const int maxRetries = 3;
  
  // Cache Configuration
  static const int cacheExpiryHours = 24;
  static const int maxCacheSize = 50; // MB
  
  // Health & Fitness Constants
  static const int defaultCalorieGoal = 2000;
  static const int defaultStepGoal = 10000;
  static const int defaultWaterGoal = 2000; // ml
  
  // Pet System Constants
  static const int maxPetLevel = 100;
  static const int maxPetHappiness = 100;
  static const int maxPetEnergy = 100;
  static const int maxPetHealth = 100;
  
  // Social Constants
  static const int maxPostLength = 500;
  static const int maxCommentLength = 200;
  
  // File Upload Limits
  static const int maxImageSize = 10; // MB
  static const int maxVideoSize = 100; // MB
  
  // Validation Constants
  static const int minPasswordLength = 8;
  static const int maxUsernameLength = 30;
  static const int minUsernameLength = 3;
  
  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String displayTimeFormat = 'h:mm a';
  
  // Storage Keys
  static const String userPreferencesKey = 'user_preferences';
  static const String authTokenKey = 'auth_token';
  static const String userProfileKey = 'user_profile';
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  
  // Firebase Collections
  static const String usersCollection = 'users';
  static const String dailyLogsCollection = 'dailyLogs';
  static const String mealsCollection = 'meals';
  static const String workoutsCollection = 'workouts';
  static const String goalsCollection = 'goals';
  static const String postsCollection = 'posts';
  static const String commentsCollection = 'comments';
  static const String petsCollection = 'pets';
  static const String petItemsCollection = 'petItems';
  static const String petRoomsCollection = 'petRooms';
  static const String analyticsCollection = 'analytics';
} 