import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_e_comerc_app/core/utlis/app_assets.dart';
import 'package:market_e_comerc_app/core/utlis/shared_preferences.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/manger/cubit/update_user_data_cubit.dart';
import 'package:market_e_comerc_app/featuers/protofoli/presentation/view/widgets/coustem_profile_image.dart';
import 'package:restart_app/restart_app.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _typeController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  String selectedType = 'user';
  final List<String> types = ['user', 'admin', 'guest'];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    String name = await SharedPreferenceManager.getName() ?? 'Edite';
    String email = await SharedPreferenceManager.getEmail() ?? '';
    String gender = await SharedPreferenceManager.getGender() ?? '';
    String type = await SharedPreferenceManager.getType() ?? 'user';
    String address = await SharedPreferenceManager.getAdress() ?? '';
    String phone = await SharedPreferenceManager.getPhone() ?? '';

    setState(() {
      _nameController.text = name;
      _emailController.text = email;
      _genderController.text = gender;
      _typeController.text = type;
      selectedType = type;
      _addressController.text = address;
      _phoneController.text = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
      listener: (context, state) async {
        if (state is UpdateUserDataSuccess) {
          // حفظ البيانات الجديدة في SharedPreferences
          await SharedPreferenceManager.saveName(_nameController.text);
          await SharedPreferenceManager.saveEmail(_emailController.text);
          await SharedPreferenceManager.saveGender(_genderController.text);
          await SharedPreferenceManager.saveType(selectedType);
          await SharedPreferenceManager.saveAddress(_addressController.text);
          await SharedPreferenceManager.savePhone(_phoneController.text);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("تم حفظ التعديلات بنجاح ✅")),
          );
        } else if (state is UpdateUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("خطأ: ${state.errorMessage}")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      child: CoustemProfileImage(urlImage: AppAssets.hamdi),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _buildTextField(Icons.person, 'Name', _nameController),
                const SizedBox(height: 15),
                _buildTextField(Icons.email, 'Email', _emailController),
                const SizedBox(height: 15),
                _buildTextField(Icons.phone, 'Phone', _phoneController),
                const SizedBox(height: 15),
                _buildTextField(Icons.transgender, 'Gender', _genderController),
                const SizedBox(height: 15),
                _buildTypeDropdown(),
                const SizedBox(height: 15),
                _buildTextField(Icons.location_on, 'Address', _addressController),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: state is UpdateUserDataLoading
                        ? null
                        : () {
                            context.read<UpdateUserDataCubit>().updateDataUser(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  phone: _phoneController.text,
                                  gender: _genderController.text,
                                  type: selectedType,
                                  address: _addressController.text,
                                );
                              
                                
                          },
                    child: state is UpdateUserDataLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Save Changes'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      IconData icon, String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: const Icon(Icons.edit, size: 20),
      ),
    );
  }

  Widget _buildTypeDropdown() {
    return DropdownButtonFormField<String>(
      initialValue: selectedType,
      items: types
          .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            selectedType = value;
            _typeController.text = value;
          });
        }
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person_outline),
        labelText: 'Type',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
