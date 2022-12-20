abstract class UpdateEvent {}

class InitialEvent extends UpdateEvent {}

class UpdateDataEvent extends UpdateEvent {
  final String? name;
  final String? email;
  final String? birthdate;
  final int? id;

  UpdateDataEvent(this.name, this.email, this.birthdate, this.id);
}
