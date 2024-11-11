import 'package:flutter/material.dart';
import 'package:todo_app/models/task_group.dart';

class TasksSummaryWidget extends StatelessWidget {
  const TasksSummaryWidget({
    required this.title,
    required this.color,
    required this.numberOfTasks,
    super.key,
  });
  final String title;
  final TaskGroupWithCounts numberOfTasks;
  final int color;

  @override
  Widget build(BuildContext context) {
    Color cor = Color(color);
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation(cor),
              backgroundColor: Colors.grey,
              value: numberOfTasks.totalTasks > 0 ? (numberOfTasks.completedTasks / numberOfTasks.totalTasks) : 0,
            ),
          ),
          const SizedBox(
            width: 20,
          ),

          /// Texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "${numberOfTasks.completedTasks} of ${numberOfTasks.totalTasks} task",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
