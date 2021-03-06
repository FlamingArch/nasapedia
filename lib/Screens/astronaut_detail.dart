import 'package:flutter/material.dart';
import 'package:nasapedia/Model/astronaut.dart';
import 'package:nasapedia/Widgets/listTitle.dart';
import 'package:nasapedia/constants.dart';

class AstronautDetailPage extends StatelessWidget {
  final AstronautModel astronaut;
  const AstronautDetailPage(this.astronaut, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        _AppBar(astronaut: astronaut),
        _ListHeading("Description"),
        _Description(astronaut: astronaut),
        // _CrewList(astronaut: astronaut)
      ]),
    );
  }
}

class _ListHeading extends StatelessWidget {
  final String text;
  const _ListHeading(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return ThemeListTitle("About");
    }, childCount: 1));
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.astronaut,
  }) : super(key: key);

  final AstronautModel astronaut;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            astronaut.description ?? "Error Fetching Description",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(height: 1.6),
          ));
    }, childCount: 1));
  }
}

// class _CrewList extends StatelessWidget {
//   const _CrewList({
//     Key? key,
//     required this.astronaut,
//   }) : super(key: key);

//   final AstronautModel astronaut;

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//         delegate: SliverChildBuilderDelegate((context, index) {
//       return Card(
//         child: ListTile(
//             minVerticalPadding: 32,
//             leading: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//               ),
//               clipBehavior: Clip.antiAlias,
//               child: Image.asset(
//                   'assets/images/${(astronaut.crew)?[index]['name']}.jpg'),
//             ),
//             title: Text((astronaut.crew)?[index]['name'].toString() ??
//                 "Error Fetching Crew Member")),
//       );
//     }, childCount: astronaut.crew?.length));
//   }
// }

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.astronaut,
  }) : super(key: key);

  final AstronautModel astronaut;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kColorAccent1,
      pinned: true,
      floating: true,
      expandedHeight: 280,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
            tag: "Icon${astronaut.id}",
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/${astronaut.id}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.4),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                )
              ],
            )),
        title: Text("${astronaut.name}"),
      ),
    );
  }
}
