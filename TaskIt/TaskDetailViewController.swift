//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by David Grevink on 2014-11-23.
//  Copyright (c) 2014 David Grevink. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!

    
    var detailTaskModel: TaskModel!
    var mainVC: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.taskLabel.text = detailTaskModel!.task
        self.descriptionLabel.text = detailTaskModel!.subtask
        self.datePicker.date = detailTaskModel.date
        println(self.detailTaskModel.task);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        var task = TaskModel(task: taskLabel.text, subtask: descriptionLabel.text, date: datePicker.date, completed: false)
        mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
        self.navigationController?.popViewControllerAnimated(true)
    }

}
