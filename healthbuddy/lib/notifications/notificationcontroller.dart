

import 'package:flutter/material.dart';
import 'package:healthbuddy/notifications/Model/notification_model.dart';
import 'package:healthbuddy/notifications/notificationsservice.dart';

class NotificationsController extends ChangeNotifier {
  NotificationsService service = NotificationsService() ;
  List<NotificationItem> notificationslist = [];

  NotificationsController() {
    _Init() ;
  }

  Future<void> _Init() async{
    var result = (await service.getnotifications()) as Map<String, dynamic>;
    notificationslist.clear();
    result.forEach((date, notification) {
      for (var item in notification) {
      notificationslist.add(NotificationItem(title:item['ziel'] ,message: item['beschreibung'],dateTime:date ));
    }
     });
    
    notifyListeners();
  }







}