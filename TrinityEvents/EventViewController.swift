//
//  EventViewController.swift
//  TrinityEvents
//
//  Created by Jane Appleseed on 5/23/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class EventViewController: UIViewController, UINavigationControllerDelegate {
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
//    @IBOutlet weak var ratingControl: RatingControl!
//    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
        This value is either passed by `EventTableViewController` in `prepareForSegue(_:sender:)`
        or constructed as part of adding a new event.
    */
    var event: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        //nameTextField.delegate = self
        
        // Set up views if editing an existing Event.
        if let event = event {
            navigationItem.title = event.name
//            nameTextField.text   = event.name
            label.text           = event.name
            photoImageView.image = event.photo
            //ratingControl.rating = event.rating
        }
        
        // Enable the Save button only if the text field has a valid Event name.
        //checkValidEventName()
    }
    
    // MARK: UITextFieldDelegate
/*
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //checkValidEventName()
        navigationItem.title = textField.text
    }

    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
//        saveButton.enabled = false
    }
*/
    // MARK: UIImagePickerControllerDelegate
    
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddEventMode = presentingViewController is UINavigationController
        
        if isPresentingInAddEventMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
}

