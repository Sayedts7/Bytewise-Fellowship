import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:goldcheck/core/apptheme/app_light_color.dart';
import 'package:goldcheck/core/resources/button.dart';
import 'package:goldcheck/view/formula_implementation/formula_for_silver.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';
import '../result/silver_result/silver_result_screen.dart';
import 'gold_density_test_screen.dart';

class SilverDensityTestScreen extends StatefulWidget {
  const SilverDensityTestScreen({Key? key}) : super(key: key);

  @override
  State<SilverDensityTestScreen> createState() =>
      _SilverDensityTestScreenState();
}

class _SilverDensityTestScreenState extends State<SilverDensityTestScreen> {
  // Initial Selected Value
  String? selectedValue;
  bool navigateWithoutPrice = false;
  late TextEditingController weight = TextEditingController();
  late TextEditingController weightInLiquid = TextEditingController();
  late TextEditingController density = TextEditingController();

  // List of items in our dropdown menu
  final List<String> items = [
    'G/cm\u00B3',
    'O/in\u00B3',
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: thirdColor,),
        ),


        backgroundColor: secondaryColor,
        title: Center(
          child: Text(
            'Density Test',
            style: TextStyle(
                fontSize: 20, color: thirdColor, fontWeight: FontWeight.w400),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                color: thirdColor,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 35.0),
                      child: Text(
                        "Calculate and enter the value of silver to determine it's value",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: const Color(0xff6F6F6F),
                            ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSlidingSegmentedControl<int>(
                          initialValue: 2,
                          children: {
                            1: Text('Gold',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: secondaryColor)),
                            2: Text('Silver',
                                style: Theme.of(context).textTheme.bodySmall),
                          },
                          padding: 20,
                          height: 50,
                          decoration: BoxDecoration(
                            color: thirdColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          thumbDecoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                blurRadius: 4.0,
                                spreadRadius: 1.0,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                              ),
                            ],
                          ),
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInToLinear,
                          onValueChanged: (v) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GoldDensityTestScreen()));
                          },
                        ),
                        SizedBox(
                          width: 110,
                          child: DropdownButtonFormField2(
                            decoration: InputDecoration(
                              //Add isDense true and zero Padding.
                              //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              //Add more decoration as you want here
                              //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                            ),
                            isExpanded: true,
                            hint:  Text(
                              items[0],
                              style: TextStyle(fontSize: 14),
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 55,
                              width: 50,
                              padding: EdgeInsets.only(left: 20, right: 10),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const Text('Weight (Grams)'),

                    TextFormField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      controller: weight,
                      decoration: const InputDecoration(
                        // isDense: true,
                        hintText: '0.000',
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    const Text('Weight in liquid (cm\u00B3)'),
                    TextFormField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      controller: weightInLiquid,
                      decoration: const InputDecoration(
                        // isDense: true,
                        hintText: '0.000',
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text('Liquid density (cm\u00B3)'),

                    TextFormField(
                      onTap: () {
                        setState(() {});
                      },
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      controller: density,
                      decoration: const InputDecoration(
                        // isDense: true,
                        hintText: '0.000',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2
                ),
                Round_Button(title: 'Calculate', onpress: () {
                  if (weight.text.isEmpty ||
                      weightInLiquid.text.isEmpty ||
                      density.text.isEmpty) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                          content: Text("All fields must be filled"),
                    ));
                  } else {
                    if (double.parse(weightInLiquid.text) >= double.parse(weight.text)) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                             content: Text(
                            "Weight in weight in liquid can not be more or same as weight in grams"),
                      ));
                    } else {
                      _calculate();

                    }
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculate() {
    setState(() {
      double fineness = FormulaForSilver()
          .formulaForFineness(weight.text, weightInLiquid.text, density.text);
      if (fineness > 1000) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("fineness is more than 1000"),
        ));
      } else {

        double purity = FormulaForSilver().formulaForPurity(weight.text, fineness);
        double percentage = FormulaForSilver().formulaForPercentage(fineness);

        double marketPrice = Provider.of<HomeViewModel>(context,listen: false).silverPrinceInUSD;

        // the price loaded from the api successfully
        if(marketPrice>0){

          double price= FormulaForSilver().priceForSilverSample(weight.text, fineness, marketPrice);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SilverResultScreen(
                    item: 'Silver',
                    fineness: fineness,
                    density: density.text,
                    purity: purity,
                    percentage: percentage,
                    price: price,
                  )));
        }else{

          if(navigateWithoutPrice==true){

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SilverResultScreen(
                      item: 'Silver',
                      fineness: fineness,
                      density: density.text,
                      purity: purity,
                      percentage: percentage,
                      price: 0.0,
                    )));

          }else{

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 3),
              content: Text("the price is loading , click again if you want to calculate without the price "),
            ));

            navigateWithoutPrice = true;

          }

        }
      }
    });
  }


}
