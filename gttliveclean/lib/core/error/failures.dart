abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}

// Esempi di Failure specifici
class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}
