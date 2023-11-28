import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';


class  RegisterScreen extends StatelessWidget {
  const  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView()
      )
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding( 
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView( 
          child: Column( 
            children: [
              FlutterLogo(size: 100,),

              _RegistorForm(),

               SizedBox(height: 20),

               SizedBox(height: 20),
            ],
          ),
        )
      ),
    );
  }
}

class _RegistorForm extends StatefulWidget {
  const _RegistorForm();

  @override
  State<_RegistorForm> createState() => _RegistorFormState();
}

class _RegistorFormState extends State<_RegistorForm> {

  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    final registerCubit = context.watch<RegisterCubit>();


    return Form(
      key: _keyForm,
      child: Column(
        children: [

          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged:(value) {
              registerCubit.usernameChange(value);
              _keyForm.currentState?.validate();
            },
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo Requerido';
              if(value.trim().isEmpty) return 'Campo Requerido';
              if(value.length < 5) return 'Mas de 6 letras';
              return null;
            },

          ),

          const SizedBox(height: 20),
          CustomTextFormField(
            label: 'E-mail',
              onChanged:(value) {
              registerCubit.emailChange(value);
              _keyForm.currentState?.validate();
            },
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo Requerido';
              if(value.trim().isEmpty) return 'Campo Requerido';
              
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);
              if(!emailRegExp.hasMatch(value)) return 'Correo Invaldo';
              
              return null;
            },
          ),

          const SizedBox(height: 20),
          CustomTextFormField( 
            obscureText: true,
            label: 'Password',
              onChanged:(value) {
              registerCubit.passwordChange(value);
              _keyForm.currentState?.validate();
            },
            validator: (value) {
              if(value == null || value.isEmpty) return 'Campo Requerido';
              if(value.trim().isEmpty) return 'Campo Requerido';
              
        
              
              return null;
            },
          ),


          const SizedBox(height: 20),
          FilledButton.icon(
            icon: const Icon(Icons.save), 
            label: const Text('Nuevo User'),
            onPressed: () {
              bool isValid =  _keyForm.currentState!.validate();
              if(!isValid) return;

              registerCubit.onSubmit();
            }, 
          ),
        ],
      ),
    ); 
  }
}