import QtQuick

Item {
    id: root

    // Signal emitted when storage is initialized and ready
    signal storageInitialized()

    // The actual ListModel for tasks
    property alias model: taskListModel
    property alias count: taskListModel.count

    // Auto-save flag
    property bool autoSave: true

    ListModel {
        id: taskListModel
    }

    // Storage component for persistence
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

    // Auto-save trigger - called after any modification
    function saveToStorage() {
        if (autoSave) {
            storage.saveTasks(taskListModel)
        }
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
            taskListModel.append({
                "title": title.trim(),
                "completed": false,
                "id": generateId()
            })
            saveToStorage()
        }
    }

    // Toggle task completion status
    function toggleTask(index) {
        if (index >= 0 && index < taskListModel.count) {
            taskListModel.setProperty(index, "completed", !taskListModel.get(index).completed)
            saveToStorage()
        }
    }

    // Delete a task
    function deleteTask(index) {
        if (index >= 0 && index < taskListModel.count) {
            taskListModel.remove(index)
            saveToStorage()
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
        for (let i = taskListModel.count - 1; i >= 0; i--) {
            if (taskListModel.get(i).completed) {
                taskListModel.remove(i)
            }
        }
        saveToStorage()
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
        storage.clearStorage()
        taskListModel.clear()
    }

    // Access to storage for dark mode preference
    function saveDarkMode(darkMode) {
        storage.saveDarkMode(darkMode)
    }

    function loadDarkMode() {
        return storage.loadDarkMode()
    }
}
