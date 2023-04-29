import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class NativeFeaturesScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  NativeFeaturesScreen({super.key});

  void _onFeatureButtonPressed(BuildContext context, String featureName) async {
    print('Feature button pressed: $featureName');

    if (featureName == 'GPS') {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('Trenutna lokacija: $position');
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
