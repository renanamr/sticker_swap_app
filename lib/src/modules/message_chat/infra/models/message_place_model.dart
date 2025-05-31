import 'package:sticker_swap_app/src/modules/message_chat/domain/entities/message_place.dart';
import 'package:sticker_swap_app/src/utils/const/status_message_confirm.dart';

class MessagePlaceModel extends MessagePlace {
  MessagePlaceModel(
      {required super.time,
      required super.place,
      required super.status,
      required super.id,
      required super.idSender,
      required super.date,
      });

  factory MessagePlaceModel.fromMap(Map<String, dynamic> map) {
    final data = map['location_data'].toString().split("///");
    final timeAndHour = data[0].split("-");

    final statusConfirm = map["location_confirmed"];
    int status = StatusMessageConfirm.wait;

    if(statusConfirm != null){
      status = statusConfirm
          ? StatusMessageConfirm.accepted
          : StatusMessageConfirm.rejected;
    }


    return MessagePlaceModel(
      id: map['id'],
      time: timeAndHour[1],
      place: data[1],
      status: status,
      idSender: map['sender'],
      date: timeAndHour[0],
    );
  }
}
