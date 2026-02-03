import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/link_collection.dart';
import '../services/task_service.dart';

class LinkCollectionEditorPage extends StatefulWidget {
  final LinkCollection? collection;

  LinkCollectionEditorPage({this.collection});

  @override
  State<LinkCollectionEditorPage> createState() => _LinkCollectionEditorPageState();
}

class _LinkCollectionEditorPageState extends State<LinkCollectionEditorPage> {
  final _titleController = TextEditingController();
  final List<_LinkDraft> _links = [];

  @override
  void initState() {
    super.initState();
    final collection = widget.collection;
    if (collection != null) {
      _titleController.text = collection.title;
      _links.addAll(
        collection.items.map(
          (i) => _LinkDraft(
            id: i.id,
            title: i.title,
            url: i.url,
            hasDone: i.hasDone,
            isEditing: false,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (final link in _links) {
      link.titleController.dispose();
      link.urlController.dispose();
    }
    super.dispose();
  }

  void _addLink() {
    setState(() {
      _links.add(_LinkDraft(isEditing: true));
    });
  }

  void _removeLink(int index) {
    setState(() {
      final link = _links.removeAt(index);
      link.titleController.dispose();
      link.urlController.dispose();
    });
  }

  void _save() {
    final service = Provider.of<TaskService>(context, listen: false);
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final items = <LinkItem>[];
    for (final link in _links) {
      final t = link.titleController.text.trim();
      final u = link.urlController.text.trim();
      if (t.isEmpty || u.isEmpty) continue;
      items.add(
        LinkItem(
          id: link.id ?? service.generateId(),
          title: t,
          url: u,
          hasDone: link.hasDone,
        ),
      );
    }

    final id = widget.collection?.id ?? service.generateId();
    service.upsertLinkCollection(
      LinkCollection(id: id, title: title, items: items),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.collection != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Collection' : 'New Collection')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Collection title'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _links.length,
                itemBuilder: (_, index) {
                  final link = _links[index];
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(value: link.hasDone, onChanged: null),
                              Text('Done'),
                              Spacer(),
                              IconButton(
                                icon: Icon(link.isEditing ? Icons.check : Icons.edit),
                                onPressed: () {
                                  setState(() => link.isEditing = !link.isEditing);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () => _removeLink(index),
                              ),
                            ],
                          ),
                          TextField(
                            controller: link.titleController,
                            enabled: link.isEditing,
                            decoration: InputDecoration(labelText: 'Title'),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: link.urlController,
                            enabled: link.isEditing,
                            decoration: InputDecoration(labelText: 'URL'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                ElevatedButton(onPressed: _addLink, child: Text('Add link')),
                SizedBox(width: 12),
                ElevatedButton(onPressed: _save, child: Text('Save')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkDraft {
  final String? id;
  final TextEditingController titleController;
  final TextEditingController urlController;
  final bool hasDone;
  bool isEditing;

  _LinkDraft({
    this.id,
    String title = '',
    String url = '',
    this.hasDone = false,
    this.isEditing = true,
  })
      : titleController = TextEditingController(text: title),
        urlController = TextEditingController(text: url);
}
