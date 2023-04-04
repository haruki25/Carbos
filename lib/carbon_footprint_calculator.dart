import 'package:flutter/material.dart';
import 'tips_screen.dart';

class CarbonFootprintCalculator extends StatefulWidget {
  @override
  _CarbonFootprintCalculatorState createState() =>
      _CarbonFootprintCalculatorState();
}

class _CarbonFootprintCalculatorState extends State<CarbonFootprintCalculator> {
  // Define the variables that will store the user's inputs
  double _carMileage = 0;
  double _carUsageTime = 0;
  double _publicTransportUsageTime = 0;
  double _flightsPerYear = 0;
  double _meatConsumption = 0;
  double _plasticUsage = 0;
  double _electricityUsage = 0;

  // Define the variables that will store the carbon footprint calculations
  double _carCarbonFootprint = 0;
  double _publicTransportCarbonFootprint = 0;
  double _flightsCarbonFootprint = 0;
  double _meatCarbonFootprint = 0;
  double _plasticCarbonFootprint = 0;
  double _electricityCarbonFootprint = 0;
  double _totalCarbonFootprint = 0;

  // Define the function that will calculate the carbon footprint
  void _calculateCarbonFootprint() {
    // Calculate the carbon footprint for each input
    _carCarbonFootprint = _carMileage * _carUsageTime * 0.42;
    _publicTransportCarbonFootprint = _publicTransportUsageTime * 0.09;
    _flightsCarbonFootprint = _flightsPerYear * 0.24;
    _meatCarbonFootprint = _meatConsumption * 2.5;
    _plasticCarbonFootprint = _plasticUsage * 0.11;
    _electricityCarbonFootprint = _electricityUsage * 1.35;

    // Calculate the total carbon footprint
    _totalCarbonFootprint = _carCarbonFootprint +
        _publicTransportCarbonFootprint +
        _flightsCarbonFootprint +
        _meatCarbonFootprint +
        _plasticCarbonFootprint +
        _electricityCarbonFootprint;

    if (_totalCarbonFootprint < 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Great job!"),
            content: Text(
                "Your carbon footprint is less than 10 tons of CO2 per year."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    } else {
      double treesToPlant = (_totalCarbonFootprint - 10) / 0.6;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("You can do better!"),
            content: Text(
                "Your carbon footprint is ${_totalCarbonFootprint.toStringAsFixed(2)} tons of CO2 per year. You should plant ${treesToPlant.toStringAsFixed(0)} trees per year to offset your carbon emissions."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }

    // Update the UI with the new values
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carbon Footprint Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter your information to calculate your carbon footprint:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Car mileage (miles per gallon)',
                ),
                onChanged: (value) {
                  _carMileage = double.tryParse(value) ?? 0;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Car usage time (hours per week)',
                ),
                onChanged: (value) {
                  _carUsageTime = double.tryParse(value) ?? 0;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Public transport usage time (hours per week)',
                ),
                onChanged: (value) {
                  _publicTransportUsageTime = double.tryParse(value) ?? 0;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Flights per year',
                ),
                onChanged: (value) {
                  _flightsPerYear = double.tryParse(value) ?? 0;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Meat consumption (pounds per week)',
                ),
                onChanged: (value) {
                  _meatConsumption = double.tryParse(value) ?? 0;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Plastic usage (pounds per week)',
                ),
                onChanged: (value) {
                  _plasticUsage = double.tryParse(value) ?? 0;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Electricity usage (kilowatt-hours per month)',
                ),
                onChanged: (value) {
                  _electricityUsage = double.tryParse(value) ?? 0;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _calculateCarbonFootprint,
                child: Text('Calculate'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Your carbon footprint is:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '${_totalCarbonFootprint.toStringAsFixed(2)} tons of CO2 per year',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarbonFootprintTipsScreen()),
                  );
                },
                child: Text('Reduce Carbon Emissions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
