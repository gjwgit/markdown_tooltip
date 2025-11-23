# A Markdown Tooltip Widget

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)

[![GitHub License](https://img.shields.io/github/license/gjwgit/markdown_tooltip)](https://raw.githubusercontent.com/gjwgit/markdown_tooltip/dev/LICENSE)
[![GitHub Version](https://img.shields.io/badge/dynamic/yaml?url=https://raw.githubusercontent.com/gjwgit/markdown_tooltip/master/pubspec.yaml&query=$.version&label=version&logo=github)](https://github.com/gjwgit/markdown_tooltip/blob/dev/CHANGELOG.md)
[![Pub Version](https://img.shields.io/pub/v/markdown_toolip?label=pub.dev&labelColor=333940&logo=flutter)](https://pub.dev/packages/markdown_tooltip)
[![GitHub Last Updated](https://img.shields.io/github/last-commit/gjwgit/markdown_tooltip?label=last%20updated)](https://github.com/gjwgit/markdown_tooltip/commits/dev/)
[![GitHub Commit Activity (dev)](https://img.shields.io/github/commit-activity/w/gjwgit/markdown_tooltip/dev)](https://github.com/gjwgit/markdown_tooltip/commits/dev/)
[![GitHub Issues](https://img.shields.io/github/issues/gjwgit/markdown_tooltip)](https://github.com/gjwgit/markdown_tooltip/issues)
[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-blue.svg)](https://flutter.dev/)
[![Pub Package](https://img.shields.io/pub/v/markdown_tooltip)](https://pub.dev/packages/markdown_tooltip)
[![GitHub Issues](https://img.shields.io/github/issues/gjwgit/markdown_tooltip)](https://github.com/gjwgit/markdown_tooltip/issues)
[![GitHub License](https://img.shields.io/github/license/gjwgit/markdown_tooltip)](https://raw.githubusercontent.com/gjwgit/markdown_tooltip/main/LICENSE)

A drop-in replacement for [Tooltip] supporting Markdown.

Published through the Flutter repository
[pub.dev](https://pub.dev/packages/markdown_tooltip).

## Features

Tooltips are essential for self documenting apps which guide the user
through the app, without having to refer to  user manuals (if they
exist). The default Flutter Tooltip is quite plain, though
effective. This package adds support for Markdown within the tooltip.
It also introduces a delay by default to avoid clutter in instantly
popping up tooltips.

## Getting started

Simply add the package to your app by running the command:

```bash
dart pub add markdown_tooltip
```

Your `pubspec.yaml` will be updated to look like:

```yaml
dependencies:
  ...
  markdown_tooltip: ^0.0.9
```

## Usage

The `MarkdownTooltip` widget is used to wrap another widget for which
you would like a more flexible tooltip. In the below example of an
`ElevatedButton` the `Icon` child is wrapped with a `MarkdownTooltip`.

```dart
...
ElevatedButton(
    onPressed: ...,
    child: const MarkdownTooltip(
        message: '''

        **Save** Tap here to save our future. Visit *the
        internet* for details.

        ''',
        child: Icon(Icons.save),
    ),
)
```

## Additional information

The tooltip has a delay by default to avoid cluttering our apps.

You can contribute to this package and report issues through the
[github](https://github.com/gjwgit/markdown_tooltip) repository.

Text selection and URL links are not yet supported. Contributions are
welcome.

## Sample screenshots

The [example](example/lib/main.dart) app  provides a very simple
illustration of some possible markdown markup. To reproduce, simply
copy the example files then run `flutter create .` followed by
`flutter run`.

![Screenshot of the App](assets/images/screenshot_example_app.png)

The [Rattle](https://github.com/gjwgit/rattleng) app, with its
front-end written in Flutter, utilises `MarkdownTooltip`s.  In this
simple example notice the use of bold to highlight the file types that
are permitted to be loaded into Rattle. Markdown will make bold any
text between `**` and `**`.

![Example from Rattle](assets/images/screenshot_rattle_datset_filename_tooltip.png)

Here [HealthPod](https://github.com/anusii/healthpod) demonstrates
support for dark mode within an app.

![Example from HealthPod](assets/images/screenshot_healthpod_dark_mode.png)
