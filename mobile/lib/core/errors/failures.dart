import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  abstract final String errorMessage;
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ServerFailure extends Failure{
  @override
  final String errorMessage;

  ServerFailure(String s, {this.errorMessage = 'sever Failure'});

}
