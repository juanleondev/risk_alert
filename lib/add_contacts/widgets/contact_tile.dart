import 'package:flutter/material.dart';
import 'package:risk_alert/theme/colors.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    Key? key,
    required this.onTap,
    required this.onDelete,
    required this.name,
    required this.phone,
    required this.isSelected,
  }) : super(key: key);
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final String name;
  final String phone;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? primaryColor : const Color(0xffF2FFF7),
          ),
          color: const Color(0xffF2FFF7),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Checkbox(
            value: isSelected,
            onChanged: (_) {
              onTap();
            },
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff657373),
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            phone,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
