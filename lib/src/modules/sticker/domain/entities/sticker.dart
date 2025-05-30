part 'sticker.g.dart';

class Sticker {
  int id;
  int idGroup;
  String text;
  int quantity;
  Sticker(
      {required this.id,
      required this.text,
      required this.idGroup,
      required this.quantity});
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "text": this.text,
      "sticker_group": this.idGroup,
      "amout": this.quantity,
    };
  }

  factory Sticker.fromJson(Map<String, dynamic> json) => _$StickerFromJson(json);
  Map<String, dynamic> toJson() => _$StickerToJson(this);
}
