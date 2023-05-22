import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/diamond_pearl.dart';

class BlackWhite {
  DiamondPearl? animated;
  String? backDefault;
  String? backShiny;

  String? frontDefault;

  String? frontShiny;

  BlackWhite({
    this.animated,
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  BlackWhite.fromJson(Map<String, dynamic> json) {
    animated = json['animated'] != null
        ? DiamondPearl.fromJson(json['animated'])
        : null;
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (animated != null) {
      data['animated'] = animated!.toJson();
    }
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}