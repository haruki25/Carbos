import 'package:flutter/material.dart';

class CarbonFootprintTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint Tips'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Here are some tips for reducing your carbon footprint:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Reduce your meat consumption: Eating less meat can help reduce greenhouse gas emissions from livestock and the production of animal feed.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '2. Use energy-efficient appliances: Switching to energy-efficient appliances can help reduce your electricity usage and carbon footprint.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '3. Walk, bike, or take public transportation: Using alternative modes of transportation can help reduce your carbon footprint from driving.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '4. Plant trees: Trees absorb carbon dioxide from the atmosphere and can help reduce greenhouse gas emissions.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '5. Reduce your plastic usage: Plastics are made from fossil fuels and contribute to greenhouse gas emissions when they are produced and disposed of.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '6. Use renewable energy sources: Switching to renewable energy sources like solar or wind power can help reduce your carbon footprint.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Remember, every small action counts towards reducing our carbon footprint and protecting the environment for future generations.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
