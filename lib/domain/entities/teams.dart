class Teams {
  Team team;
  Venue venue;

  Teams({required this.team, required this.venue});
}

class Team {
  int id;
  String name;
  String? code;
  String? country;
  int? founded;
  bool? national;
  String? logo;

  Team(
      {required this.id,
      required this.name,
      this.code,
      this.country,
      this.founded,
      this.national,
      this.logo});
}

class Venue {
  int id;
  String name;
  String? city;
  int? capacity;
  String? surface;
  String? image;

  Venue(
      {required this.id,
      required this.name,
      this.city,
      this.capacity,
      this.surface,
      this.image});
}
