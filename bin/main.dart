//  Copyright 2019 Google LLC
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import 'package:flutter_docs_analyzer/doc_surveyor.dart';

/// Prints a CSV file containing docstring stats:
///
/// - Name
/// - Is Widget
/// - Has Code Snippet
/// - Has DartPad
/// - Has YouTube
/// - Reference Count
/// - Link Count
/// - Line Count
/// - Word Count
/// - Char Count
///
/// Example:
///
/// $ dart lib/main.dart <path-to-provider-repo>/packages/provider
///
/// To analyze the Flutter SDK, use the version of dart provided in `bin/dart`:
///
/// $ /path/to/flutter/bin/dart bin/main.dart /path/to/flutter/packages/flutter
void main(List<String> args) async {
  var stats = await analyzeDocs(args[0]);

  var sorted = List<DocData>.from(stats.docData)
    ..sort((a, b) {
      return a.lineCount.compareTo(b.lineCount);
    });
  print([
    'Name',
    'Is Widget',
    'Has Code',
    'Has Snippet Sample',
    'Has Application Sample',
    'Has DartPad Sample',
    'Has YouTube',
    'Reference Count',
    'Link Count',
    'Prose Line Count',
    'Code Line Count',
    'Word Count',
    'Char Count'
  ].join(','));
  for (var item in sorted) {
    print([
      item.elementName,
      item.isWidget,
      item.hasCodeSnippet,
      item.hasSnippetSample,
      item.hasApplicationSample,
      item.hasDartPadSample,
      item.hasYouTube,
      item.referenceCount,
      item.linkCount,
      item.lineCount,
      item.codeLineCount,
      item.wordCount,
      item.charCount
    ].join(','));
  }
}
