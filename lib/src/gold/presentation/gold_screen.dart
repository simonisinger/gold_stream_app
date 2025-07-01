import 'package:flutter/material.dart';
import 'package:gold_stream_app/src/gold/data/fake_gold_api.dart';
import 'package:gold_stream_app/src/gold/presentation/widgets/gold_header.dart';
import 'package:intl/intl.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoldHeader(),
              SizedBox(height: 20),
              Text(
                'Live Kurs:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 20),
              StreamBuilder(
                stream: getGoldPriceStream(),
                builder: (context, asyncSnapshot) {

                  return Text(
                    asyncSnapshot.hasData
                        ? NumberFormat.simpleCurrency(locale: 'de_DE').format(asyncSnapshot.data)
                        : 'Waiting for Data',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
