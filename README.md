# FinWise 🏦

**FinWise** is a modern personal finance management application built with Flutter. It provides users with a seamless way to track income and expenses, visualize financial trends through interactive charts, and manage their personal profiles with real-time data synchronization.

---

## ✨ Key Features

- **User Authentication:** Secure sign-up and sign-in flows with real-time validation.
- **Transaction Management:** Effortlessly record income and expenses with category-specific tracking.
- **Advanced Analytics:** Dynamic data visualization using bar charts with Daily, Weekly, Monthly, and Yearly filters.
- **Categorization:** Organize spending with custom categories and view transaction history by category.
- **Profile Management:** Update personal information and manage account settings.
- **Infinite Scrolling:** Efficient data handling for large transaction histories using pagination (Lazy Loading).

---

## 🛠 Technical Stack

### **Architecture & State Management**
* **BLoC Pattern:** Utilizes `flutter_bloc` for a strict separation of concerns between UI, business logic, and data.
* **Layered Architecture:** Follows Clean Architecture principles (Presentation, Business, Data, and Core layers) for high maintainability and scalability.

### **Data Handling & Code Generation**
* **Freezed & Json Serializable:** Used for creating robust, immutable data models and automating JSON parsing logic.
* **Reactive UI:** Leverages `BlocBuilder`, `BlocListener`, and `IndexedStack` to preserve navigation state and provide a reactive user experience.

### **UI & Visualization**
* **fl_chart:** High-performance, customizable bar charts for financial data analysis.
* **Custom UI Components:** A library of reusable widgets (GreenContainer, HeaderWidget, BodyContainer) for a consistent design language.
* **Vector Graphics:** Scalable UI icons implemented via `flutter_svg`.

---

## 📁 Project Structure

```text
lib/
├── business/     # BLoCs, Events, and States
├── data/         # Models, Services (API/Local)
├── presentation/ # Screens and reusable Widgets
└── core/         # Constants, Theme, and Validators
```