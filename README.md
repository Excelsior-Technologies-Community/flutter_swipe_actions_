<div align="center">

# Flutter Swipe Actions

<p>
  A lightweight Flutter package that adds clean and modern swipe actions
  such as <strong>Edit</strong>, <strong>Archive</strong>, and <strong>Delete</strong>
  to list items.
</p>

</div>

---

## ✨ Demo

<div align="center">

<img
src="example/assets/swipe_actions.gif"
alt="Flutter Swipe Actions Demo"
width="200"
/>

<br><br>

<strong>Swipe right for Edit & Archive • Swipe left for Delete</strong>

</div>

---

## 🚀 Features

* ✅ Swipe right for **Edit**
* ✅ Swipe right for **Archive**
* ✅ Swipe left for **Delete**
* ✅ Reusable `SwipeActionItem` widget
* ✅ Custom `SwipeItemModel`
* ✅ Edit callback support
* ✅ Delete callback support
* ✅ Archive callback support
* ✅ Category-based colors
* ✅ Category-based icons
* ✅ Modern card-based UI
* ✅ Material 3 friendly design
* ✅ Responsive list item layout
* ✅ Lightweight and easy to integrate
* ✅ Works with `ListView`
* ✅ Clean package structure
* ✅ Null-safe Dart code
* ✅ Simple callback-based API

---

## 📦 Installation

Add the package to your Flutter project's `pubspec.yaml`:

```yaml
dependencies:
  flutter_swipe_actions:
```

Then run:

```bash
flutter pub get
```

> If the package is published on pub.dev, use the version displayed on the package's pub.dev page.

---

## 🔧 Import

```dart
import 'package:flutter_swipe_actions/flutter_swipe_actions.dart';
```

---

# 🧩 Basic Usage

Create a `SwipeItemModel`:

```dart
const item = SwipeItemModel(
  id: '1',
  title: 'Complete Flutter Package',
  subtitle: 'Finish package development',
  category: 'Work',
  time: '10:30 AM',
);
```

Use it with `SwipeActionItem`:

```dart
SwipeActionItem(
  item: item,
  onEdit: () {
    print('Edit');
  },
  onArchive: () {
    print('Archive');
  },
  onDelete: () {
    print('Delete');
  },
)
```

---

# 📱 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_swipe_actions/flutter_swipe_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swipe Actions Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SwipeItemModel> items = [
    const SwipeItemModel(
      id: '1',
      title: 'Complete Flutter Package',
      subtitle: 'Finish package development',
      category: 'Work',
      time: '10:30 AM',
    ),
    const SwipeItemModel(
      id: '2',
      title: 'Buy Groceries',
      subtitle: 'Milk, vegetables and fruits',
      category: 'Shopping',
      time: '12:00 PM',
    ),
    const SwipeItemModel(
      id: '3',
      title: 'Call Family',
      subtitle: 'Weekend family call',
      category: 'Personal',
      time: '06:30 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return SwipeActionItem(
            item: item,
            onEdit: () {
              print('Edit ${item.title}');
            },
            onArchive: () {
              print('Archive ${item.title}');
            },
            onDelete: () {
              print('Delete ${item.title}');
            },
          );
        },
      ),
    );
  }
}
```

---

# 👆 Swipe Actions

The package provides three main actions.

### Swipe Right

```text
┌───────────────────────────────────────┐
│  Edit  │  Archive  │     Task Item    │
└───────────────────────────────────────┘
```

Available actions:

* ✏️ Edit
* 📦 Archive

### Swipe Left

```text
┌───────────────────────────────────────┐
│     Task Item     │      Delete       │
└───────────────────────────────────────┘
```

Available action:

* 🗑️ Delete

---

# 🎯 SwipeItemModel

`SwipeItemModel` represents the data displayed by the swipe item.

```dart
const SwipeItemModel(
  id: '1',
  title: 'Complete Flutter Package',
  subtitle: 'Finish package development',
  category: 'Work',
  time: '10:30 AM',
);
```

## Properties

| Property     | Type     | Required | Description                |
| ------------ | -------- | -------: | -------------------------- |
| `id`         | `String` |      Yes | Unique item identifier     |
| `title`      | `String` |      Yes | Main item title            |
| `subtitle`   | `String` |      Yes | Secondary item information |
| `category`   | `String` |      Yes | Item category              |
| `time`       | `String` |      Yes | Display time               |
| `isArchived` | `bool`   |       No | Archive state              |

---

# 🔄 copyWith

The model provides a simple `copyWith` method for updating item values.

```dart
final updatedItem = item.copyWith(
  title: 'Updated Task',
  isArchived: true,
);
```

---

# 🎨 Supported Categories

The package automatically provides colors and icons for common categories.

| Category  | Icon         |
| --------- | ------------ |
| Work      | 💼 Work      |
| Personal  | 👤 Person    |
| Shopping  | 🛍️ Shopping |
| Important | ⚠️ Priority  |
| Other     | 📝 Notes     |

Category matching is case-insensitive.

For example:

```dart
category: 'Work'
```

and:

```dart
category: 'work'
```

use the same category styling.

---

# 🔌 Callbacks

`SwipeActionItem` provides callbacks for each action.

## Edit

```dart
onEdit: () {
  print('Edit clicked');
},
```

## Archive

```dart
onArchive: () {
  print('Archive clicked');
},
```

## Delete

```dart
onDelete: () {
  print('Delete clicked');
},
```

All callbacks are optional.

---

# 🧱 Widget API

```dart
SwipeActionItem({
  super.key,
  required SwipeItemModel item,
  VoidCallback? onEdit,
  VoidCallback? onDelete,
  VoidCallback? onArchive,
})
```

### Parameters

| Parameter   | Type             | Required | Description                    |
| ----------- | ---------------- | -------: | ------------------------------ |
| `item`      | `SwipeItemModel` |      Yes | Item data                      |
| `onEdit`    | `VoidCallback?`  |       No | Called when Edit is pressed    |
| `onArchive` | `VoidCallback?`  |       No | Called when Archive is pressed |
| `onDelete`  | `VoidCallback?`  |       No | Called when Delete is pressed  |

---

# 📋 ListView Integration

The widget can easily be used inside a `ListView.builder`.

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return SwipeActionItem(
      item: items[index],
      onEdit: () {
        // Edit item
      },
      onArchive: () {
        // Archive item
      },
      onDelete: () {
        // Delete item
      },
    );
  },
)
```

