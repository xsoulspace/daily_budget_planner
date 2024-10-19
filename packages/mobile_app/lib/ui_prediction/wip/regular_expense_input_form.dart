import 'package:flutter/material.dart';
import 'package:mobile_app/ui_prediction/wip/expensess_prediction_models.dart';

class RegularExpenseInputForm extends StatefulWidget {
  const RegularExpenseInputForm({required this.onSubmit, super.key});
  final Function(RegularExpense) onSubmit;

  @override
  _RegularExpenseInputFormState createState() =>
      _RegularExpenseInputFormState();
}

class _RegularExpenseInputFormState extends State<RegularExpenseInputForm> {
  final _formKey = GlobalKey<FormState>();
  double _amount = 0;
  Period _period = Period.daily;

  @override
  Widget build(final BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              validator: (final value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
              onSaved: (final value) => _amount = double.parse(value!),
            ),
            DropdownButtonFormField<Period>(
              decoration: InputDecoration(labelText: 'Period'),
              items: Period.values
                  .map(
                    (final period) => DropdownMenuItem(
                      value: period,
                      child: Text(period.toString().split('.').last),
                    ),
                  )
                  .toList(),
              onChanged: (final value) {
                if (value == null) return;
                setState(() => _period = value);
              },
              validator: (final value) {
                if (value == null) {
                  return 'Please select a period';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Add Regular Expense'),
            ),
          ],
        ),
      );

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final regularExpense = RegularExpense(
        amount: _amount,
        period: _period,
        category: '',
      );
      widget.onSubmit(regularExpense);
    }
  }
}
