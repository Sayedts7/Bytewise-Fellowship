import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldcheck/core/apptheme/app_light_color.dart';
import 'package:goldcheck/view/density_test/silver_density_test_screen.dart';

import 'package:goldcheck/view/formula_implementation/formula_for_gold.dart';
import 'package:goldcheck/view/help_screen.dart';
import 'package:goldcheck/view/result/result_screen.dart';
import 'package:goldcheck/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/resources/button.dart';

class GoldDensityTestScreen extends StatefulWidget {
  const GoldDensityTestScreen({Key? key}) : super(key: key);

  @override
  State<GoldDensityTestScreen> createState() => _GoldDensityTestScreenState();
}

class _GoldDensityTestScreenState extends State<GoldDensityTestScreen> {


  // Initial Selected Value
  String? selectedValue;
  bool navigateWithoutPrice = false;
  late TextEditingController weight = TextEditingController();
  late TextEditingController weightInLiquid = TextEditingController();
  late TextEditingController density = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    weight.dispose();
    weightInLiquid.dispose();
    density.dispose();
    super.dispose();
  }

  // List of items in our dropdown menu
  final List<String> items = [
    'G/cm\u00B3',
    'O/in\u00B3',
  ];
  // double formula(){
  //   double w3 = double.tryParse(weight.text)! - double.tryParse(weightInLiquid.text)!;
  //   double V = w3/double.tryParse(density.text)!;
  //   double densityOfGold = double.tryParse(weight.text)!/V;
  //   double karat = (densityOfGold/ 19.32) * 24;
  //   return karat;
  //
  // }

  void _calculate() {



    setState(() {
      double karat = FormulaForGold()
          .FormulaforKarat(weight.text, weightInLiquid.text, density.text);
      if (karat > 24) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Karat is more than 24"),
        ));
      } else {
        double purity = FormulaForGold().FormulaforPurity(weight.text, karat);
        double percentage = FormulaForGold().Formulaforpercentage(karat);

        double marketPrice = Provider.of<HomeViewModel>(context,listen: false).goldPrinceInUSD;

        // the price loaded from the api successfully
        if(marketPrice>0){

          double price= FormulaForGold().priceForGoldSample(weight.text, karat, marketPrice);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    item: 'Gold',
                    karat: karat,
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
                   builder: (context) => ResultScreen(
                     item: 'Gold',
                     karat: karat,
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

  Widget build(BuildContext context) {
 Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: thirdColor,
          ),
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
              onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HelpScreen()));
              },
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
                        "Calculate and enter the value of gold to determine it's value",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: const Color(0xff6F6F6F),
                            ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomSlidingSegmentedControl<int>(
                          initialValue: 1,
                          children: {
                            1: Text('Gold',
                                style: Theme.of(context).textTheme.bodySmall),
                            2: Text('Silver',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: secondaryColor)),
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
                          duration: const Duration(milliseconds: 10),
                          // curve: Curves.easeInToLinear,
                          onValueChanged: (v) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SilverDensityTestScreen()));
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
                            hint: Text(
                              items[0],
                              style:textStyle1,
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: textStyle1
                              ),
                            ))
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select type.';
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

                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Round_Button(
                    title: 'Calculate',
                    onpress: () {
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

                          // print(weight.text);
                          // print(weightInLiquid.text);
                          // print(density.text);
                          // print(formula());
                          // if(formula() > 24){
                          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          //     content: Text("Karat is more than 24"),
                          //   ));
                          // }
                          // else{
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(item: 'Gold', karat: formula(), density: density.text,)));
                          //
                          // }
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
}
