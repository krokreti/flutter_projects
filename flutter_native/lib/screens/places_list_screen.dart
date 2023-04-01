import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import 'package:provider/provider.dart';
import './add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Got no places yet!'),
        ),
        builder: (context, greatPlaces, staticChild) =>
            greatPlaces.items.length <= 0
                ? staticChild
                : ListView.builder(
                    itemCount: greatPlaces.items.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                          backgroundImage:
                              FileImage(greatPlaces.items[index].image)),
                      title: Text(greatPlaces.items[index].title),
                      onTap: () {},
                    ),
                  ),
      ),
    );
  }
}
