import QtQuick
import QtCore

Item {
    id: root

    // Signal emitted when tasks are loaded from storage
    signal tasksLoaded(var tasks)

    // Settings component for persistent storage
    Settings {
        id: settings
        category: "Tasks"

        // Store tasks as a JSON string
        property string tasksData: "[]"
        // Store dark mode preference
        property bool darkMode: false
    }

    // Save tasks to storage
    function saveTasks(tasks) {
        try {
            // Convert ListModel data to a proper array
            let taskArray = []
            for (let i = 0; i < tasks.count; i++) {
                let task = tasks.get(i)
                taskArray.push({
                    id: task.id,
                    title: task.title,
                    completed: task.completed
                })
            }

            // Save as JSON string
            settings.tasksData = JSON.stringify(taskArray)
            settings.sync() // Force immediate save

            console.log("Tasks saved to storage:", taskArray.length, "tasks")
        } catch (error) {
            console.error("Error saving tasks:", error)
        }
    }

    // Load tasks from storage
    function loadTasks() {
        try {
            if (settings.tasksData && settings.tasksData !== "[]") {
                let taskArray = JSON.parse(settings.tasksData)
                console.log("Tasks loaded from storage:", taskArray.length, "tasks")
                root.tasksLoaded(taskArray)
                return taskArray
            } else {
                console.log("No saved tasks found, starting with empty list")
                root.tasksLoaded([])
                return []
            }
        } catch (error) {
            console.error("Error loading tasks:", error)
            root.tasksLoaded([])
            return []
        }
    }

    // Save dark mode preference
    function saveDarkMode(darkMode) {
        settings.darkMode = darkMode
        settings.sync()
    }

    // Load dark mode preference
    function loadDarkMode() {
        return settings.darkMode
    }

    // Clear all stored data
    function clearStorage() {
        settings.tasksData = "[]"
        settings.darkMode = false
        settings.sync()
        console.log("Storage cleared")
    }
}
