const _subjectMap = {
  'math': 'Matemática',
  'portuguese': 'Português',
  'geography': 'Geografia',
  'all': 'Todas matérias',
};

extension SubjectIdToName on String {
  String trySubjectName() {
    assert(_subjectMap.keys.any((element) => this == element),
        'String inválida, nenhum curso encontrado');
    return _subjectMap[this]!;
  }
}
