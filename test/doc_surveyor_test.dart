import 'package:flutter_docs_analyzer/doc_surveyor.dart';
import 'package:test/test.dart';

import 'fixtures/fixtures.dart';

void main() {
  group('DocData', () {
    test('doc comment metrics', () {
      var docData = DocData('Flow', true, docCommentGood);
      expect(docData.hasYouTube, isFalse);
      expect(docData.hasDartPad, isTrue);
      expect(docData.referenceCount, equals(13));
      expect(docData.hasCodeSnippet, true);
    });
  });
}

