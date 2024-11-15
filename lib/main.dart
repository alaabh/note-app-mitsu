import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/data/datasources/firebase_task_data_source.dart';
import 'package:notes/data/repositories/task_repository_impl.dart';
import 'package:notes/domain/usecases/add_task_use_case.dart';
import 'package:notes/domain/usecases/get_tasks_use_case.dart';
import 'package:notes/domain/usecases/delete_task_use_case.dart';
import 'package:notes/domain/usecases/update_task_use_case.dart';  
import 'package:notes/presentation/bloc/task_cubit/task_cubit.dart';
import 'package:provider/provider.dart';
import 'package:notes/firebase_options.dart';

import 'data/datasources/firebase_auth_data_source.dart';
import 'data/repositories/auth_repository.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/usecases/sign_in_use_case.dart';
import 'domain/usecases/sign_up_use_case.dart';
import 'presentation/bloc/auth_cubit/auth_cubit.dart';
import 'presentation/pages/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthDataSource>(
          create: (_) => FirebaseAuthDataSource(),
        ),
        Provider<FirebaseTaskDataSource>(
          create: (_) => FirebaseTaskDataSource(firestore),
        ),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(context.read<FirebaseAuthDataSource>()),
        ),
        Provider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(context.read<FirebaseTaskDataSource>()),
        ),
        Provider<SignInUseCase>(
          create: (context) => SignInUseCase(context.read<AuthRepository>()),
        ),
        Provider<SignUpUseCase>(
          create: (context) => SignUpUseCase(context.read<AuthRepository>()),
        ),
        Provider<GetTasksUseCase>(
          create: (context) => GetTasksUseCase(context.read<TaskRepository>()),
        ),
        Provider<DeleteTaskUseCase>(  
          create: (context) => DeleteTaskUseCase(context.read<TaskRepository>()),
        ),
        Provider<AddTaskUseCase>(  
          create: (context) => AddTaskUseCase(context.read<TaskRepository>()),
        ),
        Provider<UpdateTaskUseCase>(  
          create: (context) => UpdateTaskUseCase(context.read<TaskRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              context.read<SignInUseCase>(),
              context.read<SignUpUseCase>(),
            ),
          ),
          BlocProvider<TaskCubit>(
            create: (context) => TaskCubit(
              context.read<GetTasksUseCase>(),
              context.read<DeleteTaskUseCase>(),  
              context.read<AddTaskUseCase>(),  
              context.read<UpdateTaskUseCase>(),  
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Note App',
          home: SplashPage(),
        ),
      ),
    );
  }
}
