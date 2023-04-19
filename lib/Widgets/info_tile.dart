
import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String _key;
  final String _value;
  const InfoTile(this._key, this._value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            _key,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          trailing: Text(_value),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
