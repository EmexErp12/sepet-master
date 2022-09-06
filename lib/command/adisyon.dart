import 'package:flutter/widgets.dart';
import 'package:sepet/command/command_enum.dart';
import 'package:sepet/command/command_respons.dart';
import 'package:sepet/command/i_command.dart';

class Adisyon extends ICommand {
  Adisyon() : super(role: EnumRoles.ADISYON);

  @override
  CommandResponse run() {
    print('adisyaon');
    return CommandResponse.succes();
  }
}
