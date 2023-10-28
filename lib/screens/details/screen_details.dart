import 'package:carejar/models/loading_status_enum.dart';
import 'package:carejar/provider/details_provider.dart';
import 'package:carejar/screens/details/widgets/app_bar.dart';
import 'package:carejar/screens/details/widgets/doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Consumer<DetailsProvider>(builder: (context, value, child) {
      return value.status == FetchStatus.loading
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : value.status == FetchStatus.success
              // After getting the data from firebase
              ? Scaffold(
                  body: SafeArea(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DoctorAppBar(
                              index: index,
                              doctorName: value.details.name,
                              rating: value.details.reviews['rating']),
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Specialty',
                          detail: value.details.specialty,
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Education and\ntraining',
                          detail: value.details.eduandtrain,
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Board\ncertification',
                          detail: value.details.certification,
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Hospital\naffiliations',
                          detail: value.details.affiliations,
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Experience',
                          detail: '${value.details.exp} years',
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Languages\nspoken',
                          detail: value.details.lan,
                        ),
                        WidgetDoctorDetail(
                          detailKey: 'Professional\nassociations',
                          detail: value.details.association,
                        ),
                        ExpansionTile(
                          title: const Text(
                            'Patient reviews',
                          ),
                          children: [Text(value.details.reviews['feedback'])],
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: ElevatedButton(
                    onPressed: () {
                      //Function for book and unbook, "showToast" for show a
                      //massege after that button click
                      if (value.buttonStatus != FetchStatus.loading) {
                        Provider.of<DetailsProvider>(context, listen: false)
                            .bookUnbook(
                                value.details.isBooked, value.details.id)
                            .then((v) {
                          showToast(value.details.isBooked
                              ? "Your booking cancelled"
                              : 'Booked');
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, elevation: 0),
                    child: value.buttonStatus == FetchStatus.loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeAlign: -3,
                          )
                        : Text(
                            value.details.isBooked ? 'UnBook' : 'Book',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                )
              : const Scaffold(
                  body: Center(
                    child: Text('something went wrong'),
                  ),
                );
    });
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: 2, gravity: Toast.bottom);
  }
}
