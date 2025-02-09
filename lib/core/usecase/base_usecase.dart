import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsecase<T,Parameters> {
 Future<Either<Failure,T>> call(Parameters parameters) ;
}

class NoParameters {
}