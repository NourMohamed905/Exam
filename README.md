
# Exam App
<p align="start">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean%20Architecture-00599C?style=for-the-badge)
![BLoC](https://img.shields.io/badge/BLoC-0175C2?style=for-the-badge)
![Dio](https://img.shields.io/badge/Dio-EA4335?style=for-the-badge)
![Retrofit](https://img.shields.io/badge/Retrofit-4CAF50?style=for-the-badge)
![Hive CE](https://img.shields.io/badge/Hive%20CE-F9A825?style=for-the-badge)
![GetIt](https://img.shields.io/badge/GetIt-7B1FA2?style=for-the-badge)
![Injectable](https://img.shields.io/badge/Injectable-009688?style=for-the-badge)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Android Studio](https://img.shields.io/badge/Android%20Studio-3DDC84?style=for-the-badge&logo=androidstudio&logoColor=white)

</p>


<p align="center">
  <img src="screenshots/cover.png" alt="Exam App Cover" width="1000"/>
</p>

## Overview

**Exam App** is a Flutter application built with a clean, feature-first architecture. It lets users sign in, browse exam subjects, view exam details, take timed tests, review their scores, and manage their profile and password from one place.

The app uses:

- **Flutter / Dart** for the UI
- **Bloc / Cubit** for state management
- **GetIt + Injectable** for dependency injection
- **Dio + Retrofit** for networking
- **Hive CE** for local exam-history storage
- **Flutter Secure Storage** for authentication tokens
- **Reusable custom widgets** for a consistent UI

---

## Features

- Authentication flow: login, register, forgot password, verification, and reset password
- Explore page with searchable subject cards
- Subject exam details screen with instructions and exam metadata
- Timed exam experience with multiple-choice questions
- Live countdown timer during exams
- Score screen with performance summary
- Saved results screen with grouped exam history
- Detailed exam review screen
- Track performance for each subject
- Profile screen with editable personal data
- Change password flow
- Secure token persistence
- Responsive UI across different screen sizes
- Error page for invalid or missing routes

---

## Screenshots

### Authentication

<p align="center">
  <img src="screenshots/login.png" width="240"/>
  <img src="screenshots/create_account.png" width="240"/>
</p>

### Home

<p align="center">
  <img src="screenshots/home.png" width="240"/>
  <img src="screenshots/home2.png" width="240"/>
</p>

### Exam

<p align="center">
  <img src="screenshots/exam.png" width="240"/>
  <img src="screenshots/question.png" width="240"/>
  <img src="screenshots/questionrev.png" width="240"/>
</p>

### Exam Details

<p align="center">
  <img src="screenshots/examdetails.png" width="240"/>
</p>

### Scores

<p align="center">
  <img src="screenshots/examscore.png" width="240"/>
  <img src="screenshots/examscore2.png" width="240"/>
</p>

### Results

<p align="center">
  <img src="screenshots/resulttap.png" width="240"/>
</p>

### Profile

<p align="center">
  <img src="screenshots/profile.png" width="240"/>
</p>

---

## Project Structure

```text
lib/
├── config/
│   ├── base_response/
│   ├── di/
│   └── dio/
│
├── core/
│   ├── constant/
│   ├── presentation/
│   │   └── error_page/
│   ├── storage/
│   ├── theme_manager.dart
│   └── utils/
│       ├── router/
│       └── widgets/
│
└── feature/
    ├── auth/
    │   ├── login/
    │   ├── register/
    │   └── forget_password/
    │
    ├── exam/
    │   ├── api/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    ├── exam_subject/
    │   ├── api/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    ├── explore/
    │   ├── api/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    ├── profile/
    │   ├── api/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    ├── profile_change_password/
    │   ├── api/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    └── results/
        ├── api/
        ├── data/
        ├── domain/
        └── presentation/
```

### Architecture Notes

- Each feature is organized into **API**, **Data**, **Domain**, and **Presentation** layers.
- Shared application logic, utilities, and reusable components are located inside the **core/** directory.
- Dependency injection is configured in **config/di/** using **GetIt** and **Injectable**.
- Networking is centralized using **Dio** and **Retrofit**.
- Navigation is managed through **core/utils/router/**.
- Local persistence is handled using **Hive CE**.
- State management is implemented using **Bloc / Cubit**.

---

## Main App Flow

1. The app initializes **Hive CE** storage and dependency injection.
2. It checks whether a saved authentication token exists in secure storage.
3. If a token is found, the user is redirected to the **Explore** screen.
4. Otherwise, the application navigates to the **Login** screen.
5. From **Explore**, users can browse subjects, start exams, and review their results.

---

## Key Packages

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [get_it](https://pub.dev/packages/get_it)
- [injectable](https://pub.dev/packages/injectable)
- [dio](https://pub.dev/packages/dio)
- [retrofit](https://pub.dev/packages/retrofit)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage)
- [hive_ce](https://pub.dev/packages/hive_ce)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [fl_chart](https://pub.dev/packages/fl_chart)
- [intl](https://pub.dev/packages/intl)
- [equatable](https://pub.dev/packages/equatable)

  ---

## Getting Started

Clone the repository

```bash
git https://github.com/NourMohamed905/Exam.git
```

Install dependencies

```bash
flutter pub get
```

Run the application

```bash
flutter run
```
## Generate Code

If you modify files that use **Injectable**, **Retrofit**, or **json_serializable**, regenerate the generated files by running:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
---

# 👥 Team

<table align="center">
<tr>

<td align="center" width="50%">

<img src="https://github.com/omarameen77.png" width="140" alt="Omar Ameen"/>

### Omar Ameen

**Flutter Developer**

<p>
<a href="https://www.linkedin.com/in/omar-amin-083645344">
<img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
</a>
</p>

<p>
<a href="https://github.com/omarameen77">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
</a>
</p>

📧 <a href="mailto:omar3meen11@gmail.com">omar3meen11@gmail.com</a>

📱 +201031430691

</td>

<td align="center" width="50%">

<img src="https://github.com/YassmenaAbdullah.png" width="140" alt="Yasmeen Abdallah"/>

### Yasmeen Abdallah

**Flutter Developer**

<p>
<a href="https://www.linkedin.com/in/yasmena-abdallah">
<img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
</a>
</p>

<p>
<a href="https://github.com/YassmenaAbdullah">
<img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
</a>
</p>

<a href="mailto:yassmenabdallah76@gmail.com">yassmenabdallah76@gmail.com</a>

📱 +20155188312

</td>

</tr>
</table>

---
