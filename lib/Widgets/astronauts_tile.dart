import 'package:flutter/material.dart';
import 'package:nasapedia/Model/astronaut.dart';
import 'package:nasapedia/Screens/astronaut_detail.dart';

var sampleastronaut = AstronautModel(
    id: "white",
    name: "Edward H. White II",
    description:
        "Edward Higgins White II (November 14, 1930 – January 27, 1967) (Lt Col, USAF) was an American aeronautical engineer, U.S. Air Force officer, test pilot, and NASA astronaut. On June 3, 1965, he became the first American to walk in space. White died along with astronauts Virgil \"Gus\" Grissom and Roger B. Chaffee during prelaunch testing for the first crewed Apollo mission at Cape Canaveral.\n\nHe was awarded the NASA Distinguished Service Medal for his flight in Gemini 4 and was then awarded the Congressional Space Medal of Honor posthumously.");

class AstronautsListTile extends StatelessWidget {
  final AstronautModel astronaut;
  final bool clipCircle;
  AstronautsListTile(this.astronaut, {Key? key, this.clipCircle = true});
  @override
  Widget build(BuildContext context) {
    String imageLink = "assets/images/${astronaut.id}.jpg";
    String astronautName = "Apollo ${astronaut.name}";
    double imageSize = 50;
    return ListTile(
      title: Text(astronautName),
      leading: Container(
        decoration: clipCircle ? BoxDecoration(shape: BoxShape.circle) : null,
        clipBehavior: clipCircle ? Clip.antiAlias : Clip.none,
        width: imageSize,
        height: imageSize,
        child: Hero(
            tag: "Icon",
            child: Image.asset(
              imageLink,
              fit: BoxFit.cover,
            )),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AstronautDetailPage(astronaut),
        ),
      ),
    );
  }
}
