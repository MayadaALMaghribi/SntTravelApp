import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/get_activity_for_booking_model.dart';
import 'package:sntegpito/Features/Booking_activity_cart/data/models/prepare_activity_model.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/confirm_activity_booking/confirm_activity_booking_cubit.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/get_activity_for_booking/get_activity_for_booking_cubit.dart';
import 'package:sntegpito/Features/payment/data/models/orginzation_models_booking/activity_booking_data.dart';
import 'package:sntegpito/core/widgets/custom_room_button.dart';
import 'package:sntegpito/core/utils/styles.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/them_date.dart';
import '../../../../payment/presentation/views/widgets/payment_method_bottom_sheet.dart';

class TripPlannerViewBody extends StatefulWidget {
  const TripPlannerViewBody(
      {super.key,
      required this.prepareActivityBookingModel,
      required this.price});
  final PrepareActivityBookingModel prepareActivityBookingModel;
  final int price;
  @override
  _TripPlannerScreenState createState() => _TripPlannerScreenState();
}

class _TripPlannerScreenState extends State<TripPlannerViewBody> {
  late bool hasRoom;
  DateTime? startDate;
  DateTime? endDate;
  late List<List<Activities>> dailyActivities;
  int selectedDay = 0;

  @override
  void initState() {
    super.initState();
    hasRoom = widget.prepareActivityBookingModel.hasRoom!;
    dailyActivities = [];
  }

