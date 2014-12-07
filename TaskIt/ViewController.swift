//
//  ViewController.swift
//  TaskIt
//
//  Created by David Grevink on 2014-11-16.
//  Copyright (c) 2014 David Grevink. All rights reserved.
        //

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var baseArray:[[TaskModel]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let taskArray = [
            TaskModel(task: "Study French", subtask: "Verbs",   date: Date.from(year: 2014, month: 05, day: 20) , completed: true),
            TaskModel(task: "Eat Dinner",   subtask: "Burgers", date: Date.from(year: 2014, month: 03, day: 3)  , completed: true),
            TaskModel(task: "Gym",          subtask: "Leg Day", date: Date.from(year: 2014, month: 12, day: 13) , completed: true)
        ]

        var completedArray = [TaskModel(task:"Code", subtask:"Task Project", date:Date.from(year: 2014, month: 03, day: 3), completed:true)]
        baseArray = [taskArray, completedArray]
        
        // unused now but useful later
        //        tableView.reloadData()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
//        func sortByDate(taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
//            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//        }
//        taskArray = taskArray.sorted(sortByDate)
        
        for index in 0...1 {
            baseArray[index] = baseArray[index].sorted{
                (taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
                return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
            };
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("going to " + segue.identifier!)
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = baseArray[indexPath!.section][indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        if segue.identifier == "addTaskDetail" {
            let detailVC: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            detailVC.mainVC = self
        }
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("addTaskDetail", sender: self)
    }
    
    // UI TableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text         = thisTask.task
        cell.descriptionLabel.text  = thisTask.subtask
        cell.dateLabel.text         = Date.toString(date: thisTask.date)
//        cell.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.4, alpha: 1.0)
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return baseArray.count
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To do"
        }
        else {
            return "Completed"
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let thisTask = baseArray[indexPath.section][indexPath.row]
        var newTask = TaskModel(task: thisTask.task, subtask: thisTask.subtask, date: thisTask.date, completed: !true)
        baseArray[indexPath.section].removeAtIndex(indexPath.row)
        baseArray[1-indexPath.section].append(newTask)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return indexPath.section==0 ? "Complete" : "Uncomplete"
    }
    
    // Helpers
    

    
}

