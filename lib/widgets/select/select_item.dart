class SelectItem<T> {
  final String title;
  final String? subtitle;
  final T value;

  SelectItem({
    required this.title,
    this.subtitle,
    required this.value,
  });

  SelectItem<T> copyWith({
    String? title,
    String? subtitle,
    T? value,
  }) {
    return SelectItem<T>(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      value: value ?? this.value,
    );
  }
}
