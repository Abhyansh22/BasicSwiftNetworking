//
//  POST_Sandbox.swift
//  BasicSwiftNetworking
//
//  Created by GU on 13/04/26.
//

import Foundation
import Playgrounds

#Playground {
    
    //MARK: - Data Model
    
    struct ToDoTask: Codable {
        var id: Int?
        var title: String
        var dueDate: String
        var isComplete: Bool
    }
    
    //Base url
    let baseURLString = "http://localhost:8080/tasks"
    
    //MARK: - GET HTTP Request
    
    func getAllToDoTasks() async throws -> [ToDoTask] {
        let url = URL(string: baseURLString)!
        var (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        
        var myTasks = try JSONDecoder().decode([ToDoTask].self, from: data)
        
        return myTasks
    }
    
    func getOneToDoTask(with id: Int) async throws -> ToDoTask {
        let oneTaksURL = baseURLString + "/\(id)"
        let url = URL(string: oneTaksURL)!
        var (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        
        var myTasks = try JSONDecoder().decode(ToDoTask.self, from: data)
        
        return myTasks
    }
    
    //MARK: - POST
    
    func postTask(title: String, dueDate: String) async throws -> ToDoTask {
        
//        var newTask = ToDoTask(id: nil, title: title, dueDate: dueDate, isComplete: isComplete)
//        var taskToPut = try JSONEncoder().encode(newTask)
        
        let url = URL(string: baseURLString)!
        var myURLRequest = URLRequest(url: url)
        
        //type of request
        myURLRequest.httpMethod = "POST"
        
        //type of http body
        myURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var dictionaryofData = ["title":title, "dueDate": dueDate]
        
        var jsonDataBody = try JSONSerialization.data(withJSONObject: dictionaryofData)
        
        myURLRequest.httpBody = jsonDataBody
        
        var (data, response) = try await URLSession.shared.data(for: myURLRequest)
        print(response)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else{
            print("Error creating to do task")
            throw URLError(.badServerResponse)
        }
        var newTask = try JSONDecoder().decode(ToDoTask.self, from: data)
        print("New task created with id: \(newTask.id, default: "Kuch nahi aaya")")
        
        return newTask
    }
    
    //MARK: update task
    
    func putUpdateTask(id: Int, title: String, dueDate: String, isComplete: Bool) async throws -> ToDoTask {
        
//        var newTask = ToDoTask(id: nil, title: title, dueDate: dueDate, isComplete: isComplete)
//        var taskToPut = try JSONEncoder().encode(newTask)
        
        let updateTaskURL = baseURLString + "/\(id)"
        let url = URL(string: updateTaskURL)!
        var myURLRequest = URLRequest(url: url)
        
        //type of request
        myURLRequest.httpMethod = "PUT"
        
        //type of http body
        myURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var dictionaryofData: [String : Any] = ["title":title,
                                "dueDate": dueDate,
                                "isComplete": isComplete]
        
        
        
        var jsonDataBody = try JSONSerialization.data(withJSONObject: dictionaryofData)
        
        myURLRequest.httpBody = jsonDataBody
        
        var (data, response) = try await URLSession.shared.data(for: myURLRequest)
        print(response)
        
        guard let httpResponse = response as? HTTPURLResponse, (httpResponse.statusCode == 200 || httpResponse.statusCode == 400) else{
            print("Error creating to do task")
            throw URLError(.badServerResponse)
        }
        var updatedTask = try JSONDecoder().decode(ToDoTask.self, from: data)
        print("Task updated with id: \(updatedTask.id, default: "Kuch nahi aaya")")
        
        return updatedTask
    }
    
    func deleteTask(id: Int) async throws {
        
//        var newTask = ToDoTask(id: nil, title: title, dueDate: dueDate, isComplete: isComplete)
//        var taskToPut = try JSONEncoder().encode(newTask)
        
        let updateTaskURL = baseURLString + "/\(id)"
        let url = URL(string: updateTaskURL)!
        var myURLRequest = URLRequest(url: url)
        
        //type of request
        myURLRequest.httpMethod = "DELETE"
        
        //type of http body
//        myURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        var dictionaryofData: [String : Any] = ["title":title,
//                                "dueDate": dueDate,
//                                "isComplete": isComplete]
        
        
        
//        var jsonDataBody = try JSONSerialization.data(withJSONObject: dictionaryofData)
        
        //myURLRequest.httpBody = jsonDataBody
        
        var (data, response) = try await URLSession.shared.data(for: myURLRequest)
        print(response)
        
        guard let httpResponse = response as? HTTPURLResponse, (httpResponse.statusCode == 204 /*|| httpResponse.statusCode == 400*/) else{
            print("Error creating to do task")
            throw URLError(.badServerResponse)
        }
        var deletedTask = try JSONDecoder().decode(ToDoTask.self, from: data)
        print("Task deleted with id: \(deletedTask.id, default: "Kuch nahi aaya")")
        
        //return updatedTask
    }
    
    
    
    
    //MARK: return all tasks
//    Task{
//        do{
//            var someInitialTasks = try await getAllToDoTasks()
//            for myTask in someInitialTasks{
//                print("Taks: \(myTask.id): \(myTask.title)")
//            }
//        }catch{
//            print("Error thrown: \(error.localizedDescription)")
//        }
//    }
    
    
    //MARK: return single task with corresponding id
//    Task{
//        do{
//            var someInitialTask = try await getOneToDoTask(with: 1)
//                print("Taks: \(someInitialTask.id): \(someInitialTask.title)")
//        }catch{
//            print("Error thrown: \(error.localizedDescription)")
//        }
//    }
//
    
    //MARK: post new task
//    Task{
//        do{
//            var createdTask =  try await postTask(title: "Play Guitar", dueDate: "2026-04-24")
//            print(createdTask)
//        }catch{
//            print("Error thrown: \(error.localizedDescription)")
//        }
//    }
    
    //MARK: update existing task
//    Task{
//        do{
//            var updatedTask =  try await putUpdateTask(id: 3, title: "Finish Swift homework", dueDate: "2026-03-14", isComplete: false)
//            print(updatedTask)
//        }catch{
//            print("Error thrown: \(error.localizedDescription)")
//        }
//    }
    
    //MARK: deleteTask
    Task{
        do{
            try await deleteTask(id: 2)
            print("Task Deleted")
        }catch{
            print("Error thrown: \(error.localizedDescription)")
        }
    }
}
