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
}
