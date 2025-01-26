import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../watt.dart';

class FileInput extends StatelessWidget {
  const FileInput({
    Key? key,
    this.label,
    this.emptyMessage,
    this.fileType = FileType.any,
    this.allowedExtensions,
    required this.values,
    required this.onChanged,
    this.allowMultiple = false,
  }) : super(key: key);

  final String? label;
  final String? emptyMessage;
  final FileType fileType;
  final List<String>? allowedExtensions;
  final List<PlatformFile> values;
  final void Function(List<PlatformFile> value) onChanged;
  final bool allowMultiple;

  Future<void> _pickFile(BuildContext context) async {
    DialogUtil.showLoadingDialog(context);

    final result = await FilePicker.platform.pickFiles(
      type: fileType,
      allowedExtensions: allowedExtensions,
      allowMultiple: allowMultiple,
    );

    if (result == null) {
      Navigator.of(context).pop();
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
    Navigator.of(context).pop();
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (children.isEmpty) ...[
          Text(emptyMessage ?? "No file selected"),
          const SizedBox(height: 16)
        ],
        ...children,
        BigButton(
          label: label ?? "Select file",
          onPressed: () => _pickFile(context),
        ),
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
    final isDocument = ["pdf", "doc", "docx", "odt", "txt"].contains(extension);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: palette.gray.withValues(alpha: .25),
        backgroundImage: isImage ? FileImage(File(file.path!)) : null,
        child: !isImage
            ? Icon(
                isVideo
                    ? Icons.movie
                    : isDocument
                        ? Icons.description
                        : Icons.attachment,
                color: palette.primary,
              )
            : null,
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
