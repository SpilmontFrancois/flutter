import 'package:flutter/material.dart';

class Artwork extends StatefulWidget {
  const Artwork({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Museum", style: TextStyle(fontFamily: "Merriweather")),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              const Image(image: AssetImage("images/Mona_Lisa.jpg")),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Icon(Icons.favorite,
                    size: 100.0,
                    color: _isFavorite
                        ? Colors.red
                        : Colors.white.withOpacity(0.75),
                    semanticLabel: "Favorite"),
              ),
              if (_showDescription)
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.white.withOpacity(0.5),
                    child: const SingleChildScrollView(
                      child: Text(
                        "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                        style: TextStyle(
                            fontFamily: "Merriweather",
                            fontSize: 15.0,
                            color: Colors.brown),
                      ),
                    ),
                  ),
                )
            ],
          ),
          const Text("Mona Lisa",
              style: TextStyle(
                  fontFamily: "Merriweather",
                  fontSize: 30.0,
                  color: Colors.brown)),
          const Text("Léonard De Vinci",
              style: TextStyle(
                  fontFamily: "Merriweather",
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                icon: const Icon(Icons.article),
                color: Colors.brown,
                onPressed: () {
                  setState(() {
                    _showDescription = !_showDescription;
                  });
                }),
            IconButton(
                icon: const Icon(Icons.favorite),
                color: _isFavorite ? Colors.red : Colors.brown,
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                    if (_isFavorite) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Oeuvre ajoutée à vos favoris")));
                    }
                  });
                }),
          ])
        ],
      ),
    );
  }
}
