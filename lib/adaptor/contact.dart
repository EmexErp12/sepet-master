class Contact {
  final String fullName;
  final String email;
  final bool favourite;

  const Contact({
    required this.fullName,
    required this.email,
    required this.favourite,
  });

  void save() {
    print('Contact saved ' + fullName);
  }
}
