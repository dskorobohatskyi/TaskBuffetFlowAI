import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_service.dart';
import '../models/link_collection.dart';
import 'link_collection_editor_page.dart';
import 'link_collection_viewer_page.dart';

class LinkCollectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Link Collections')),
      body: Consumer<TaskService>(
        builder: (_, service, __) {
          final collections = service.allLinkCollections;
          if (collections.isEmpty) {
            return Center(child: Text('No collections yet'));
          }
          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: collections.length,
            separatorBuilder: (_, __) => SizedBox(height: 12),
            itemBuilder: (_, index) {
              final collection = collections[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(collection.title),
                  subtitle: Text('${collection.items.length} links'),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LinkCollectionViewerPage(
                                collectionId: collection.id,
                              ),
                              settings: RouteSettings(name: 'LinkCollectionViewerPage'),
                            ),
                          );
                        },
                        child: Text('Show'),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LinkCollectionEditorPage(collection: collection),
                              settings: RouteSettings(name: 'LinkCollectionEditorPage'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => LinkCollectionEditorPage(),
              settings: RouteSettings(name: 'LinkCollectionEditorPage'),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
