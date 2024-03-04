abstract class Failures {
  final String message;

  Failures(this.message);
}

class RequestFailure implements Failures {
  @override
  final String message;

  RequestFailure(this.message);
}
