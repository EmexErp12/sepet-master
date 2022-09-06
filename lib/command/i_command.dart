import 'package:flutter/foundation.dart';
import 'package:sepet/command/command_enum.dart';
import 'package:sepet/command/command_respons.dart';

abstract class ICommand {
  final EnumRoles role;

  ICommand({required this.role});

  CommandResponse checkRole() {
    return CommandResponse.succes();
  }

  CommandResponse execute() {
    var response = checkRole();
    if (response.isSucces) {
      var x = run();
      return x;
    }
    return response;
  }

  @protected
  CommandResponse run();
}
