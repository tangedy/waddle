# Waddle App – Developer Implementation Guide

> **Version**: 1.0  
> **Last Updated**: August 2025  
> **Target Platforms**: iOS & Android 

## 📋 Table of Contents

- [Executive Summary](#executive-summary)
- [App Architecture Overview](#app-architecture-overview)
- [Screen Specifications](#screen-specifications)
- [Technical Implementation](#technical-implementation)
- [Gamification Elements](#gamification-elements)
- [Data Models](#data-models)
- [Development Roadmap](#development-roadmap)
- [Project Structure](#project-structure)

---

## 🎯 Executive Summary

**Waddle** is a gamified health and fitness mobile app featuring a customizable virtual pet (penguin), social engagement, and comprehensive health tracking. The app combines goal tracking, nutrition and exercise logging, calendar views, and social features with a clean, modern UI designed to encourage consistent healthy habits through positive reinforcement and community support.

### Key Features
- 🐧 **Virtual Pet System**: Customizable penguin companion
- 📊 **Health Tracking**: Comprehensive fitness and nutrition logging
- 🎮 **Gamification**: Missions, streaks, and rewards
- 👥 **Social Features**: Community feed and friend interactions
- 📅 **Progress Visualization**: Calendar views and analytics
- 📱 **Modern UI**: Card-based design with intuitive navigation

---

## 🏗️ App Architecture Overview

### Technology Stack
- **Frontend**: Flutter
- **Backend/Database**: Firebase (Firestore, Authentication, Storage)
- **State Management**: Provider/Riverpod or Bloc pattern
- **Local Storage**: SharedPreferences for user settings
- **Image Processing**: ML Kit for food recognition

### Design System
- **Color Scheme**: Light background with green accent colors, orange/red highlights
- **Design Style**: Card-based layout with rounded corners and subtle shadows
- **Typography**: Clean, modern fonts with clear hierarchy

### Navigation Structure
| Tab | Icon | Screen | Description |
|-----|------|--------|-------------|
| 1 | 👤 | Profile/Social | User profile and community feed |
| 2 | 🏠 | Dashboard/Home | Main dashboard with progress overview |
| 3 | ➕ | Logging | Modal for food/workout logging |
| 4 | 📅 | Calendar | Monthly activity and progress view |
| 5 | ⚙️ | Settings/Menu | App settings and user preferences |

---

## 📱 Screen Specifications

### 🏠 Dashboard (Home Screen)

#### Top Section
- **App Title**: "Waddle" with flame icon and streak counter (e.g., "🔥15")
- **Weekly Progress Circles**: 7 circular progress indicators showing daily completion
  - Numbers 15-21 representing days
  - Dotted circles that fill based on daily goal completion

#### Pet & Missions Card
- **Left Side**: Animated penguin character with headphones
- **Right Side**: "MISSIONS" section with progress bar
  - Checkboxes for completed tasks (✅ Daily run, ✅ Stretches)
  - Unchecked items (□ Log food)
  - Expandable overlay modal when tapped

#### Calories Section
- **Large Circular Progress Indicator**: Shows calories remaining
  - Example: "1000 Calories left" with red dot on green progress ring
- **Visual Design**: Prominent circular chart with clear typography

#### Activity Summary Card
- **Workout Stats**: 
  - Duration: "50 mins" with dumbbell icon
  - Calories burned: "370 cals" with flame icon
- **Steps Counter**: "2156 steps, 7km distance"

#### Weight Tracking Card
- **Title**: "Weight - last 90 days" with edit icon
- **Line Chart**: Green line graph showing weight trends over time
- **Time Axis**: Shows dates (5/24, 5/24, etc.)
- **Weight Values**: Y-axis from 165-180+ range

#### Macronutrients Section
- **Title**: "Macronutrients - Today"
- **Four Pill-Shaped Cards** (2x2 grid):
  - 🍞 **Carbohydrates**: 173g (red/pink)
  - 🥩 **Protein**: 173g (blue/teal)
  - 🧈 **Fats**: 173g (orange/yellow)
  - 🌾 **Fiber**: 18g (purple)

### 📋 Missions/Goals Modal

#### Trigger
Tapping the "MISSIONS" section opens an overlay modal

#### Modal Content
- **Header**: "MISSIONS" with colored progress bar and "close" button
- **Goal List**:
  - ✅ Daily run (completed - strikethrough text with X button)
  - ✅ Stretches (completed - strikethrough text with X button)
  - □ Log food (incomplete with X button)
- **Add Goal**: "add a goal ✏️" button at bottom
- **Background**: Blurred main screen behind modal

#### Functionality
- Mark goals complete/incomplete
- Remove goals with X buttons
- Add new custom goals
- Progress bar shows overall completion percentage

### 📅 Calendar Page

#### Header
- **Month/Year**: "June 2025"
- **Week Labels**: S M T W T F S

#### Calendar Grid
- **Previous Month Preview**: Shows end of May with completion indicators
- **Daily Indicators**: 
  - **Circles**: Green circles with numbers (likely representing calorie goals met)
  - **Background Highlights**: Light green background on some dates
  - **Number Display**: Shows "14" on most dates (possibly goal count or score)
- **Empty States**: Gray circles for days without activity

#### Visual Design
- Clean, minimal calendar layout
- Green color scheme for completed days
- Clear visual hierarchy with month sections
- Easy scanning of progress over time

### 📸 Logging Modal (+ Button)

#### Initial Prompt
When "+" is tapped, shows modal with two options:
- 🥗 **Food Logging**: Salad bowl icon
- 🏋️ **Workout Logging**: Dumbbell icon
- **Question**: "What are you posting today?"
- **Background**: Blurred main screen

#### Food Logging Flow

##### 1. Camera Scanner Page
- **Header**: "Scanner" with X close button
- **Camera View**: Full-screen camera interface
- **Scan Frame**: White corner brackets indicating scan area
- **Bottom Controls**: 
  - Gallery icon (left)
  - Capture button (center, large white circle)
- **Overlay**: "MEAL" indicator when food is detected

##### 2. Food Analysis Results
- **Image Display**: Full-screen photo of scanned meal
- **Meal Info Card** (bottom overlay):
  - **Dish Name**: "Veggie Ramen"
  - **Calories**: "464 Calories" (large, prominent)
  - **Macronutrients Section**: Color-coded macro breakdown (partially visible)
  - **Lock Icon**: Indicates premium/paid features
- **Action Button**: "Post" button at bottom
- **Design**: Card slides up from bottom over food image

#### Workout Logging Flow

##### 1. Workout Type Selection
- **Header**: "Log Workout" with X close button
- **Dropdown Menu**: 
  - Running (selected)
  - Swimming
  - Squatting  
  - Push-ups
  - Pull-ups

##### 2. Workout Details Form
- **Duration Input**: 
  - Text field: "45 minutes"
  - Unit selector: "min" (selected) / "hours" toggle
- **Calories Display**: "367 cals" (calculated automatically)
- **Photo Option**: "📷 Add Photo" button
- **Notes Field**: Large text area with "Notes..." placeholder
- **Actions**: "Cancel" and "Save" buttons at bottom

### 👥 Community/Social Feed

#### Header
- **Title**: "Community"
- **Menu**: Hamburger menu icon (top right)

#### Post Types

##### Workout Posts
- **User Info**: Avatar, username, timestamp, badges ("Workout")
- **Content**: "Morning HIIT Session"
- **Engagement**: Heart (12), comment (2) icons
- **Comments Preview**: 
  - "🏃 Lump: Lets workout together next time!"
  - "😊 Corvidae: Need to try this"
  - "View all 2 comments" link

##### Food Posts
- **User Info**: Avatar, username, timestamp, badge ("Meal")
- **Food Image**: High-quality photo (e.g., "Burrito Bowl")
- **Engagement**: Standard like/comment interface

#### Visual Design
- Instagram-style vertical feed
- Card-based posts with clear separation
- User avatars and engagement metrics
- Badge system for post types

### 🏠 Pet Room (Waddle Game Page)

#### Header
- **Room Title**: "Erin's Room"
- **Top Navigation**: 
  - 🛍️ Shop
  - 🎒 Items  
  - 👔 Pet (customization)

#### Room Environment
- **Two-Level Display**: 
  - **Top Shelf**: Penguin with headphones, lamp, plant, decorative items
  - **Bottom Shelf**: Two penguins (lump, globby), books, plant, furniture
- **Style**: Cozy, library-like environment with wooden shelving
- **Penguins**: Multiple penguin characters in different poses/outfits

#### Friends Section
- **Title**: "Friends"
- **Friend List**:
  - globby (penguin avatar) - "visit" button
  - lump (penguin avatar) - "visit" button
- **Social Feature**: Visit friends' rooms

#### Customization System
- Shop for items and decorations
- Inventory management (Items tab)
- Pet customization (Pet tab)
- Room layout and furniture placement

### ⚙️ Settings Page

#### Profile Information
- **Birthday**: "birthday - lmfao/05/2025"
- **Email**: "Email ✏️ waddle@example.com"
- **Password**: "Password 👁️ ••••••••••••"

#### App Settings
- **Units**: "Metric" with toggle switch (enabled)
- **Notifications**: Toggle switch (enabled)

#### Actions
- **Cancel** and **Save** buttons at bottom
- Edit icons (✏️) for editable fields
- Show/hide toggle (👁️) for password

#### Visual Design
- Clean, minimal settings interface
- Toggle switches for boolean options
- Editable field indicators
- Standard form layout

---

## 🔧 Technical Implementation

### State Management
- **Recommended**: Provider/Riverpod or Bloc pattern for Flutter
- **Local Storage**: SharedPreferences for user preferences, Hive for complex data
- **Database**: Firebase Firestore for cloud data, local caching for offline support

### API Integration
- **Authentication**: Firebase Auth with email/password and OAuth
- **Food Recognition**: 
  - Google ML Kit for on-device food recognition
  - CalorieMama API or Spoonacular for detailed nutrition data
  - Image processing for nutrition analysis
- **Backend**: Firebase Firestore for real-time data
- **Real-time Features**: Firebase Firestore streams for social feed
- **Image Storage**: Firebase Storage with compression

### Component Libraries
- **Navigation**: Flutter Navigation 2.0 with GoRouter
- **Charts**: fl_chart for data visualization
- **Calendar**: Custom calendar implementation with table_calendar
- **Camera**: camera package with image_picker
- **Icons**: Flutter Material Icons and custom SVG icons

### Key Components to Build
1. **CircularProgress**: Reusable component for calorie tracking
2. **MissionCard**: Goal tracking with checkboxes and progress
3. **FoodScanner**: Camera interface with ML integration
4. **WeightChart**: Line graph component for weight trends
5. **MacronutrientPills**: Color-coded macro display
6. **CalendarDayIndicator**: Custom calendar day component
7. **SocialPost**: Feed item component with engagement
8. **PetRoom**: Interactive room environment
9. **WorkoutForm**: Dynamic form with exercise selection

---

## 🗄️ Database Schema (Firebase Firestore)

### Collections Structure

#### 1. Users Collection
```javascript
users/{userId}
{
  // Profile Information
  username: string,
  email: string,
  displayName: string,
  avatarUrl: string,
  birthday: timestamp,
  gender: string,
  
  // Health Goals
  currentWeight: number,
  goalWeight: number,
  height: number,
  activityLevel: string, // sedentary, lightly_active, moderately_active, very_active
  units: string, // metric, imperial
  
  // App Settings
  notifications: {
    dailyReminders: boolean,
    weeklyReports: boolean,
    socialInteractions: boolean
  },
  
  // Gamification
  streakCount: number,
  totalXP: number,
  level: number,
  coins: number,
  
  // Social
  friends: [userId],
  followers: [userId],
  following: [userId],
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp,
  lastActiveAt: timestamp
}
```

#### 2. Daily Logs Collection
```javascript
dailyLogs/{userId}/{date}
{
  // Basic Info
  userId: string,
  date: string, // YYYY-MM-DD format
  
  // Nutrition
  caloriesConsumed: number,
  caloriesGoal: number,
  macronutrients: {
    carbohydrates: number, // grams
    protein: number, // grams
    fats: number, // grams
    fiber: number // grams
  },
  
  // Activity
  caloriesBurned: number,
  steps: number,
  distance: number, // km
  activeMinutes: number,
  
  // Weight
  weight: number,
  
  // Goals
  goalsCompleted: [goalId],
  goalsTotal: number,
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 3. Meals Collection
```javascript
meals/{mealId}
{
  // Basic Info
  userId: string,
  date: string,
  mealType: string, // breakfast, lunch, dinner, snack
  
  // Food Details
  name: string,
  calories: number,
  macronutrients: {
    carbohydrates: number,
    protein: number,
    fats: number,
    fiber: number
  },
  
  // Image
  imageUrl: string,
  imageAnalysis: {
    confidence: number,
    detectedFoods: [string],
    mlModel: string
  },
  
  // User Input
  notes: string,
  isCustom: boolean,
  
  // Social
  isPublic: boolean,
  likes: [userId],
  comments: [commentId],
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 4. Workouts Collection
```javascript
workouts/{workoutId}
{
  // Basic Info
  userId: string,
  date: string,
  workoutType: string, // running, swimming, strength, etc.
  
  // Workout Details
  duration: number, // minutes
  caloriesBurned: number,
  distance: number, // km
  intensity: string, // low, medium, high
  
  // Custom Fields
  exercises: [{
    name: string,
    sets: number,
    reps: number,
    weight: number,
    duration: number
  }],
  
  // Image
  imageUrl: string,
  notes: string,
  
  // Social
  isPublic: boolean,
  likes: [userId],
  comments: [commentId],
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 5. Goals Collection
```javascript
goals/{goalId}
{
  // Basic Info
  userId: string,
  title: string,
  description: string,
  category: string, // health, diet, fitness, custom
  
  // Goal Details
  targetValue: number,
  currentValue: number,
  unit: string, // kg, km, minutes, etc.
  frequency: string, // daily, weekly, monthly
  
  // Status
  isCompleted: boolean,
  isActive: boolean,
  completedAt: timestamp,
  
  // Dates
  startDate: timestamp,
  targetDate: timestamp,
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 6. Social Posts Collection
```javascript
posts/{postId}
{
  // Basic Info
  userId: string,
  postType: string, // meal, workout, achievement, general
  
  // Content
  text: string,
  imageUrl: string,
  
  // Related Data
  mealId: string, // if postType is meal
  workoutId: string, // if postType is workout
  goalId: string, // if postType is achievement
  
  // Engagement
  likes: [userId],
  comments: [commentId],
  shares: number,
  
  // Privacy
  isPublic: boolean,
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 7. Comments Collection
```javascript
comments/{commentId}
{
  // Basic Info
  userId: string,
  postId: string, // or mealId, workoutId
  parentCommentId: string, // for nested comments
  
  // Content
  text: string,
  
  // Engagement
  likes: [userId],
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 8. Pet System Collections

##### Pet Profiles
```javascript
pets/{petId}
{
  // Basic Info
  userId: string,
  name: string,
  type: string, // penguin
  level: number,
  
  // Customization
  appearance: {
    outfit: string,
    accessories: [string],
    color: string
  },
  
  // Stats
  happiness: number,
  energy: number,
  health: number,
  
  // Timestamps
  createdAt: timestamp,
  lastFedAt: timestamp,
  lastPlayedAt: timestamp
}
```

##### Pet Items (Inventory)
```javascript
petItems/{userId}
{
  // User's Inventory
  userId: string,
  items: [{
    itemId: string,
    name: string,
    type: string, // outfit, accessory, furniture, decoration
    rarity: string, // common, rare, epic, legendary
    quantity: number,
    isEquipped: boolean,
    equippedOnPetId: string
  }]
}
```

##### Pet Rooms
```javascript
petRooms/{roomId}
{
  // Basic Info
  userId: string,
  roomName: string,
  
  // Layout
  furniture: [{
    itemId: string,
    position: {
      x: number,
      y: number,
      z: number
    },
    rotation: number
  }],
  
  // Decorations
  decorations: [{
    itemId: string,
    position: {
      x: number,
      y: number,
      z: number
    }
  }],
  
  // Timestamps
  createdAt: timestamp,
  updatedAt: timestamp
}
```

#### 9. Analytics Collection
```javascript
analytics/{userId}/{period}
{
  // Basic Info
  userId: string,
  period: string, // daily, weekly, monthly, yearly
  startDate: string,
  endDate: string,
  
  // Health Metrics
  averageWeight: number,
  weightChange: number,
  averageCaloriesConsumed: number,
  averageCaloriesBurned: number,
  totalSteps: number,
  totalDistance: number,
  
  // Goal Progress
  goalsCompleted: number,
  goalsTotal: number,
  completionRate: number,
  
  // Social Activity
  postsCreated: number,
  likesReceived: number,
  commentsReceived: number,
  
  // Gamification
  streakDays: number,
  xpEarned: number,
  levelUps: number,
  
  // Timestamps
  createdAt: timestamp
}
```

### Database Rules (Firestore Security Rules)
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can read/write their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Daily logs - users can only access their own
    match /dailyLogs/{userId}/{date} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Meals - users can read/write their own, read public ones
    match /meals/{mealId} {
      allow read: if request.auth != null && 
        (resource.data.userId == request.auth.uid || resource.data.isPublic == true);
      allow write: if request.auth != null && request.auth.uid == resource.data.userId;
    }
    
    // Workouts - similar to meals
    match /workouts/{workoutId} {
      allow read: if request.auth != null && 
        (resource.data.userId == request.auth.uid || resource.data.isPublic == true);
      allow write: if request.auth != null && request.auth.uid == resource.data.userId;
    }
    
    // Goals - users can only access their own
    match /goals/{goalId} {
      allow read, write: if request.auth != null && 
        request.auth.uid == resource.data.userId;
    }
    
    // Posts - users can read public posts, write their own
    match /posts/{postId} {
      allow read: if request.auth != null && 
        (resource.data.userId == request.auth.uid || resource.data.isPublic == true);
      allow write: if request.auth != null && request.auth.uid == resource.data.userId;
    }
  }
}
```

---

## 📁 Optimal Flutter Project Structure

```
waddle_app/
├── android/                    # Android-specific files
├── ios/                       # iOS-specific files
├── lib/                       # Main Dart source code
│   ├── main.dart             # App entry point
│   │
│   ├── app/                  # App-level configuration
│   │   ├── app.dart          # Main app widget
│   │   ├── routes.dart       # Route definitions
│   │   └── theme.dart        # App theme configuration
│   │
│   ├── core/                 # Core utilities and constants
│   │   ├── constants/        # App constants
│   │   │   ├── app_constants.dart
│   │   │   ├── colors.dart
│   │   │   ├── strings.dart
│   │   │   └── dimensions.dart
│   │   ├── utils/           # Utility functions
│   │   │   ├── date_utils.dart
│   │   │   ├── validation_utils.dart
│   │   │   ├── image_utils.dart
│   │   │   └── formatters.dart
│   │   ├── errors/          # Error handling
│   │   │   ├── exceptions.dart
│   │   │   └── failures.dart
│   │   └── network/         # Network utilities
│   │       ├── network_info.dart
│   │       └── api_client.dart
│   │
│   ├── data/                # Data layer
│   │   ├── models/          # Data models
│   │   │   ├── user_model.dart
│   │   │   ├── meal_model.dart
│   │   │   ├── workout_model.dart
│   │   │   ├── goal_model.dart
│   │   │   ├── post_model.dart
│   │   │   ├── pet_model.dart
│   │   │   └── daily_log_model.dart
│   │   ├── repositories/    # Repository implementations
│   │   │   ├── user_repository_impl.dart
│   │   │   ├── meal_repository_impl.dart
│   │   │   ├── workout_repository_impl.dart
│   │   │   ├── goal_repository_impl.dart
│   │   │   └── pet_repository_impl.dart
│   │   ├── datasources/     # Data sources
│   │   │   ├── remote/      # Remote data sources
│   │   │   │   ├── firebase_auth_remote_data_source.dart
│   │   │   │   ├── firestore_remote_data_source.dart
│   │   │   │   ├── storage_remote_data_source.dart
│   │   │   │   └── ml_kit_remote_data_source.dart
│   │   │   └── local/       # Local data sources
│   │   │       ├── shared_preferences_local_data_source.dart
│   │   │       └── hive_local_data_source.dart
│   │   └── mappers/         # Data mappers
│   │       ├── user_mapper.dart
│   │       ├── meal_mapper.dart
│   │       └── workout_mapper.dart
│   │
│   ├── domain/              # Domain layer (business logic)
│   │   ├── entities/        # Business entities
│   │   │   ├── user.dart
│   │   │   ├── meal.dart
│   │   │   ├── workout.dart
│   │   │   ├── goal.dart
│   │   │   ├── post.dart
│   │   │   └── pet.dart
│   │   ├── repositories/    # Repository interfaces
│   │   │   ├── user_repository.dart
│   │   │   ├── meal_repository.dart
│   │   │   ├── workout_repository.dart
│   │   │   ├── goal_repository.dart
│   │   │   └── pet_repository.dart
│   │   └── usecases/        # Business use cases
│   │       ├── user/        # User-related use cases
│   │       │   ├── get_user_profile.dart
│   │       │   ├── update_user_profile.dart
│   │       │   └── update_user_settings.dart
│   │       ├── meal/        # Meal-related use cases
│   │       │   ├── log_meal.dart
│   │       │   ├── get_meals_for_date.dart
│   │       │   └── analyze_food_image.dart
│   │       ├── workout/     # Workout-related use cases
│   │       │   ├── log_workout.dart
│   │       │   ├── get_workouts_for_date.dart
│   │       │   └── calculate_calories_burned.dart
│   │       ├── goal/        # Goal-related use cases
│   │       │   ├── create_goal.dart
│   │       │   ├── complete_goal.dart
│   │       │   └── get_user_goals.dart
│   │       └── pet/         # Pet-related use cases
│   │           ├── feed_pet.dart
│   │           ├── play_with_pet.dart
│   │           └── customize_pet.dart
│   │
│   ├── presentation/        # Presentation layer (UI)
│   │   ├── pages/          # Main app pages
│   │   │   ├── dashboard/  # Dashboard page
│   │   │   │   ├── dashboard_page.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── calorie_progress_widget.dart
│   │   │   │   │   ├── missions_card_widget.dart
│   │   │   │   │   ├── activity_summary_widget.dart
│   │   │   │   │   ├── weight_chart_widget.dart
│   │   │   │   │   └── macronutrients_widget.dart
│   │   │   │   └── controllers/
│   │   │   │       └── dashboard_controller.dart
│   │   │   ├── calendar/   # Calendar page
│   │   │   │   ├── calendar_page.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── calendar_grid_widget.dart
│   │   │   │   │   └── day_indicator_widget.dart
│   │   │   │   └── controllers/
│   │   │   │       └── calendar_controller.dart
│   │   │   ├── social/     # Social feed page
│   │   │   │   ├── social_page.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── post_card_widget.dart
│   │   │   │   │   ├── comment_widget.dart
│   │   │   │   │   └── user_avatar_widget.dart
│   │   │   │   └── controllers/
│   │   │   │       └── social_controller.dart
│   │   │   ├── pet_room/   # Pet room page
│   │   │   │   ├── pet_room_page.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── pet_widget.dart
│   │   │   │   │   ├── room_widget.dart
│   │   │   │   │   └── inventory_widget.dart
│   │   │   │   └── controllers/
│   │   │   │       └── pet_room_controller.dart
│   │   │   └── settings/   # Settings page
│   │   │       ├── settings_page.dart
│   │   │       ├── widgets/
│   │   │       │   ├── settings_tile_widget.dart
│   │   │       │   └── profile_form_widget.dart
│   │   │       └── controllers/
│   │   │           └── settings_controller.dart
│   │   │
│   │   ├── widgets/        # Shared/reusable widgets
│   │   │   ├── common/     # Common UI components
│   │   │   │   ├── custom_button.dart
│   │   │   │   ├── custom_text_field.dart
│   │   │   │   ├── loading_widget.dart
│   │   │   │   ├── error_widget.dart
│   │   │   │   └── empty_state_widget.dart
│   │   │   ├── charts/     # Chart components
│   │   │   │   ├── circular_progress_chart.dart
│   │   │   │   ├── line_chart_widget.dart
│   │   │   │   └── bar_chart_widget.dart
│   │   │   └── forms/      # Form components
│   │   │       ├── meal_log_form.dart
│   │   │       ├── workout_log_form.dart
│   │   │       └── goal_form.dart
│   │   │
│   │   ├── modals/         # Modal dialogs
│   │   │   ├── logging_modal.dart
│   │   │   ├── missions_modal.dart
│   │   │   ├── food_scanner_modal.dart
│   │   │   └── workout_form_modal.dart
│   │   │
│   │   └── navigation/     # Navigation components
│   │       ├── bottom_navigation.dart
│   │       ├── app_bar_widget.dart
│   │       └── navigation_service.dart
│   │
│   ├── services/           # Service layer
│   │   ├── auth_service.dart
│   │   ├── storage_service.dart
│   │   ├── analytics_service.dart
│   │   ├── notification_service.dart
│   │   └── ml_service.dart
│   │
│   └── state/              # State management
│       ├── providers/      # Provider classes
│       │   ├── auth_provider.dart
│       │   ├── user_provider.dart
│       │   ├── meal_provider.dart
│       │   ├── workout_provider.dart
│       │   ├── goal_provider.dart
│       │   └── pet_provider.dart
│       ├── notifiers/      # State notifiers
│       │   ├── auth_notifier.dart
│       │   ├── user_notifier.dart
│       │   └── theme_notifier.dart
│       └── state.dart      # Global state configuration
│
├── assets/                 # Static assets
│   ├── images/            # Image assets
│   │   ├── icons/         # App icons
│   │   ├── backgrounds/   # Background images
│   │   ├── pets/          # Pet images
│   │   └── ui/            # UI element images
│   ├── fonts/             # Custom fonts
│   └── animations/        # Lottie animations
│
├── test/                  # Test files
│   ├── unit/             # Unit tests
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── widget/            # Widget tests
│   └── integration/       # Integration tests
│
├── pubspec.yaml           # Dependencies and assets
├── analysis_options.yaml  # Dart analyzer options
├── README.md             # Project documentation
└── .gitignore           # Git ignore rules
```

### Key Dependencies (pubspec.yaml)
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  provider: ^6.0.5
  riverpod: ^2.4.9
  
  # Firebase
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
  firebase_storage: ^11.5.6
  
  # Local Storage
  shared_preferences: ^2.2.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # UI Components
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
  
  # Charts
  fl_chart: ^0.65.0
  
  # Camera & Image Processing
  camera: ^0.10.5+5
  image_picker: ^1.0.4
  google_ml_kit: ^0.16.3
  
  # Date & Time
  intl: ^0.18.1
  
  # HTTP & API
  dio: ^5.3.2
  
  # Utilities
  uuid: ^4.2.1
  permission_handler: ^11.1.0
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1
  mockito: ^5.4.4
  build_runner: ^2.4.7
```

---

## 🎮 Gamification Elements

### Pet System
- **Character**: Penguin-based virtual pet
- **Customization**: Outfits, accessories (headphones, clothing)
- **Environment**: Customizable room with furniture and decorations
- **Multiple Pets**: Support for multiple penguin friends

### Progress Tracking
- **Streaks**: Fire emoji with day counter
- **Missions**: Daily/weekly goal completion
- **Visual Feedback**: Progress bars, circles, and completion indicators
- **Social Elements**: Friend visits, shared achievements

### Reward System
- **Coins/XP**: Earned through goal completion
- **Shop Items**: Furniture, decorations, pet accessories
- **Achievements**: Milestone celebrations and social posts

---

## 📊 Data Models

### User Profile
```json
{
  "userId": "string",
  "username": "string", 
  "email": "string",
  "birthday": "date",
  "currentWeight": "number",
  "goalWeight": "number",
  "units": "metric|imperial",
  "streakCount": "number",
  "totalXP": "number"
}
```

### Daily Log
```json
{
  "date": "date",
  "caloriesConsumed": "number",
  "caloriesBurned": "number",
  "steps": "number",
  "workouts": ["workout"],
  "meals": ["meal"],
  "goalsCompleted": ["goal"],
  "weight": "number?"
}
```

### Mission/Goal
```json
{
  "goalId": "string",
  "title": "string",
  "category": "health|diet|fitness|custom",
  "completed": "boolean",
  "createdDate": "date",
  "targetDate": "date?"
}
```

---

## 🚀 Development Roadmap

### Phase 1: Core Foundation (Weeks 1-4)
- [ ] Set up Flutter project with Firebase integration
- [ ] Implement basic UI components and design system
- [ ] Create user authentication system with Firebase Auth
- [ ] Build dashboard with static data and state management

### Phase 2: Data & Logging (Weeks 5-8)
- [ ] Implement local data storage (SharedPreferences, Hive)
- [ ] Build food logging with camera integration and ML Kit
- [ ] Create workout logging system with Firestore
- [ ] Develop calendar view with activity tracking

### Phase 3: Social & Gamification (Weeks 9-12)
- [ ] Build social feed and user interactions
- [ ] Implement pet room and customization
- [ ] Add missions/goals system
- [ ] Create reward and streak mechanics

### Phase 4: Polish & Launch (Weeks 13-16)
- [ ] ML Kit integration for food recognition
- [ ] Performance optimization and caching
- [ ] Testing and bug fixes
- [ ] App store preparation and deployment

---

## 🔮 Future Enhancement Considerations

### Advanced Features
- **AI Coaching**: Personalized workout and nutrition suggestions
- **Challenges**: Group challenges and competitions
- **Weather Integration**: Pet room ambiance based on real weather
- **Wearable Sync**: Apple Health, Fitbit, Garmin integration
- **Premium Features**: Advanced analytics, unlimited goals

### Technical Improvements
- **Offline Mode**: Full app functionality without internet
- **Push Notifications**: Smart reminders and social interactions
- **Performance**: Image optimization, lazy loading, caching
- **Accessibility**: Screen reader support, keyboard navigation
- **Internationalization**: Multi-language support

---

## 📱 Platform Considerations

### iOS Specific
- **Health Kit Integration**: Automatic step/workout sync
- **App Store Guidelines**: Ensure compliance for health apps
- **Push Notifications**: APNs integration

### Android Specific
- **Google Fit Integration**: Health data synchronization
- **Play Store Policies**: Health and fitness app requirements
- **Firebase Cloud Messaging**: Push notification system

### Cross-Platform
- **Responsive Design**: Support various screen sizes
- **Performance**: Optimize for older devices
- **Testing**: Comprehensive testing on both platforms

---

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Google ML Kit](https://developers.google.com/ml-kit)
- [Flutter Provider](https://pub.dev/packages/provider)
- [Flutter Riverpod](https://riverpod.dev/)

---

*This comprehensive guide provides everything needed to implement the Waddle app, from detailed UI specifications to technical architecture and development phases. Use this as your primary reference document throughout development.*
