abstract class UseCase<In, Out> {
  Future<Out> execute(In input);
}
