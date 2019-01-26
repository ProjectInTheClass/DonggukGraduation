//
//  MyClassViewController.swift
//  DonggukGraduation
//
//  Created by linc on 21/01/2019.
//  Copyright © 2019 linc. All rights reserved.
//

import UIKit

class MyClassViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var PhotoImage: UIImageView!
    
    @IBAction func PhotoEdit(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
     var pickOption1 = [["경영대학","법학대학","사회과학대학"],["경영정보학과", "법학과", "컴퓨터공학과"] ]
     var pickOption2 = ["12학번", "13학번", "14학번", "15학번", "16힉번", "17학번"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let pickerView1 = UIPickerView()
        pickerView1.delegate = self
        collegePickerTextField.inputView = pickerView1
        pickerView1.tag = 0
        
        
        let pickerView2 = UIPickerView()
        pickerView2.delegate = self
        levelPickerTextField.inputView = pickerView2
        pickerView2.tag = 1
    }
   
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if (pickerView.tag == 0) {
            return pickOption1.count
        }
        else{ return 1 }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return pickOption1[component].count
        } else if (pickerView.tag == 1) {
            return pickOption2.count
        }
        return pickOption1[component].count
       
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 0) {
            return pickOption1[component][row]
            
        } else if(pickerView.tag == 1) {
            return pickOption2[row]
        } else {return nil}
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView.tag == 0) {
        
        let color = pickOption1[0][pickerView.selectedRow(inComponent: 0)]
       
        let model = pickOption1[1][pickerView.selectedRow(inComponent: 1)]
   
            collegePickerTextField.text = color + " " + model}
        else {levelPickerTextField.text = pickOption2[row] }
    }

    @IBOutlet weak var levelPickerTextField: UITextField!
 
    @IBOutlet weak var collegePickerTextField: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// 프로필 변경
    
    
}

