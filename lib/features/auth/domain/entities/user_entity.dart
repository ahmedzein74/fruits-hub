// Represents a user in the application.
class UserEntity {
  final String name;
  final String email;
  final String uId;

  // Constructor to create a UserEntity object.
  // Requires name, email, and uId to be provided.
  UserEntity({required this.name, required this.email, required this.uId});

  // Converts the UserEntity object into a map (key-value pairs).
  // Useful for saving user data to a database or sending it over a network.
  toMap() => {
        'name': name,
        'email': email,
        'uId': uId,
      };
}
