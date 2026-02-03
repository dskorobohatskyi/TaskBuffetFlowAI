import 'package:flutter/material.dart';
import '../models/task.dart';

class CompletionPage extends StatefulWidget {
  final Task task;
  final int sessionValue;

  CompletionPage({required this.task, required this.sessionValue});

  @override
  _CompletionPageState createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scale = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ready!')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _scale,
            child: Icon(Icons.check_circle, size: 100, color: Colors.green),
          ),
          SizedBox(height: 20),
          Text(
            'Accumulated (session): ${widget.sessionValue} ${widget.task.unitShortLabel}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 12),
          Text(
            'Accumulated (total): ${widget.task.progress} ${widget.task.unitShortLabel}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
