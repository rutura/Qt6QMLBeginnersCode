import QtQuick

Item{
    id: root

    // Base URL for the REST API
    readonly property string baseUrl: "http://localhost:3000"

    // Signals
    signal tasksLoaded(var tasks)
    signal taskCreated(var task)
    signal taskUpdated(var task)
    signal taskDeleted(string taskId)
    signal settingsLoaded(var settings)
    signal settingsUpdated(var settings)
    signal error(string message)


    Component.onCompleted: {
        // Test connection on startup
        checkConnection()
    }

    // Check if API is available
    function checkConnection() {
        performRequest("GET", "/health", null, function(response) {
            console.log("API connection established")
        }, function(error) {
            console.error("API connection failed:", error)
            root.error("Cannot connect to API server at " + baseUrl)
        })
    }

    // Load all tasks from the API
    function loadTasks() {
        performRequest("GET", "/api/tasks", null, function(response) {
            try {
                let data = JSON.parse(response)
                let tasks = data.data || []
                console.log("Tasks loaded from API:", tasks.length, "tasks")
                root.tasksLoaded(tasks)
            } catch (e) {
                console.error("Error parsing tasks response:", e)
                root.error("Failed to parse tasks data")
            }
        }, function(error) {
            console.error("Error loading tasks:", error)
            root.error("Failed to load tasks from server")
        })
    }

    // Create a new task
    function createTask(title) {
        if (!title || title.trim().length === 0) {
            root.error("Task title cannot be empty")
            return
        }

        let taskData = {
            title: title.trim()
        }

        performRequest("POST", "/api/tasks", taskData, function(response) {
            try {
                let data = JSON.parse(response)
                let task = data.data
                console.log("Task created:", task.title)
                root.taskCreated(task)
            } catch (e) {
                console.error("Error parsing create task response:", e)
                root.error("Failed to parse server response")
            }
        }, function(error) {
            console.error("Error creating task:", error)
            root.error("Failed to create task")
        })
    }

    // Update an existing task
    function updateTask(taskId, updates) {
        if (!taskId) {
            root.error("Task ID is required for update")
            return
        }

        performRequest("PUT", "/api/tasks/" + taskId, updates, function(response) {
            try {
                let data = JSON.parse(response)
                let task = data.data
                console.log("Task updated:", task.id)
                root.taskUpdated(task)
            } catch (e) {
                console.error("Error parsing update task response:", e)
                root.error("Failed to parse server response")
            }
        }, function(error) {
            console.error("Error updating task:", error)
            root.error("Failed to update task")
        })
    }

    // Delete a task
    function deleteTask(taskId) {
        if (!taskId) {
            root.error("Task ID is required for deletion")
            return
        }

        performRequest("DELETE", "/api/tasks/" + taskId, null, function(response) {
            console.log("Task deleted:", taskId)
            root.taskDeleted(taskId)
        }, function(error) {
            console.error("Error deleting task:", error)
            root.error("Failed to delete task")
        })
    }



    // Generic HTTP request function
    function performRequest(method, endpoint, data, successCallback, errorCallback) {
        // Create XMLHttpRequest object
        var xhr = new XMLHttpRequest()
        let url = baseUrl + endpoint

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status >= 200 && xhr.status < 300) {
                    if (successCallback) {
                        successCallback(xhr.responseText)
                    }
                } else {
                    let errorMessage = "HTTP " + xhr.status
                    try {
                        let errorData = JSON.parse(xhr.responseText)
                        errorMessage = errorData.error || errorMessage
                    } catch (e) {
                        // Use default error message
                    }
                    if (errorCallback) {
                        errorCallback(errorMessage)
                    }
                }
            }
        }

        xhr.open(method, url, true)
        xhr.setRequestHeader("Content-Type", "application/json")

        if (data) {
            xhr.send(JSON.stringify(data))
        } else {
            xhr.send()
        }
    }
}
