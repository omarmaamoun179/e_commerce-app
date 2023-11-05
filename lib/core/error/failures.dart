abstract class Falirues {
  String mssg;
  Falirues(this.mssg);
  @override
  String toString() {
    return mssg;
  }
}

class RemoteServerFailure extends Falirues {
  RemoteServerFailure(super.mssg);
}

class CacheFailure extends Falirues {
  CacheFailure(super.mssg);
}
