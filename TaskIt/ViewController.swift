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
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        taskArray = [
            TaskModel(task: "Study French", subtask: "Verbs",   date: "01/14/2014"),
            TaskModel(task: "Eat Dinner",   subtask: "Burgers", date: "01/14/2014"),
            TaskModel(task: "Gym",          subtask: "Leg Day", date: "01/14/2014"),
        ]
        
        // unused now but useful later
        //        tableView.reloadData()
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
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        }
    }
    
    // UI TableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let thisTask:TaskModel = taskArray[indexPath.row]
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text         = thisTask.task
        cell.descriptionLabel.text  = thisTask.subtask
        cell.dateLabel.text         = thisTask.date
//        cell.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.4, alpha: 1.0)
        return cell
    }

    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
}

