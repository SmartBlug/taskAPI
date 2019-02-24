'use strict';

module.exports = function(app) {
  var taskAPI = require('./controller');

  // todoList Routes
  app.route('/tasks')
    .get(taskAPI.list_all_tasks)
    .post(taskAPI.create_a_task);


  app.route('/tasks/:taskId')
    .get(taskAPI.read_a_task)
    .put(taskAPI.update_a_task)
    .delete(taskAPI.delete_a_task);
};