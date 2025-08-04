class AppConstants {
  // App Information
  static const String appName = 'Waddle';
  static const String appVersion = '1.0.0';
  
  // Navigation
  static const int bottomNavigationItemCount = 5;
  
  // Dashboard
  static const int weeklyProgressDays = 7;
  static const int defaultCalorieGoal = 2000;
  static const int defaultStepsGoal = 10000;
  
  // Pet System
  static const String defaultPetName = 'Penguin';
  static const int maxPetLevel = 100;
  static const int maxPetHappiness = 100;
  static const int maxPetEnergy = 100;
  static const int maxPetHealth = 100;
  
  // Goals & Missions
  static const int maxDailyGoals = 10;
  static const int maxWeeklyGoals = 20;
  
  // Social
  static const int maxPostLength = 500;
  static const int maxCommentLength = 200;
  
  // Storage Keys
  static const String userPreferencesKey = 'user_preferences';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  static const String notificationsKey = 'notifications_enabled';
  
  // API Endpoints (for future use)
  static const String baseUrl = 'https://api.waddle.app';
  static const String foodRecognitionEndpoint = '/api/food/recognize';
  
  // File Upload
  static const int maxImageSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Cache
  static const Duration imageCacheDuration = Duration(days: 7);
  static const Duration dataCacheDuration = Duration(hours: 1);
  
  // Validation
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 20;
  static const int minPasswordLength = 6;
  
  // Health & Fitness
  static const double minWeight = 20.0; // kg
  static const double maxWeight = 300.0; // kg
  static const double minHeight = 100.0; // cm
  static const double maxHeight = 250.0; // cm
  static const int minAge = 13;
  static const int maxAge = 120;
  
  // Workout Types
  static const List<String> workoutTypes = [
    'Running',
    'Swimming',
    'Cycling',
    'Walking',
    'Strength Training',
    'Yoga',
    'Pilates',
    'HIIT',
    'Dancing',
    'Basketball',
    'Soccer',
    'Tennis',
    'Golf',
    'Hiking',
    'Rock Climbing',
    'Boxing',
    'Martial Arts',
    'CrossFit',
    'Rowing',
    'Elliptical',
    'Stair Climber',
    'Other',
  ];
  
  // Meal Types
  static const List<String> mealTypes = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
  ];
  
  // Goal Categories
  static const List<String> goalCategories = [
    'Health',
    'Diet',
    'Fitness',
    'Custom',
  ];
  
  // Goal Frequencies
  static const List<String> goalFrequencies = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];
  
  // Units
  static const List<String> weightUnits = ['kg', 'lbs'];
  static const List<String> heightUnits = ['cm', 'ft'];
  static const List<String> distanceUnits = ['km', 'miles'];
  static const List<String> timeUnits = ['minutes', 'hours'];
  
  // Activity Levels
  static const List<String> activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extremely Active',
  ];
  
  // Error Messages
  static const String networkErrorMessage = 'Please check your internet connection and try again.';
  static const String generalErrorMessage = 'Something went wrong. Please try again.';
  static const String validationErrorMessage = 'Please check your input and try again.';
  
  // Success Messages
  static const String profileUpdatedMessage = 'Profile updated successfully!';
  static const String goalCompletedMessage = 'Goal completed! Great job!';
  static const String mealLoggedMessage = 'Meal logged successfully!';
  static const String workoutLoggedMessage = 'Workout logged successfully!';
} 