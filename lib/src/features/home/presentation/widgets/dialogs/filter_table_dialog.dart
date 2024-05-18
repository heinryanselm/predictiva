import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/shared/app_text.dart';

class FilterTableDialog extends StatefulWidget {
  final List<String> symbols;
  final void Function(String? selectedSymbol, String? price,
      DateTime? startDate, DateTime? endDate) onApply;

  const FilterTableDialog({
    super.key,
    required this.symbols,
    required this.onApply,
  });

  @override
  FilterTableDialogState createState() => FilterTableDialogState();
}

class FilterTableDialogState extends State<FilterTableDialog> {
  final _formKey = GlobalKey<FormState>();
  String? selectedSymbol;
  String? price;
  DateTime? startDate;
  DateTime? endDate;

  void setStartDate(DateTime date) {
    setState(() {
      startDate = date;
    });
  }

  void setEndDate(DateTime date) {
    setState(() {
      endDate = date;
    });
  }

  void setSelectedSymbol(String symbol) {
    setState(() {
      selectedSymbol = symbol;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.toH(context),
      width: double.infinity,
      child: Dialog(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        icon: const SizedBox.shrink(),
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.toW(context)),
                          ),
                        ),
                        value: selectedSymbol,
                        hint: const AppText(
                          'Symbol',
                          color: Colors.white24,
                        ),
                        onChanged: (value) {
                          setSelectedSymbol(value!);
                        },
                        items: widget.symbols
                            .toSet()
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: AppText(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 19.toW(context)),
                    Expanded(
                      child: TextFormField(
                        controller: TextEditingController(text: price),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.toW(context)),
                          ),
                        ),
                        onChanged: (value) {
                          price = value;
                        },
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.toH(context)),
                AppText.header('Date Range', fontSize: 14),
                SizedBox(height: 8.toH(context)),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: startDate?.toString().split(' ')[0] ?? '',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9-]')),
                            ],
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              labelText: 'Start',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(8.toW(context)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  size: 17.toW(context),
                                ),
                                onPressed: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (date != null) {
                                    setStartDate(date);
                                  }
                                },
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                        SizedBox(width: 19.toW(context)),
                        Expanded(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: endDate?.toString().split(' ')[0] ?? '',
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9-]')),
                            ],
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              labelText: 'End',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(8.toW(context)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_today_outlined,
                                  size: 17.toW(context),
                                ),
                                onPressed: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (date != null) {
                                    setEndDate(date);
                                  }
                                },
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.toH(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00BCAF),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.toW(context)),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.onApply(
                                  selectedSymbol, price, startDate, endDate);
                              Navigator.of(context).pop();
                            }
                          },
                          child: const AppText('Filter table'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
