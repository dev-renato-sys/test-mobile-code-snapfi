import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/other.dart';
import 'package:snapfi_app/modules/snapfi_app/domain/models/pokemon_detail/versions.dart';

class Sprites {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  Other? other;
  Versions? versions;

  Sprites(
      {this.backDefault,
      this.backShiny,
      this.frontDefault,
      this.frontShiny,
      this.other,
      this.versions});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
    versions =
        json['versions'] != null ? Versions.fromJson(json['versions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    if (other != null) {
      data['other'] = other!.toJson();
    }
    if (versions != null) {
      data['versions'] = versions!.toJson();
    }
    return data;
  }
}