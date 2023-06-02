class user {
  final String firstName;
  final String email;
  int credits;
  List<dynamic> completedLessons;
  user({
    required this.firstName,
    required this.email,
    required this.credits,
    required this.completedLessons,
  });
}
