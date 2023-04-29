import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MainScreenItem extends StatefulWidget {
  const MainScreenItem({
    required this.title,
    required this.onStart,
    this.showIntensitySlider = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function(int) onStart;
  final bool showIntensitySlider;

  @override
  _MainScreenItemState createState() => _MainScreenItemState();
}

class _MainScreenItemState extends State<MainScreenItem> {
  double _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.systemGroupedBackground,
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            widget.title,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          const SizedBox(height: 8.0),
          widget.showIntensitySlider
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Intenzitet'),
                    CupertinoSlider(
                      value: _sliderValue,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      onChanged: (double value) {
                        HapticFeedback.lightImpact();
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    Text(_sliderValue.toInt().toString()),
                  ],
                )
              : Container(),
          const SizedBox(height: 8.0),
          CupertinoButton.filled(
            onPressed: () {
              widget.onStart(_sliderValue.toInt());
            },
            child: const Text('Pokreni'),
          ),
        ],
      ),
    );
  }
}

    // Skalabilnost korisničkog sučelja:
    //     Zaslon s velikim brojem elemenata korisničkog sučelja, kao što su gumbi, tekstualna polja, liste i slike.
    //     Ovaj zaslon može se koristiti za mjerenje opterećenja CPU-a, zauzeća radne memorije i vremena potrebnog za pokretanje korisničkog sučelja.

    // Skrolanje dugih lista:
    //     Zaslon s dugom listom elemenata (npr., 1000+ stavki) koji se moraju prikazati i ažurirati tijekom pomicanja.
    //     Ovaj zaslon može se koristiti za mjerenje performansi skrolanja, slika po sekundi (FPS) i opterećenja CPU-a.

    // Pristup lokalnoj bazi podataka:
    //     Zaslon koji čita i piše podatke u lokalnu bazu podataka (npr. SQLite).
    //     Ovaj zaslon može se koristiti za mjerenje vremena potrebnog za pristup bazi podataka, zauzeće radne memorije i opterećenje CPU-a.

    // Pristup internetu:
    //     Zaslon koji dohvaća podatke s web servisa (npr. REST API) i prikazuje ih u korisničkom sučelju.
    //     Ovaj zaslon može se koristiti za mjerenje vremena potrebnog za pristup internetu, zauzeće radne memorije i opterećenje CPU-a.

    // Rad s nativnim značajkama:
    //     Zaslon koji koristi nativne značajke poput GPS-a, kamere, mikrofona, senzora pokreta itd.
    //     Ovaj zaslon može se koristiti za mjerenje vremena pokretanja nativnih značajki, opterećenja CPU-a i potrošnje baterije.

    // Multitasking i rad u pozadini:
    //     Zaslon koji pokreće zadatke u pozadini, kao što su preuzimanje datoteka, reprodukcija glazbe ili izvođenje dugotrajnih operacija.
    //     Ovaj zaslon može se koristiti za mjerenje performansi rada u pozadini, potrošnje baterije i opterećenja CPU-a.

    // Optimizacija baterije:
    //     Zaslon s različitim scenarijima rada, kao što su reprodukcija videozapisa, dugotrajno izvođenje zadataka ili korištenje senzora.
    //     Ovaj zaslon može se koristiti za mjerenje potrošnje baterije i optimizacije baterije.    Skalabilnost korisničkog sučelja:
    //     Zaslon s velikim brojem elemenata korisničkog sučelja, kao što su gumbi, tekstualna polja, liste i slike.
    //     Ovaj zaslon može se koristiti za mjerenje opterećenja CPU-a, zauzeća radne memorije i vremena potrebnog za pokretanje korisničkog sučelja.

    // Skrolanje dugih lista:
    //     Zaslon s dugom listom elemenata (npr., 1000+ stavki) koji se moraju prikazati i ažurirati tijekom pomicanja.
    //     Ovaj zaslon može se koristiti za mjerenje performansi skrolanja, slika po sekundi (FPS) i opterećenja CPU-a.

    // Pristup lokalnoj bazi podataka:
    //     Zaslon koji čita i piše podatke u lokalnu bazu podataka (npr. SQLite).
    //     Ovaj zaslon može se koristiti za mjerenje vremena potrebnog za pristup bazi podataka, zauzeće radne memorije i opterećenje CPU-a.

    // Pristup internetu:
    //     Zaslon koji dohvaća podatke s web servisa (npr. REST API) i prikazuje ih u korisničkom sučelju.
    //     Ovaj zaslon može se koristiti za mjerenje vremena potrebnog za pristup internetu, zauzeće radne memorije i opterećenje CPU-a.

    // Rad s nativnim značajkama:
    //     Zaslon koji koristi nativne značajke poput GPS-a, kamere, mikrofona, senzora pokreta itd.
    //     Ovaj zaslon može se koristiti za mjerenje vremena pokretanja nativnih značajki, opterećenja CPU-a i potrošnje baterije.

    // Multitasking i rad u pozadini:
    //     Zaslon koji pokreće zadatke u pozadini, kao što su preuzimanje datoteka, reprodukcija glazbe ili izvođenje dugotrajnih operacija.
    //     Ovaj zaslon može se koristiti za mjerenje performansi rada u pozadini, potrošnje baterije i opterećenja CPU-a.

    // Optimizacija baterije:
    //     Zaslon s različitim scenarijima rada, kao što su reprodukcija videozapisa, dugotrajno izvođenje zadataka ili korištenje senzora.
    //     Ovaj zaslon može se koristiti za mjerenje potrošnje baterije i optimizacije baterije.