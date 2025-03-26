/// Word wrap a string for displaying in a tooltip.
//
// Time-stamp: <Wednesday 2025-03-26 11:40:50 +1100 Graham Williams>
//
/// Copyright (C) 2024, Togaware Pty Ltd
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

/// Word wrap [text] so that no line is beyond [width] characters.
///
/// ```dart
/// wordWrap(text: ```
///
///    I often word wrap strings that are coded using triple quote. This way I
///    can paragraph wrap the source code string for a pleasing look and not
///    worry about how it will be treated when rendered by dart.
///
///    ```,
///    width = 100,
///)

String wordWrap(
  String text, {
  int width = 60,
}) {
  // Split into lines.

  List<String> lines = text.split('\n');

  // Trim white space.

  lines = lines.map((str) => str.trim()).toList();

  // Split into paragraphs since each paragraph is going to be word wrapped.

  List<String> para = [];
  String currentPara = '';

  for (String line in lines) {
    if (line.isEmpty) {
      if (currentPara.isNotEmpty) {
        para.add(currentPara.trim());
        currentPara = '';
      }
    } else {
      if (currentPara.isNotEmpty) {
        currentPara += ' ';
      }
      currentPara += line.trim();
    }
  }

  // Add the last paragraph if there's any left after the loop

  if (currentPara.isNotEmpty) {
    para.add(currentPara.trim());
  }

  final RegExp pattern = RegExp('.{1,${width.toString()}}(\\s+|\$)');

  //  para = para.map((str) => actualWordWrap(str, width)).toList();

  para = para
      .map(
        (str) =>
            str.replaceAllMapped(pattern, (match) => '${match.group(0)!}\n'),
      )
      .toList();

  // Combine the paragraphs into one string with empty lines between
  // them. 20240811 gjw added trim() to remove any white space at the end of the
  // string. Will this affect anythig else?

  text = para.join('\n\n').trim();

  // text = result
  //     .replaceAllMapped(pattern, (match) => '${match.group(0)!}\n')
  //     .trim();

  // text = text.replaceAll(RegExp(r'^ +'), '');

  return text;
}
