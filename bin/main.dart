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

/// Example run:
///
/// $ dart lib/main.dart <path-to-provider-repo>/packages/provider
/// 122 public members
/// Members without docs:
/// Void • <path-to-provider-repo>/packages/provider/lib/src/proxy_provider.dart • 107:1
/// NumericProxyProvider • <path-to-provider-repo>/packages/provider/lib/src/proxy_provider.dart • 177:1
/// Score: 0.98
///
void main(List<String> args) async {
  var stats = await analyzeDocs(args[0]);
  // print('${stats.publicMemberCount} public members');
  // print('Members without docs:');
  var locations = stats.undocumentedMemberLocations;
  // for (var location in locations) {
  // print(location.asString());
  // }

  var score =
      ((stats.publicMemberCount - locations.length) / stats.publicMemberCount)
          .toStringAsFixed(2);
  // print('Score: $score');

  var sorted = List<DocData>.from(stats.docData)
    ..sort((a, b) {
      return a.lineCount.compareTo(b.lineCount);
    });
  print([
    'Name',
    'Is Widget',
    'Has Code Snippet',
    'Has DartPad',
    'Has YouTube',
    'Line Count',
    'Word Count',
    'Char Count'
  ].join(','));
  for (var item in sorted) {
    print([
      item.elementName,
      item.isWidget,
      item.hasCodeSnippet,
      item.hasDartPad,
      item.hasYouTube,
      item.lineCount,
      item.wordCount,
      item.charCount
    ].join(','));
  }
}
