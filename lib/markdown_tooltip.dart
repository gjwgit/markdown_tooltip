/// A tooltip supporting markdown and a delay to avoid clutter of tooltips.
//
// Time-stamp: <Tuesday 2024-11-05 09:09:00 +1100 Graham Williams>
//
/// Copyright (C) 2023-2024, Togaware Pty Ltd.
///
/// License: https://www.gnu.org/licenses/gpl-3.0.en.html
///
// Licensed under the GNU General Public License, Version 3 (the "License");
///
// This program is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program.  If not, see <https://www.gnu.org/licenses/>.
///
/// Authors: Graham Williams

library markdown_tooltip;

export 'src/widgets/markdown_tooltip.dart' show MarkdownTooltip;

export 'src/utils/word_wrap.dart' show wordWrap;