  List<DateTime> getTripDates() {
    if (startDate == null || endDate == null) return [];
    return List.generate(
      endDate!.difference(startDate!).inDays + 1,
      (index) => startDate!.add(Duration(days: index)),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('EEEE, d MMMM').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetActivityForBookingCubit, GetActivityForBookingState>(
      builder: (context, state) {
        if (state is GetActivityForBookingLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetActivityForBookingFailure) {
          CustomSnackBar.show(context, state.errmessage);
          return const Center(child: Text("Failed to load activities."));
        } else if (state is GetActivityForBookingSuccess) {
          final activities = state.getActivityForBookingModel.activities ?? [];

          if (hasRoom) {
            startDate = DateTime.parse(activities.first.activityStartDate!);
            endDate = DateTime.parse(activities.first.activityEndDate!);
          }

          final tripDates = getTripDates();

          if (dailyActivities.length != tripDates.length) {
            dailyActivities = List.generate(tripDates.length, (_) => []);
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 245, 246, 247),
              title: const Text('Plan Your Trip'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.picture_as_pdf),
                  onPressed: () => generateAndPrintPDF(tripDates),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (!hasRoom) ...[
                    Row(
                      children: [
                        const Text("Start Date:",
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              builder: (BuildContext context, Widget? child) {
                                return ThemeofDate(context, child);
                              },
                            );
                            if (picked != null) {
                              setState(() {
                                startDate = picked;
                                if (endDate != null &&
                                    endDate!.isBefore(startDate!)) {
                                  endDate = null;
                                }
                                dailyActivities = List.generate(
                                  getTripDates().length,
                                  (_) => [],
                                );
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 223, 234, 244),
                          ),
                          child: Text(
                            startDate == null
                                ? "Select Start Date"
                                : formatDate(startDate!),
                            style: Styles.textStyle15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text("End Date:", style: TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: startDate ?? DateTime.now(),
                              firstDate: startDate ?? DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 365),
                              ),
                              builder: (BuildContext context, Widget? child) {
                                return ThemeofDate(context, child);
                              },
                            );
                            if (picked != null &&
                                startDate != null &&
                                picked.isAfter(startDate!)) {
                              setState(() {
                                endDate = picked;
                                dailyActivities = List.generate(
                                  getTripDates().length,
                                  (_) => [],
                                );
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 223, 234, 244),
                          ),
                          child: Text(
                            endDate == null
                                ? "Select End Date"
                                : formatDate(endDate!),
                            style: Styles.textStyle15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                  ], // end if
                  Expanded(
                    child: ListView.builder(
                      itemCount: tripDates.length,
                      itemBuilder: (context, index) {
                        final date = tripDates[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: const Color.fromARGB(255, 223, 234, 244),
                          shadowColor: const Color.fromARGB(255, 223, 234, 244),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatDate(date),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Divider(),
                                ...dailyActivities[index].map(
                                  (activity) => ListTile(
                                    leading:
                                        const Icon(Icons.check_circle_outline),
                                    title: Text(activity.activityName ?? ""),
                                  ),
                                ),
                                if (dailyActivities[index].isEmpty)
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text("No activities added."),
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => _showAddActivityDialog(activities),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                "Add Activity",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: const Color(0xff247CFF),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: BlocListener<ConfirmActivityBookingCubit,
                    ConfirmActivityBookingState>(
                  listener: (context, state) {
                    if (state is ConfirmActivityBookingLoading) {
                      Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ConfirmActivityBookingFailure) {
                      CustomSnackBar.show(context, state.errmessage,
                          isError: true);
                    } else if (state is ConfirmActivityBookingSuccess) {
                      CustomSnackBar.show(context, state.message,
                          isError: false);
                    }
                  },
                  child: CustomRoomButton(
                    text: "Confirm Booking",
                    ontap: () {
                      ActivityBookingData bookingDataActivity =
                          ActivityBookingData(
                              price: widget.price.toDouble(),
                              activityname: "Activity");
                      showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) {
                            return PaymentMethodBottomSheet(
                              baseBookingData: bookingDataActivity,
                              //state.detailsBookingBeforePaymentModel,
                            );
                          });
                      final List<Map<String, dynamic>> activitiesToSend = [];
                      for (int i = 0; i < dailyActivities.length; i++) {
                        for (var activity in dailyActivities[i]) {
                          activitiesToSend.add({
                            "activityId": activity.activityId,
                            "activityName": activity.activityName,
                            "activityPrice": activity.activityPrice,
                            "numberOfGuests": activity.numberOfGuests,
                            "startDate": startDate!
                                .add(Duration(days: i))
                                .toIso8601String(),
                          });
                        }
                      }

                      context
                          .read<ConfirmActivityBookingCubit>()
                          .confirmBooking(
                            context: context,
                            userid:
                                CacheHelper().getData(key: Constants.userId),
                            activities: activitiesToSend,
                          );
                    },
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _showAddActivityDialog(List<Activities> activitiesFromApi) {
    final tripDates = getTripDates();
    String? selectedActivityName;
    int selectedDayIndex = 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 223, 234, 244),
          shadowColor: const Color.fromARGB(255, 177, 216, 248),
          title: const Text("Add Activity"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Activity"),
                items: activitiesFromApi.map((activity) {
                  return DropdownMenuItem(
                    value: activity.activityName,
                    child: Text(activity.activityName ?? ""),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedActivityName = value;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(labelText: "Day"),
                value: selectedDayIndex,
                items: List.generate(tripDates.length, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text(
                        "Day ${index + 1} (${formatDate(tripDates[index])})"),
                  );
                }),
                onChanged: (value) {
                  selectedDayIndex = value ?? 0;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedActivityName != null) {
                  final selectedActivity = activitiesFromApi.firstWhere(
                    (activity) => activity.activityName == selectedActivityName,
                  ); // ✅ تم التعديل هنا: جلب الكائن كامل

                  setState(() {
                    dailyActivities[selectedDayIndex].add(selectedActivity);
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  void generateAndPrintPDF(List<DateTime> tripDates) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) => [
          for (int i = 0; i < tripDates.length; i++)
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  formatDate(tripDates[i]),
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold),
                ),
                if (dailyActivities[i].isEmpty) pw.Text("No activities."),
                for (var activity in dailyActivities[i])
                  pw.Bullet(text: activity.activityName ?? ""),
                pw.SizedBox(height: 10),
              ],
            ),
        ],
      ),
    );

    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }
}
