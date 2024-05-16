final class Option {
  final String title;
  final String description;
  final String imagepath;
  const Option(this.title, this.description, this.imagepath);
}

class Options {
  static const List<Option> categories = [
    Option(
      "Kalendarz",
      "Zarządzaj swoim kalendarzem",
      "assets/categories/calendar.jpg",
    ),
    Option(
      "Ogłoszenia",
      "Przeglądaj najnowsze posty od administracji!",
      "assets/categories/wydarzenia.jpeg",
    ),
    Option(
      "Dokumenty ",
      "Dostęp do ważnych dokumentów",
      "assets/categories/dokumenty.jpg",
    ),
    Option(
      "Usterki",
      "Zgłoś usterkę",
      "assets/categories/usterka.jpeg",
    ),
  ];
}
