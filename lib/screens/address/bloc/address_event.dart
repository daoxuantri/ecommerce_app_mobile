import 'package:meta/meta.dart';

@immutable
abstract class AddressEvent {}

class AddressInitialEvent extends AddressEvent{}

class AddressButtonClickEvent extends AddressEvent{}

class AddressMoreClickEvent extends AddressEvent{}
