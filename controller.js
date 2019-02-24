'use strict';

exports.list_all_tasks = function(req, res) {
  res.json({ message: 'Task successfully listed' });
};

exports.create_a_task = function(req, res) {
  res.json({ message: 'Task successfully created' });
};

exports.read_a_task = function(req, res) {
  res.json({ message: 'Task successfully read task ' + req.params.taskId });
};

exports.update_a_task = function(req, res) {
  res.json({ message: 'Task ' + req.params.taskId + ' successfully updated' });
};

exports.delete_a_task = function(req, res) {
  res.json({ message: 'Task ' + req.params.taskId + ' successfully deleted' });
};