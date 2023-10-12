enum UnidadeAgua {
  mL("mL"),
  litro('L');

  final String unidade;
  const UnidadeAgua(this.unidade);
}

extension ConvertAgua on String {
  UnidadeAgua toAguaEnum() {
    switch (this) {
      case 'L':
        return UnidadeAgua.litro;
      case 'mL':
        return UnidadeAgua.mL;
      default:
        return UnidadeAgua.mL;
    }
  }
}
