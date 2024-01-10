class AuthenticatedUserEntity{
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;

  const AuthenticatedUserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName
  });

  const AuthenticatedUserEntity.empty()
      : this(id: 0,username: '',email: '',firstName: '',lastName: '');
}

