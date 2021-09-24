import 'package:flutter/material.dart';
import 'package:nasapedia/Model/mission.dart';
import 'package:nasapedia/Widgets/listTitle.dart';
import 'package:nasapedia/constants.dart';

class MissionDetailPage extends StatelessWidget {
  final MissionModel mission;
  const MissionDetailPage(this.mission, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        _AppBar(mission: mission),
        _ListHeading("Description"),
        _Description(mission: mission),
        _ListHeading("Crew"),
        _CrewList(mission: mission)
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
      return ThemeListTitle(text);
    }, childCount: 1));
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    required this.mission,
  }) : super(key: key);

  final MissionModel mission;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            mission.description ?? "Error Fetching Description",
            style: Theme.of(context).textTheme.bodyText2?.copyWith(height: 1.6),
          ));
    }, childCount: 1));
  }
}

class _CrewList extends StatelessWidget {
  const _CrewList({
    Key? key,
    required this.mission,
  }) : super(key: key);

  final MissionModel mission;

  

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return ListTile(
          minVerticalPadding: 32,
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
                'assets/images/${(mission.crew)?[index]['name']}.jpg'),
          ),
          title: Text((mission.crew)?[index]['name'].toString() ??
              "Error Fetching Crew Member"));
    }, childCount: mission.crew?.length));
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.mission,
  }) : super(key: key);

  final MissionModel mission;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kColorAccent1,
      pinned: true,
      snap: true,
      floating: true,
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset(
                'assets/images/star_bg.jpg',
                fit: BoxFit.cover,
              )),
              Padding(
                padding: const EdgeInsets.all(64.0),
                child: Hero(
                    tag: "Icon${mission.id}",
                    child:
                        Image.asset('assets/images/apollo${mission.id}.png')),
              ),
            ],
          ),
        ),
        title: Text("Apollo ${mission.id}"),
      ),
    );
  }
}