---

# 🗂️ Project Structure

```text
flutter_swipe_actions/
│
├── assets/
│   └── demo.gif
│
├── example/
│   ├── lib/
│   │   └── main.dart
│   ├── pubspec.yaml
│   └── ...
│
├── lib/
│   ├── flutter_swipe_actions.dart
│   │
│   └── src/
│       ├── models/
│       │   └── swipe_item_model.dart
│       │
│       ├── utils/
│       │   └── swipe_actions_util.dart
│       │
│       └── widgets/
│           └── swipe_action_item.dart
│
├── test/
│   ├── swipe_item_model_test.dart
│   └── swipe_action_item_test.dart
│
├── analysis_options.yaml
├── CHANGELOG.md
├── LICENSE
├── pubspec.yaml
└── README.md
```

---

# 🧪 Testing

Run package tests:

```bash
flutter test
```

The package includes tests for:

* `SwipeItemModel`
* `copyWith`
* `SwipeActionItem`
* Item information rendering

---

# 🔍 Static Analysis

Run Flutter analyzer:

```bash
flutter analyze
```

A clean analyzer result should show:

```text
No issues found!
```

---

# ▶️ Run Example

Navigate to the example application:

```bash
cd example
```

Install dependencies:

```bash
flutter pub get
```

Run the example:

```bash
flutter run
```

For Chrome:

```bash
flutter run -d chrome
```

---

# 📌 Package Design

The package is designed around a simple structure:

```text
Model
  ↓
SwipeActionItem
  ↓
Callbacks
  ↓
Application Logic
```

The package handles the swipe UI while the application controls what happens when an action is triggered.

---

# 💡 Example Use Cases

`flutter_swipe_actions` can be used for:

* 📝 Task management applications
* 📧 Email lists
* 💬 Chat applications
* 🛒 Shopping lists
* 📦 Inventory applications
* 📋 Todo applications
* 👥 Contact lists
* 📅 Reminder applications
* 🗂️ Document lists
* 🔔 Notification lists

---

# ⚙️ Requirements

* Flutter `3.41.9` or newer
* Dart `3.11.5` or newer
* Flutter Material support

---

# 📄 License

This project is licensed under the MIT License.
 
 Copyright (c) 2026 Excelsior Technologies
 
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 

---

# 👨‍💻 Author

<div align="center">

### Sufiyan Shaikh

Flutter Developer

<p>
  <a href="https://github.com/shaikhsufiyan0143">
    GitHub
  </a>
 
</p>

</div>

---

<div align="center">

### ⭐ If you find this package useful, consider giving it a star on GitHub.

<strong>Built with Flutter ❤️</strong>

</div>
