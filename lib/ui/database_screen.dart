import 'package:flutter/cupertino.dart';
import 'package:flutter_and_native_ios_comparison/data/local/database.dart';
import 'package:moor_flutter/moor_flutter.dart' as db;

class DatabaseScreen extends StatefulWidget {
  final MyDatabase database;
  final int numberOfUsers;

  const DatabaseScreen(
      {Key? key, required this.database, required this.numberOfUsers})
      : super(key: key);

  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  String? _resultText;

  Future<void> _saveAndLoadUsers() async {
    final startTime = DateTime.now();

    // Save users
    for (int i = 0; i < widget.numberOfUsers; i++) {
      await widget.database.saveUser(UsersCompanion(
        id: const db.Value.absent(),
        name: db.Value('User $i'),
        age: db.Value(i % 100),
      ));
    }

    // Load users
    await widget.database.getAllUsers();

    final endTime = DateTime.now();
    final duration = endTime.difference(startTime);

    setState(() {
      _resultText =
          'Uspješno spremljeno i učitano ${widget.numberOfUsers} korisnika u vremenu: ${duration.inMilliseconds}ms';
    });
  }

  Future<void> _clearDatabase() async {
    await widget.database.clearDatabase();
    setState(() {
      _resultText = 'Baza podataka je očišćena!';
    });
  }

  Future<void> _showUserCount() async {
    int userCount = await widget.database.countUsers();
    setState(() {
      _resultText = 'Trenutni broj korisnika u bazi podataka: $userCount';
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('SQLite baza podataka'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_resultText != null)
                Text(
                  _resultText!,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: _saveAndLoadUsers,
                child: const Text('Spremi i učitaj korisnike'),
              ),
              const SizedBox(height: 10),
              CupertinoButton.filled(
                onPressed: _showUserCount,
                child: const Text('Prikaži broj korisnika'),
              ),
              const SizedBox(height: 10),
              CupertinoButton.filled(
                onPressed: _clearDatabase,
                child: const Text('Očisti bazu podataka'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
