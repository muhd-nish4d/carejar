import 'package:carejar/models/loading_status_enum.dart';
import 'package:carejar/provider/details_provider.dart';
import 'package:carejar/provider/doctors_provider.dart';
import 'package:carejar/screens/details/screen_details.dart';
import 'package:carejar/screens/home/widget/doctor_card.dart';
import 'package:carejar/screens/home/widget/widget_failed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//We listing the doctors name in this screen and in the top of this screen
//placed a search bar for search the doctor with name

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: RefreshIndicator(
        //If anyone swipe to down in home screen it will be
        //refresh so in that time recall the API for get updated
        //doctors
        onRefresh: () => Provider.of<DoctorsProvider>(context, listen: false)
            .getDoctorModels(),
        child: Consumer<DoctorsProvider>(
          builder: (context, value, child) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  controller: value.doctorSearch,
                  onChanged: (value) {
                    Provider.of<DoctorsProvider>(context, listen: false)
                        .getDoctorModels();
                  },
                ),
              ),
              Expanded(
                  child: value.fetchStatus == FetchStatus.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(
                          children: [
                            Column(
                              children: [
                                Visibility(
                                    visible: value.isApiCalled,
                                    child: const LinearProgressIndicator()),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        //Now we have all doctors names and ID from
                                        //the given API. This provider using for
                                        //get the specific doctors details from 
                                        //firebase it's filtering the doctor detail
                                        //with ID
                                        Provider.of<DetailsProvider>(context,
                                                listen: false)
                                            .getDetailsFromFireStore(value
                                                .doctors[index].id
                                                .toString());

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenDetails(index: index),
                                            ));
                                      },
                                      child: DoctorCard(
                                          index: index,
                                          doctorDetails: value.doctors[index]),
                                    ),
                                    itemCount: value.doctors.length,
                                  ),
                                ),
                              ],
                            ),
                            //If the API call having any fail that time show
                            //this widget
                            FetchFailedWidget(
                                isFailed:
                                    value.fetchStatus == FetchStatus.failed),
                          ],
                        )),
            ],
          ),
        ),
      ),
    ));
  }
}
