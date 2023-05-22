class DiamondPearl {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  DiamondPearl({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  DiamondPearl.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];

    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;

    data['back_shiny'] = backShiny;

    data['front_default'] = frontDefault;

    data['front_shiny'] = frontShiny;
    return data;
  }
}