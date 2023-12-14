import 'package:go_router/go_router.dart';
import 'package:task_management_frontend/app/route/routes/route_path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../feature/dashboard/bloc/task_bloc.dart';
import '../../../feature/home_screen.dart';
import '../../../feature/products/product_screen.dart';

final router = GoRouter(
  initialLocation: RoutePath.home,
  routes: [
    GoRoute(
      path: RoutePath.home,
      name: RoutePath.home,
      builder: (context, state) => BlocProvider(
        create: (_) => TaskBloc()..add(const TasksFetchEvent()),
        child: const HomeScreen(),
      ),
      routes: [
        GoRoute(
          path: "${RoutePath.allTasks}/:id",
          name: RoutePath.allTasks,
          builder: (context, state) => SingleTaskScreen(
            id: state.pathParameters["id"] ?? "All",
          ),
        ),
      ],
    )
  ],
);
