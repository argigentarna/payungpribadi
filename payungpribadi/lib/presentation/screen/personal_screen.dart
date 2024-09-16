// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:payungpribadi/common/theme.dart';
import 'package:payungpribadi/presentation/provider/personal_data_notifier.dart';
import 'package:payungpribadi/presentation/widgets/appbar.dart';
import 'package:payungpribadi/presentation/widgets/initial_circle.dart';
import 'package:provider/provider.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhitePrimaryColor,
      body: SafeArea(
        child: Consumer<PersonalDataNotifier>(
            builder: (context, personalState, child) {
          final steps = personalState.steps;

          return Column(
            children: [
              const Appbar(
                title: 'Informasi Pribadi',
              ),
              // CustomTimeline(steps: steps),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                child: FlutterStepIndicator(
                  height: 40,
                  division: 10,
                  list: steps,
                  onChange: (int index) {},
                  page: personalState.selectedStep,
                  positiveColor: kPrimaryColor,
                  negativeColor: kGrayAvatar,
                  progressColor: kPrimaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: personalState.steps
                      .map(
                        (data) => SizedBox(
                          width: 60,
                          child: Text(
                            data.description,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: mainTextStyle.copyWith(
                              fontSize: 11,
                              fontWeight: bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  pageSnapping: true,
                  itemCount: steps.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final step = steps[index];
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
