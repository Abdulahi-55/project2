import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HabitData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habit Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HabitTracker(),
      ),
    );
  }
}

class HabitTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habit Tracker'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: HabitList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddHabitDialog();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HabitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitData>(
      builder: (context, habitData, child) {
        return ListView.builder(
          itemCount: habitData.habits.length,
          itemBuilder: (context, index) {
            final habit = habitData.habits[index];
            return HabitTile(habit: habit);
          },
        );
      },
    );
  }
}

class HabitTile extends StatelessWidget {
  final Habit habit;

  HabitTile({required this.habit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(habit.name),
      trailing: Checkbox(
        value: habit.isCompleted,
        onChanged: (newValue) {
          habit.toggleCompleted();
          Provider.of<HabitData>(context, listen: false).updateHabit(habit);
        },
      ),
    );
  }
}

class AddHabitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String habitName = '';

    return AlertDialog(
      title: Text('Add New Habit'),
      content: TextField(
        onChanged: (newText) {
          habitName = newText;
        },
        decoration: InputDecoration(hintText: 'Enter habit name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (habitName.isNotEmpty) {
              Provider.of<HabitData>(context, listen: false)
                  .addHabit(habitName);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class Habit {
  final String name;
  bool isCompleted;

  Habit({required this.name, this.isCompleted = false});

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isCompleted': isCompleted,
    };
  }

  static Habit fromMap(Map<String, dynamic> map) {
    return Habit(
      name: map['name'],
      isCompleted: map['isCompleted'],
    );
  }
}

class HabitData extends ChangeNotifier {
  List<Habit> habits = [];

  HabitData() {
    loadHabits();
  }

  void addHabit(String name) {
    final habit = Habit(name: name);
    habits.add(habit);
    saveHabits();
    notifyListeners();
  }

  void updateHabit(Habit habit) {
    saveHabits();
    notifyListeners();
  }

  void saveHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitList = habits.map((habit) => habit.toMap()).toList();
    prefs.setString('habits', json.encode(habitList));
  }

  void loadHabits() async {
    final prefs = await SharedPreferences.getInstance();
    final habitString = prefs.getString('habits');
    if (habitString != null) {
      final List<dynamic> habitList = json.decode(habitString);
      habits = habitList.map((habitMap) => Habit.fromMap(habitMap)).toList();
      notifyListeners();
    }
  }
}
