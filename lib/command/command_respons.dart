class CommandResponse {
  bool isSucces;
  String? message;

  CommandResponse._({
    required this.isSucces,
    this.message,
  });

  factory CommandResponse.succes() {
    return CommandResponse._(
      isSucces: true,
    );
  }

  factory CommandResponse.error(String message) {
    return CommandResponse._(
      isSucces: false,
      message: message,
    );
  }
}
