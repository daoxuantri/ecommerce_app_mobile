import 'package:meta/meta.dart';

@immutable
abstract class AddressEvent {}

class AddressInitialEvent extends AddressEvent{}

class AddressButtonClickEvent extends AddressEvent{}

class AddressMoreClickEvent extends AddressEvent{}


class AddressRemoveClickEvent extends AddressEvent{
  final String? idAddress ; 
  AddressRemoveClickEvent(
     this.idAddress
  );
}

class AddressSetDefaultClickedEvent extends AddressEvent{
  final String? idAddress ; 
  AddressSetDefaultClickedEvent(
     this.idAddress
  );
}

