import 'package:sepet/command/command_enum.dart';
import 'package:sepet/command/command_respons.dart';
import 'package:sepet/command/i_command.dart';

class Mutfak extends ICommand {
  Mutfak() : super(role: EnumRoles.MUTFAK);

  @override
  CommandResponse run() {
    print('mutfak');
    return CommandResponse.succes();
  }
}
