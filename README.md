# 🛒 SupaFlow Grocery Flutter
**A high-performance, full-stack grocery e-commerce solution built with Flutter and Supabase.**

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

---

## 🌟 Overview
**SupaFlow Grocery** is a modern mobile application designed to provide a seamless shopping experience. It leverages the power of **Supabase** for robust backend services (Authentication & Database) and integrates the **Open Food Facts API** to provide users with a massive catalog of over 1000+ real-world products.

The project follows a clean architecture with the **Provider** pattern to ensure scalability, maintainability, and high performance.



## ✨ Key Features
* 🔐 **Advanced Auth System**: Secure Sign-up and Login using Supabase Auth.
* 📦 **Dynamic Product Catalog**: Real-time data fetching from Open Food Facts API.
* 🔍 **Smart Search & Filter**: Instant product search with optimized performance.
* 🛒 **Complete Cart Logic**: Add, remove, and manage items with real-time total price calculation.
* 👤 **User Profiles**: Persistent user data including names, phones, and addresses stored in Supabase profiles.
* 🎨 **Modern Green UI**: A clean, eco-friendly Material 3 design optimized for grocery shopping.
* 🚀 **State Management**: Efficient data flow using the Provider package.

## 🛠️ Tech Stack
* **Framework**: Flutter (Dart)
* **Backend**: Supabase (Auth, PostgreSQL)
* **API Client**: Dio (for REST API integration)
* **State Management**: Provider
* **Data Source**: Open Food Facts API

## 🏗️ Project Architecture
The project is organized into a clean directory structure for better developer experience:
```text
lib/
├── models/          # Data schemas (Product)
├── providers/       # State Management (Auth, Cart, Products)
├── screens/         # Feature-based UI Screens
├── services/        # Logic for API calls & Supabase interactions
└── widgets/         # Reusable UI components (ProductItem, BottomNav)
