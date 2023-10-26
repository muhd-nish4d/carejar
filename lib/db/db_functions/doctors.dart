// import 'package:carejar/models/doctor_model/doctors_model.dart';
// import 'package:hive/hive.dart';

// class DoctorsDBFunctions {
//   final _doctorsDBName = 'DoctorsDB';

//   Future<Box<DoctorModel>> doctorOpenBox() async {
//     var box = await Hive.openBox<DoctorModel>(_doctorsDBName);
//     return box;
//   }

//   Future<List<DoctorModel>> getAllDoctorList() async {
//     final box = await doctorOpenBox();
//     List<DoctorModel> categories = box.values.toList();
//     return categories;
//   }

//   Future<void> addAllDoctors(List<DoctorModel> doctors) async {
//     Box<DoctorModel> box = await doctorOpenBox();
//     for (var doctor in doctors) {
//       await box.put(doctor.id, doctor);
//     }
//   }
// }
