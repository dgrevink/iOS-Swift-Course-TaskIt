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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.taskLabel.text = detailTaskModel!.task
        self.descriptionLabel.text = detailTaskModel!.subtask
        self.datePicker.date = NSDate()
        println(self.detailTaskModel.task);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
