import 'package:flutter/material.dart';
import 'package:name_generator_app_flutter/main.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    final theme = Theme.of(context);

    if (favorites.isEmpty) {
      return Center(
        child: Text('You have no favorites yet.'),
      );
    }

    return Center(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have ${favorites.length} favorites:'),
          ),
          for (var pair in favorites)
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                color: theme.colorScheme.primary,
                onPressed: () => {appState.toggleFavorite(pair)},
              ),
              title: Text(pair.asLowerCase),
            ),
        ],
      ),
    );
  }
}
