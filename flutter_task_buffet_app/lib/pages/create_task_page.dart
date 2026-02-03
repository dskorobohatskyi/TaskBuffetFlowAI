import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_service.dart';
import '../models/task.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _titleController = TextEditingController();
  final _customSplitController = TextEditingController();
  final _targetCountController = TextEditingController();
  final _targetMinutesController = TextEditingController();
  final _minExecMinutesController = TextEditingController();
  String? _selectedLinkCollectionId;

  UnitType unitType = UnitType.minutes;
  final List<UnitType> _unitTypeOptions = [
    UnitType.minutes,
    UnitType.executions,
    UnitType.pages,
    UnitType.links,
  ];
  List<int> selectedSplits = [];
  final List<int> predefinedSplits = [5, 10, 15, 20, 30, 45, 60];

  void toggleSplit(int value) {
    setState(() {
      selectedSplits.contains(value)
          ? selectedSplits.remove(value)
          : selectedSplits.add(value);
    });
  }

  void saveTask() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    if (unitType == UnitType.minutes && selectedSplits.isEmpty) return;

    if (unitType == UnitType.minutes) {
      final parsed = int.tryParse(_targetMinutesController.text);
      if (parsed == null || parsed <= 0) return;
    } else {
      final parsed = int.tryParse(_targetCountController.text);
      if (parsed == null || parsed <= 0) return;
    }
    if (unitType == UnitType.executions) {
      final parsed = int.tryParse(_minExecMinutesController.text);
      if (parsed == null || parsed <= 0) return;
    }
    if (unitType == UnitType.links && _selectedLinkCollectionId == null) return;

    final service = context.read<TaskService>();
    final targetValue = unitType == UnitType.minutes
        ? int.parse(_targetMinutesController.text)
        : int.parse(_targetCountController.text);

    service.addTask(
      Task(
        id: service.generateId(),
        title: title,
        unitType: unitType,
        targetValue: targetValue,
        allowedSplits: unitType == UnitType.minutes ? selectedSplits : const [],
        minRequiredMinutes:
            (unitType == UnitType.executions || unitType == UnitType.links)
                ? int.tryParse(_minExecMinutesController.text)
                : null,
        linkCollectionId: unitType == UnitType.links ? _selectedLinkCollectionId : null,
      ),
    );

    Navigator.pop(context);
  }

  String _unitTypeLabel(UnitType type) {
    switch (type) {
      case UnitType.minutes:
        return "Time (minutes)";
      case UnitType.executions:
        return "Executions (times)";
      case UnitType.pages:
        return "Pages";
      case UnitType.links:
        return "Links";
    }
  }

  String _targetLabel(UnitType type) {
    switch (type) {
      case UnitType.executions:
        return "Target executions";
      case UnitType.pages:
        return "Target pages";
      case UnitType.minutes:
        return "Target minutes";
      case UnitType.links:
        return "Target links";
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _customSplitController.dispose();
    _targetCountController.dispose();
    _targetMinutesController.dispose();
    _minExecMinutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Task title'),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<UnitType>(
              value: unitType,
              decoration: const InputDecoration(labelText: 'Task type'),
              items: _unitTypeOptions
                  .map(
                    (t) => DropdownMenuItem(
                      value: t,
                      child: Text(_unitTypeLabel(t)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  unitType = value;
                  selectedSplits.clear();
                  _customSplitController.clear();
                  _targetCountController.clear();
                  _targetMinutesController.clear();
                  _minExecMinutesController.clear();
                  _selectedLinkCollectionId = null;
                });
              },
            ),

            const SizedBox(height: 16),

            if (unitType == UnitType.minutes) ...[
              TextField(
                controller: _targetMinutesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Target minutes'),
              ),

              const SizedBox(height: 12),

              const Text('Possible time splits (minutes)'),

              Wrap(
                spacing: 8,
                children: predefinedSplits.map((s) {
                  return FilterChip(
                    label: Text('$s'),
                    selected: selectedSplits.contains(s),
                    onSelected: (_) => toggleSplit(s),
                  );
                }).toList(),
              ),

              const SizedBox(height: 8),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _customSplitController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Custom'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      final value = int.tryParse(_customSplitController.text);
                      if (value != null && value > 0) {
                        toggleSplit(value);
                        _customSplitController.clear();
                      }
                    },
                  )
                ],
              ),
            ] else ...[
              TextField(
                controller: _targetCountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: _targetLabel(unitType)),
              ),
              if (unitType == UnitType.executions || unitType == UnitType.links) ...[
                SizedBox(height: 12),
                TextField(
                  controller: _minExecMinutesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Min required minutes'),
                ),
              ],
              if (unitType == UnitType.links) ...[
                SizedBox(height: 12),
                Consumer<TaskService>(
                  builder: (_, service, __) {
                    final collections = service.allLinkCollections;
                    return DropdownButtonFormField<String>(
                      value: _selectedLinkCollectionId,
                      decoration: const InputDecoration(labelText: 'Link collection'),
                      items: collections
                          .map(
                            (c) => DropdownMenuItem(
                              value: c.id,
                              child: Text(c.title),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() => _selectedLinkCollectionId = value);
                      },
                    );
                  },
                ),
              ],
            ],

            const Spacer(),

            ElevatedButton(
              onPressed: saveTask,
              child: const Text('Save task'),
            )
          ],
        ),
      ),
    );
  }
}
