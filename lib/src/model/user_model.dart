// ignore_for_file: public_member_api_docs, sort_constructors_first

sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> json){
    return switch(json['profile']){
      'ADM' => UserModelADM.fromMap(json),
      'EMPLOYEE' => UserModelEmployee.fromMap(json),
      _=> throw ArgumentError('User profile not found ')
    } ;
  }
}

class UserModelADM extends UserModel {
  final List<String>? workDays;
  final List<int>? workHours;
  UserModelADM({
    required super.id,
    required super.email,
    required super.name,
    super.avatar,
    this.workDays,
    this.workHours,
  });

  factory UserModelADM.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
      } =>
        UserModelADM(
          email: email,
          id: id,
          name: name,
          avatar: json['avatar'],
          workHours: json['work_hours']?.cast<String>(),
          workDays: json['work_days']?.cast<String>(),

        ),
        _=> throw ArgumentError('Invalid Json'), 
    };
  }
}

class UserModelEmployee extends UserModel {
  final int babershopId;
  final List<String> workDays;
  final List<int> workHours;
  UserModelEmployee({
    required super.id,
    required super.email,
    required this.babershopId,
    required super.name,
    required this.workDays,
    required this.workHours,
    super.avatar,
  });

  factory UserModelEmployee.fromMap(Map<String, dynamic> json){
return switch(json){
  {
     'id': final int id,
        'name': final String name,
        'email': final String email,
        'barbershop_id': final int babershopId,
        'work_days': final List workDays,
        'work_hours': final List workHours,
  }=>
  UserModelEmployee(
     id:  id,
        name:  name,
        email:  email,
        avatar: json['avatar'],
        babershopId: babershopId,
        workDays: workDays.cast<String>(),
        workHours: workHours.cast<int>(),
  ),
  _ =>throw ArgumentError('Inválid Json'),
};
  }
}
