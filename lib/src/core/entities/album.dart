import 'package:sticker_swap_app/src/modules/sticker/domain/entities/sticker.dart';
part 'album.g.dart';

class Album {
  Map<int, List<Sticker>> collectionStickers;
  Album()
      : collectionStickers = {
          0: const [],
          1: const [],
          2: const [],
          3: const [],
        };
        
  Map<String, dynamic> toMap() {
    return {
      for (int i = 0; i < 38; i++)
        i.toString(): [
          for (Sticker sticker in collectionStickers[i]!) sticker.toMap(),
        ],
    };
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    final listGroups = json['sticker_groups'] as List<dynamic>;

    final Map<int, List<Sticker>> groupMap = {};

    for (final groupEntry in listGroups) {
      final entry = groupEntry.entries.first;
      final groupId = int.parse(entry.key);
      final groupData = entry.value;

      final stickersData = groupData['stickers'] as List<dynamic>;

      final stickers = stickersData.map((stickerJson) {
        return Sticker(
          id: stickerJson['id'] as int,
          text: stickerJson['text'],
          idGroup: groupId,
          quantity: stickerJson['amount'] as int,
        );
      }).toList();

      groupMap[groupId] = stickers;
    }

    return Album()..collectionStickers = groupMap;
  }

}
