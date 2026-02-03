class LinkItem {
  final String id;
  final String title;
  final String url;
  final bool hasDone;

  LinkItem({
    required this.id,
    required this.title,
    required this.url,
    this.hasDone = false,
  });

  LinkItem copyWith({
    String? id,
    String? title,
    String? url,
    bool? hasDone,
  }) {
    return LinkItem(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      hasDone: hasDone ?? this.hasDone,
    );
  }
}

class LinkCollection {
  final String id;
  final String title;
  final List<LinkItem> items;

  LinkCollection({
    required this.id,
    required this.title,
    required this.items,
  });
}
