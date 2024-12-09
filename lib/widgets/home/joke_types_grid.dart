import 'package:flutter/material.dart';
import 'package:lab_2/widgets/home/joke_type_card.dart';


class JokeTypesGrid extends StatefulWidget {
  final List<String> jokeTypes;

  const JokeTypesGrid({super.key, required this.jokeTypes});

  @override
  State<JokeTypesGrid> createState() => _JokeTypesGridState();
}

class _JokeTypesGridState extends State<JokeTypesGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
          shrinkWrap: true,
          children:
              widget.jokeTypes.map((type) => JokeTypeCard(type: type)).toList(),
        ));
  }
}
