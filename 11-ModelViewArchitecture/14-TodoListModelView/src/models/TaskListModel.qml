import QtQuick

ListModel {
    id: root

    // Add some sample tasks for testing
    Component.onCompleted: {
        addTask("Learn Qt QML")
        addTask("Build a todo app")
        addTask("Practice QML components")
    }

    // Add a new task
    function addTask(title) {
        if (title && title.trim().length > 0) {
            append({
                "title": title.trim(),
                "completed": false,
                "id": generateId()
            })
        }
    }

    // Toggle task completion status
    function toggleTask(index) {
        if (index >= 0 && index < count) {
            setProperty(index, "completed", !get(index).completed)
        }
    }

    // Delete a task
    function deleteTask(index) {
        if (index >= 0 && index < count) {
            remove(index)
        }
    }

    // Delete task by ID
    function deleteTaskById(taskId) {
        for (let i = 0; i < count; i++) {
            if (get(i).id === taskId) {
                remove(i)
                break
            }
        }
    }

    // Clear all completed tasks
    function clearCompletedTasks() {
        for (let i = count - 1; i >= 0; i--) {
            if (get(i).completed) {
                remove(i)
            }
        }
    }

    // Get statistics
    function getStats() {
        let total = count
        let completed = 0

        for (let i = 0; i < count; i++) {
            if (get(i).completed) {
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
        for (let i = 0; i < count; i++) {
            if (get(i).completed) {
                return true
            }
        }
        return false
    }

    // Generate a unique ID for tasks
    function generateId() {
        return Date.now() + Math.random().toString(36).substr(2, 9)
    }
}
