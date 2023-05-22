class Pokemon {
  String? name;
  String? url;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  int getId() {
    return int.parse(url!.split('pokemon/').last.replaceAll('/', ''));
  }

  String getNameUpperCaseFirstLetter() {
    return '${name?.substring(0, 1).toUpperCase()}${name!.substring(1, name!.length)}';
  }

  String getIdWithHashtag() {
    String valueWithHashtag =
        '${int.parse(url!.split('pokemon/').last.replaceAll('/', ''))}'
            .padLeft(3, '0');
    return '#$valueWithHashtag';
  }
}
