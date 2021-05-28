import 'package:chopper/chopper.dart';

part 'TaskService.chopper.dart';

@ChopperApi()
abstract class TaskService extends ChopperService {
  @Get(path: 'task.json')
  Future<Response> getTasks();

  static TaskService create([ChopperClient? client]) {
    return _$TaskService(client);
  }
}
