class SongsModel {
  String? name;
  String? desc;
  String? image;
  bool? isFav;

  SongsModel(
      {required this.name,
      this.desc,
      required this.image,
      required this.isFav});
}
