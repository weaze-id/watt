class SelectItem<T> {
  final String title;
  final String? subtitle;

  SelectItem({
    required this.title,
    this.subtitle,
  });

  SelectItem<T> copyWith({
    String? title,
    String? subtitle,
  }) {
    return SelectItem<T>(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }
}
