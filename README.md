# Exam App

<p align="center">
  <img src="screenshots/cover.png" alt="Exam App Cover" width="900"/>
</p>

A Flutter-based mobile application that enables users to practice exams across different subjects, track their performance, and review previous attempts through a clean and interactive user experience.

## Features

- Secure Authentication
  - Login
  - Register
  - Forgot Password

- Explore exams from multiple subjects.

- Take timed multiple-choice exams.

- Review your answers after finishing each exam.

- View detailed exam results, including:
  - Score
  - Percentage
  - Pass/Fail status
  - Number of correct answers

- Track your performance in every subject separately.

- View previous exam attempts and their results.

- User profile management.

- Responsive and modern UI.

- Clean Architecture with feature-based structure.

- State Management using BLoC (Cubit).

- REST API integration using Dio & Retrofit.

---

## Tech Stack

- Flutter
- Dart
- BLoC (Cubit)
- Dio
- Retrofit
- Injectable
- GetIt
- Flutter Secure Storage

---

## Project Structure

```text
lib
├── config
├── core
├── feature
│   ├── auth
│   ├── exam
│   ├── explore
│   ├── profile
│   ├── results
│   └── ...
└── main.dart
```

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

---

## Architecture

This project follows **Clean Architecture** with feature-based modularization.

```
Presentation
      ↓
   Domain
      ↓
     Data
      ↓
      API
```