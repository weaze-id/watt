import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../theme/palette.dart';
import '../button/big_button.dart';

class FileInput extends StatelessWidget {
  const FileInput({
    Key? key,
    this.label,
    required this.values,
    required this.onChanged,
    this.fileType = FileType.any,
    this.allowedExtensions,
    this.allowMultiple = false,
  }) : super(key: key);

  final String? label;
  final List<PlatformFile> values;
  final void Function(List<PlatformFile> value) onChanged;
  final FileType fileType;
  final List<String>? allowedExtensions;
  final bool allowMultiple;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple,
    );

    if (result == null) {
      return;
    }

    final newValues = <PlatformFile>[];

    if (allowMultiple) {
      newValues.addAll(values);
      for (final value in newValues) {
        result.files.removeWhere((e) => e.path == value.path);
      }

      newValues.addAll(result.files);
    } else {
      newValues.add(result.files.first);
    }

    onChanged(newValues);
  }

  void _removeFile(PlatformFile file) {
    final newValues = [...values];
    newValues.removeWhere((e) => e.path == file.path);

    onChanged(newValues);
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (int i = 0; i < values.length; i++) {
      final value = values[i];
      children.add(_FileListTile(
        file: value,
        onRemoved: () => _removeFile(value),
      ));

      if (i == values.length - 1) {
        children.add(const SizedBox(height: 16));
      }
    }

    return Column(
      children: [
        ...children,
        BigButton(label: label ?? "Select file", onPressed: _pickFile),
      ],
    );
  }
}

class _FileListTile extends StatelessWidget {
  const _FileListTile({
    Key? key,
    required this.file,
    required this.onRemoved,
  }) : super(key: key);

  final PlatformFile file;
  final void Function() onRemoved;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);

    final extension = file.extension;
    final isImage = [
      "apng",
      "avif",
      "gif",
      "jpg",
      "jpeg",
      "jfif",
      "pjpeg",
      "pjp",
      "png",
      "webp"
    ].contains(extension);
    final isVideo = ["webm", "mkv", "mp4", "m4p", "m4v"].contains(extension);
    final isDocument = ["pdf", "doc", "docx", "odt"].contains(extension);

    return ListTile(
      leading: Icon(
        isImage
            ? Icons.image
            : isVideo
                ? Icons.movie
                : isDocument
                    ? Icons.description
                    : Icons.drafts,
        color: palette.primary,
      ),
      title: Text(
        file.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: onRemoved,
      ),
    );
  }
}
