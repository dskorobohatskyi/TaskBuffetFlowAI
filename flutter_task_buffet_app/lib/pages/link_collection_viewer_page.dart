import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/task_service.dart';

class LinkCollectionViewerPage extends StatelessWidget {
  final String collectionId;

  LinkCollectionViewerPage({required this.collectionId});

  Future<void> _openLink(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid link')),
      );
      return;
    }
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Links')),
      body: Consumer<TaskService>(
        builder: (_, service, __) {
          final collection = service.getLinkCollectionById(collectionId);
          if (collection == null) {
            return Center(child: Text('Collection not found'));
          }
          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: collection.items.length,
            separatorBuilder: (_, __) => SizedBox(height: 12),
            itemBuilder: (_, index) {
              final item = collection.items[index];
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.url),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      TextButton(
                        onPressed: () => _openLink(context, item.url),
                        child: Text('Open'),
                      ),
                      Icon(
                        item.hasDone ? Icons.check_circle : Icons.radio_button_unchecked,
                        color: item.hasDone ? Colors.green : Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
