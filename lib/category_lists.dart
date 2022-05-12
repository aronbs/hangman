class CategoryLists {
  CategoryLists(this.number);
  int number;

  List<String>? categoryListSelection() {
    if (number == 1) {
      List<String> marvel = ['eikka', 'anna', 'test'];
      return marvel;
    } else if (number == 2) {
      List<String> dogBreed = ['chiuahua', 'labbi', 'bc'];
      return dogBreed;
    } else if (number == 3) {
      List<String> games = ['halo', 'minecraft'];
      return games;
    } else if (number == 4) {
      List<String> sport = ['bolti', 'karfa'];
      return sport;
    } else if (number == 5) {
      List<String> tvShow = ['friends', 'himym'];
      return tvShow;
    } else if (number == 6) {
      List<String> music = ['akon', 'eminem'];
      return music;
    }
  }
}
