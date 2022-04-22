extension StringCapitalize on String {
  String capitalized() {
    final wordList = split(' ');
    final capitalizedList = [];
    for (final word in wordList) {
      final capitalizedWord = '${word[0].toUpperCase()}${word.substring(1)}';
      capitalizedList.add(capitalizedWord);
    }
    final capitalizedString = capitalizedList.join(" ");
    return capitalizedString;
  }

  String forShort() {
    final wordList = trim().split(' ');
    final shortenList = [];
    String firstLetter = '';
    String lastLetter = '';

    firstLetter = wordList.first.isNotEmpty ? wordList.first[0] : '';
    if (wordList.length > 1) {
      lastLetter = wordList.last.isNotEmpty ? wordList.last[0] : '';
    }

    shortenList.addAll([firstLetter, lastLetter]);

    return shortenList.join("").toUpperCase();
  }
}
