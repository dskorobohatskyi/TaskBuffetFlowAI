import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/task.dart';
import '../services/task_service.dart';
import 'completion_page.dart';

class LinkSelectionPage extends StatelessWidget {
  final Task task;

  LinkSelectionPage({required this.task});

  String _faviconUrl(String url) {
    final uri = Uri.tryParse(url);
    final host = uri?.host ?? '';
    if (host.isEmpty) return '';
    return 'https://www.google.com/s2/favicons?sz=64&domain=$host';
  }

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

  void _toggleLink(BuildContext context, String collectionId, String linkId, bool wasDone) {
    final service = Provider.of<TaskService>(context, listen: false);
    service.toggleLinkDone(collectionId, linkId);
    if (!wasDone) {
      service.applyProgress(task, 1, recordSession: true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => CompletionPage(task: task, sessionValue: 1),
          settings: RouteSettings(name: 'CompletionPage'),
        ),
      );
    } else {
      service.updateProgress(task, -1);
      service.decrementSession(task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose link')),
      body: Consumer<TaskService>(
        builder: (_, service, __) {
          final collectionId = task.linkCollectionId;
          final collection =
              collectionId == null ? null : service.getLinkCollectionById(collectionId);
          if (collection == null) {
            return Center(child: Text('No links available'));
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
                  leading: _faviconUrl(item.url).isEmpty
                      ? CircleAvatar(child: Icon(Icons.link))
                      : CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: NetworkImage(_faviconUrl(item.url)),
                        ),
                  title: Text(item.title),
                  subtitle: Text(item.url),
                  trailing: Wrap(
                    spacing: 8,
                    children: [
                      TextButton(
                        onPressed: () => _openLink(context, item.url),
                        child: Text('Open'),
                      ),
                      ElevatedButton(
                        onPressed: () => _toggleLink(
                          context,
                          collection.id,
                          item.id,
                          item.hasDone,
                        ),
                        child: Text(item.hasDone ? 'Mark as Todo' : 'Mark as Done'),
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
