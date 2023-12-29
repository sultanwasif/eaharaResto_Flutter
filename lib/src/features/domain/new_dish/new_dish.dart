
import 'package:flutter/material.dart';

class NewDishScreen extends StatefulWidget {
  const NewDishScreen({super.key});

  @override
  State<NewDishScreen> createState() => _NewDishScreenState();
}

class _NewDishScreenState extends State<NewDishScreen> {
  // Controller for text fields
  TextEditingController itemNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController taglineController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Dropdown values
  List<String> categories = ['value1', 'value2', 'value3'];
  List<String> offers = ['offer1', 'offer2', 'offer3'];
  List<String> foodPreferences = ['Vegetarian', 'Non-Vegetarian'];

  // Selected dropdown values
  String selectedCategory = 'value1';
  String selectedOffer = 'offer1';
  String selectedFoodPreference = 'Vegetarian';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "New Dish",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                _buildTextField('Item Name', itemNameController),
                _buildTextField('Price \u20B9', priceController),
                _buildDropdown('Category', categories, selectedCategory),
                _buildDropdown('Offer', offers, selectedOffer),
                _buildDropdown('Food Preference', foodPreferences, selectedFoodPreference),
                _buildTextField('Tagline', taglineController),
                _buildTextField('Description', descriptionController),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    // Implement functionality for 'Get Pic' button
                  },
                  child: const Text('Get Pic'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement functionality to save the item
                  },
                  child: const Text('Save Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hintText, List<String> items, String selectedValue) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: const TextStyle(color: Colors.black), // Adjust text color as needed
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
          decoration: InputDecoration(
            labelText: hintText,
            border: InputBorder.none,
          ),
          // isDense: true,
        ),
      ),
    );
  }
}

