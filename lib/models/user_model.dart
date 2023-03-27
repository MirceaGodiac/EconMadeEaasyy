class user {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  int credits;
  List<dynamic> completedLessons;
  user({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.credits,
    required this.completedLessons,
  });
}
