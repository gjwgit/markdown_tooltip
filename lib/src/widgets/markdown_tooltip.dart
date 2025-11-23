/// A tooltip supporting markdown with a popup delay to avoid clutter of tooltips.
///
// Time-stamp: <Sunday 2025-11-23 20:58:19 +1100 Graham Williams>
///
/// Copyright (c) 2023-2024, Togaware Pty Ltd.
///
/// Licensed under the MIT License;
///
/// License: https://opensource.org/license/MIT
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the “Software”), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
///
/// Authors: Graham Williams

library;

import 'package:flutter/material.dart';

import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:markdown_tooltip/markdown_tooltip.dart';

/// A [Tooltip] supporting
/// [markdown](https://www.markdownguide.org/basic-syntax/) with a default
/// delay before being displayed.
///
/// ```dart
/// ElevatedButton(
///    onPressed: ...,
///    child: const MarkdownTooltip(
///        message: '''
///
///        **Save** Tap here to save our future. Visit [the
///          internet](https://example.net) for details.
///
///        ''',
///        child: Icon(Icons.save),
///    ),
///```
///
/// The default [Tooltip.waitDuration] fi=or the [Tooltip] widget is 0ms and so
/// the tooltip is displayed immediately. In my view this can clutter the
/// app. The default for [MarkdownTooltip] is 1s.

class MarkdownTooltip extends StatelessWidget {
  /// The [MarkdownTooltip] builds a constant [Widget].

  const MarkdownTooltip({
    required this.child,
    required this.message,
    super.key,
    this.wait = const Duration(seconds: 1),
    this.backgroundColor,
    this.textColor,
  });

  /// A widget to be wrapped with this tooltip.

  final Widget child;

  /// A message to be displayed, utilising markdown.

  final String message;

  /// How long to delay before displaying this tooltip.

  final Duration wait;

  /// Optional background color for the tooltip. If not provided, uses theme colors.

  final Color? backgroundColor;

  /// Optional text color for the tooltip. If not provided, uses theme colors.

  final Color? textColor;

  /// Test if the [message] contains a url.

  bool includesLink(String msg) {
    // The regex matches markdown links in the format [text](url).

    final RegExp pat = RegExp(r'\[([^\]]*)\]\(([^)]+)\)');
    return pat.hasMatch(msg);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Use provided colors or fallback to theme colors.

    final bgColor = backgroundColor ??
        (isDark ? const Color(0xFF424242) : const Color(0xFFF5F5F5));

    final txtColor = textColor ?? (isDark ? Colors.white : Colors.black87);

    return Tooltip(
      enableTapToDismiss: !includesLink(message),
      richMessage: WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 350),
          child: MarkdownBody(
            // Use the text tidying aspects of [wordWrap] so we can present this
            // message using triple quotes and formated with space before and
            // after, which looks a lot nicer in the code. Set the width high to
            // avoid embedded '\n'.
            data: wordWrap(
              message.isEmpty ? 'Tooltip Coming Soon.' : message,
              width: 1000,
            ),
            onTapLink: (text, href, title) {
              final Uri url = Uri.parse(href ?? '');
              launchUrl(url);
            },
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                color: txtColor,
                fontSize: 14,
              ),
              strong: TextStyle(
                color: txtColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              a: TextStyle(
                color: theme.colorScheme.primary,
                decoration: TextDecoration.underline,
                fontSize: 14,
              ),
              listBullet: TextStyle(
                color: txtColor,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),

      // TODO 20240707 gjw THE exitDuration WORKS ON DESKTOP BUT NOT ANDROID?

      showDuration: const Duration(seconds: 5),
      waitDuration: wait,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // textStyle: const TextStyle(
      //   fontSize: 18,
      // ),
      child: child,
    );
  }
}
