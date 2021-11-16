dartLanguagePrograms(a) {
  print(a);
  return a;
}

dartLanguagePrograms1(hey) {
  print("dartLanguagePrograms");
  print(hey);
}

void main() {
  var f = dartLanguagePrograms(3);
  dartLanguagePrograms1(f);
}
