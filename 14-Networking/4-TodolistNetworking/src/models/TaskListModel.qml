import QtQuick

Item {
    id: root

    // Signal emitted when storage is initialized and ready
    signal storageInitialized()

    // Signal emitted when settings are loaded
    signal settingsLoaded(bool darkMode)

    // The actual ListModel for tasks
    property alias model: taskListModel
    property alias count: taskListModel.count

    // Auto-save flag
    property bool autoSave: true

    ListModel {
        id: taskListModel
    }


    RestStorage{
        id: storage

        onTasksLoaded: function(tasks) {
            root.loadTasksFromArray(tasks)
        }


        onTaskCreated: function(task) {
            // Add the newly created task to the model - filter out unsupported fields
            taskListModel.append({
                "id": task.id,
                "title": task.title,
                "completed": task.completed || false
                // Note: We don't include createdAt, updatedAt as they're not needed in the UI
            })
        }

        onTaskUpdated: function(task) {
            // Update the task in the model - only update the fields we need
            for (let i = 0; i < taskListModel.count; i++) {
                if (taskListModel.get(i).id === task.id) {
                    // Only set the properties that exist in our model
                    if (task.title !== undefined) {
                        taskListModel.setProperty(i, "title", task.title)
                    }
                    if (task.completed !== undefined) {
                        taskListModel.setProperty(i, "completed", task.completed)
                    }
                    break
                }
            }
        }


        onTaskDeleted: function(taskId) {
            // Remove the task from the model
            for (let i = 0; i < taskListModel.count; i++) {
                if (taskListModel.get(i).id === taskId) {
                    taskListModel.remove(i)
                    break
                }
            }
        }

        onSettingsLoaded: function(settings) {
            console.log("Settings loaded:", JSON.stringify(settings))
            // Emit signal with dark mode value
            root.settingsLoaded(settings.darkMode || false)
        }

        onSettingsUpdated: function(settings) {
            console.log("Settings updated:", JSON.stringify(settings))
            // Settings have been successfully updated
        }


        Component.onCompleted: {
            //Emit signal that storage is read
            root.storageInitialized()

            //Load existing tasks from REST API
            storage.loadTasks()
        }
    }

    // Storage component for persistence
    /*
    TaskStorage {
        id: storage

        onTasksLoaded: function(tasks) {
            root.loadTasksFromArray(tasks)
        }

        Component.onCompleted: {
            // Emit signal that storage is ready
            root.storageInitialized()

            // Load existing tasks
            let savedTasks = loadTasks()
            if (savedTasks.length === 0) {
                // Add some sample tasks only if no saved tasks exist
                root.addTask("Learn Qt QML")
                root.addTask("Build a todo app")
                root.addTask("Practice QML components")
            }
        }
    }
    */

    // Auto-save trigger - called after any modification
    function saveToStorage() {
        /*
        if (autoSave) {
            storage.saveTasks(taskListModel)
        }
        */
    }

    // Load tasks from an array (used by storage)
    function loadTasksFromArray(taskArray) {
        taskListModel.clear()
        for (let i = 0; i < taskArray.length; i++) {
            let task = taskArray[i]
            taskListModel.append({
                "id": task.id || generateId(),
                "title": task.title || "",
                "completed": task.completed || false
            })
        }
    }

    // Add a new task
    function addTask(title) {
        if (title && title.trim().length > 0) {
            // Use REST API to create task
            storage.createTask(title.trim())
            // The task will be added to the model via onTaskCreated signal

            /*
            taskListModel.append({
                "title": title.trim(),
                "completed": false,
                "id": generateId()
            })
            saveToStorage()
            */
        }
    }

    // Toggle task completion status
    function toggleTask(index) {
        if (index >= 0 && index < taskListModel.count) {

            let task = taskListModel.get(index)
            let newCompleted = !task.completed

            // Update via REST API
            storage.updateTask(task.id, { completed: newCompleted })
            // The model will be updated via onTaskUpdated signal



            /*
            taskListModel.setProperty(index, "completed", !taskListModel.get(index).completed)
            saveToStorage()
            */
        }
    }

    // Delete a task
    function deleteTask(index) {
        if (index >= 0 && index < taskListModel.count) {

            let task = taskListModel.get(index)
            // Delete via REST API
            storage.deleteTask(task.id)
            // The task will be removed from the model via onTaskDeleted signal




            /*
            taskListModel.remove(index)
            saveToStorage()
            */
        }
    }

    // Delete task by ID
    function deleteTaskById(taskId) {
        for (let i = 0; i < taskListModel.count; i++) {
            if (taskListModel.get(i).id === taskId) {
                taskListModel.remove(i)
                saveToStorage()
                break
            }
        }
    }

    // Clear all completed tasks
    function clearCompletedTasks() {

        // Get all completed task IDs and delete them via REST API
        let completedTasks = []
        let i
        for (i = 0; i < taskListModel.count; i++) {
            if (taskListModel.get(i).completed) {
                completedTasks.push(taskListModel.get(i).id)
            }
        }

        // Delete each completed task via REST API
        for (i = 0; i < completedTasks.length; i++) {
            storage.deleteTask(completedTasks[i])
        }
        // Tasks will be removed from the model via onTaskDeleted signals


        /*
        for (let i = taskListModel.count - 1; i >= 0; i--) {
            if (taskListModel.get(i).completed) {
                taskListModel.remove(i)
            }
        }
        saveToStorage()
        */
    }

    // Get statistics
    function getStats() {
        let total = taskListModel.count
        let completed = 0

        for (let i = 0; i < taskListModel.count; i++) {
            if (taskListModel.get(i).completed) {
                completed++
            }
        }

        return {
            "total": total,
            "completed": completed,
            "remaining": total - completed
        }
    }

    // Check if there are any completed tasks
    function hasCompletedTasks() {
        for (let i = 0; i < taskListModel.count; i++) {
            if (taskListModel.get(i).completed) {
                return true
            }
        }
        return false
    }

    // Get item at index
    function get(index) {
        return taskListModel.get(index)
    }

    // Generate a unique ID for tasks
    function generateId() {
        return Date.now() + Math.random().toString(36).substr(2, 9)
    }

    // Storage utility functions
    function clearAllData() {
        /*
        storage.clearStorage()
        taskListModel.clear()
        */
    }

    // Access to storage for dark mode preference
    function saveDarkMode(darkMode) {

        storage.updateSettings({ darkMode: darkMode })
        /*
        storage.saveDarkMode(darkMode)
        */
    }

    function loadDarkMode() {

        storage.loadSettings()
        /*
        return storage.loadDarkMode()
        */
        //return false
    }
}
