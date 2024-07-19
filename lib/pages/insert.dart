import 'package:flutter/material.dart';
import 'data.dart';

class Insert extends StatefulWidget {
  final int index;
  final Map<String, dynamic> value;

  Insert({Key? key, required this.index, required this.value}) : super(key: key);

  @override
  _InsertState createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    _getData();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _getData() {
    if (widget.index != null) {
      setState(() {
        nameController.text = widget.value['name'] ?? '';
        addressController.text = widget.value['address'] ?? '';
        phoneController.text = widget.value['phone'] ?? '';
      });
    }
  }

  bool _isDataValid() {
    return nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  Future<void> _saveData() async {
    if (_isDataValid()) {
      var customer = {
        'name': nameController.text,
        'address': addressController.text,
        'phone': phoneController.text,
      };

      var savedData = await Data.getData();

      if (widget.index == null) {
        // Insert operation
        savedData.insert(0, customer);
      } else {
        // Update operation
        savedData[widget.index] = customer;
      }

      await Data.saveData(savedData);
      Navigator.pop(context);
    } else {
      _showValidationError();
    }
  }

  void _showValidationError() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Empty Field'),
          content: Text('Please fill all fields.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteData() async {
    if (widget.index != null) {
      var savedData = await Data.getData();
      savedData.removeAt(widget.index);
      await Data.saveData(savedData);
      Navigator.pop(context);
    }
  }

  Widget _getDeleteButton() {
    if (widget.index != null && widget.value != null) {
      return TextButton(
        child: Text(
          'DELETE',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: _deleteData,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert'),
        backgroundColor: Colors.blue,
        actions: [
          _getDeleteButton(),
          TextButton(
            onPressed: _saveData,
            child: Text(
              'SAVE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name'),
            TextField(
              controller: nameController,
            ),
            SizedBox(height: 20),
            Text('Address'),
            TextField(
              controller: addressController,
            ),
            SizedBox(height: 20),
            Text('Phone'),
            TextField(
              controller: phoneController,
            ),
          ],
        ),
      ),
    );
  }
}
