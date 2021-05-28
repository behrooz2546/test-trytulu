import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:trytulu/Utils/MyBlocObserver.dart';
import 'package:trytulu/blocs/task/task_bloc.dart';
import 'package:trytulu/pages/TaskInformationPage.dart';
import 'package:trytulu/services/TaskRepository.dart';
import 'package:trytulu/services/TaskService.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        final chopper = ChopperClient(
          baseUrl: 'http://papi.wipehero.com/',
          converter: JsonConverter(),
          errorConverter: JsonConverter(),
          services: [
            TaskService.create(),
          ],
        );
        return chopper;
      },
      dispose: (context, ChopperClient client) => client.dispose(),
      child: MaterialApp(
        title: 'TryTulu Test App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) =>
              TaskBloc(taskRepository: ApiTaskRepository(context: context))
                ..add(LoadTasks()),
          child: TaskInformationPage(),
        ),
      ),
    );
  }
}
