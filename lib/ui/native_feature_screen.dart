import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class NativeFeaturesScreen extends StatefulWidget {
  const NativeFeaturesScreen({Key? key}) : super(key: key);

  @override
  _NativeFeaturesScreenState createState() => _NativeFeaturesScreenState();
}

class _NativeFeaturesScreenState extends State<NativeFeaturesScreen> {
  final ImagePicker _picker = ImagePicker();
  final Stopwatch _stopwatch = Stopwatch();

  void _onFeatureButtonPressed(BuildContext context, String featureName) async {
    print('Feature button pressed: $featureName');

    if (featureName == 'GPS') {
      _stopwatch.reset();
      _stopwatch.start();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);

      _stopwatch.stop();
      print('Trenutna lokacija: $position');
      print(
          'Vrijeme za dohvaćanje položaja: ${_stopwatch.elapsedMicroseconds} µs');
    } else if (featureName == 'Kamera') {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        print('Uspješno snimljena fotografija: ${pickedFile.path}');
      } else {
        print('Nije snimljena fotografija');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Rad s nativnim značajkama'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoButton(
                onPressed: () => _onFeatureButtonPressed(context, 'GPS'),
                color: CupertinoColors.activeBlue,
                child: const Text('Pokreni GPS'),
              ),
              const SizedBox(height: 16.0),
              CupertinoButton(
                onPressed: () => _onFeatureButtonPressed(context, 'Kamera'),
                color: CupertinoColors.activeBlue,
                child: const Text('Pokreni kameru'),
              ),
              // Dodajte još tipki za druge nativne značajke ovdje
            ],
          ),
        ),
      ),
    );
  }
}
