
import UIKit

class InputInfo1ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var colleges:[String] = ["1","2","3"]
    var departments:[String] = []
    var years:[String] = ["13","14","15","16","17","18","19"]
    
    var inputTitle = ["이름", "단과대학", "전공", "학번"]
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBAction func photoEdit(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func nextStep() {
        if nameTextField.text != nil, collegeTextField.text != nil, departmentTextField.text != nil, yearTextField.text != nil {
            
            myInfo = User(name: nameTextField.text!, college: collegeTextField.text!, department: departmentTextField.text!, admissionYear: Int(yearTextField.text!)!)
            
            if !saveUserData() { return }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameTextField.layer.cornerRadius = 7
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
//        collegeTextField.layer.cornerRadius = 7
        collegeTextField.layer.borderWidth = 1
        collegeTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
//        departmentTextField.layer.cornerRadius = 7
        departmentTextField.layer.borderWidth = 1
        departmentTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
//        yearTextField.layer.cornerRadius = 7
        yearTextField.layer.borderWidth = 1
        yearTextField.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
        
        if !loadCollegeData() { return }
        if !loadDepartmentData() { return }
        
        colleges = collegeList.map{$0.name}
        print(colleges)
        
        pickerSetting()
    }
    
    func pickerSetting() {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .orange
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action:  #selector(InputInfo1ViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(InputInfo1ViewController.donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        let collegePickerView = UIPickerView()
        collegePickerView.delegate = self
        collegeTextField.inputView = collegePickerView
        collegePickerView.tag = 0
        
        collegePickerView.showsSelectionIndicator = true
        
        collegeTextField.inputAccessoryView = toolBar
        
        let departmentPickerView = UIPickerView()
        departmentPickerView.delegate = self
        departmentTextField.inputView = departmentPickerView
        departmentPickerView.tag = 1
        
        departmentPickerView.showsSelectionIndicator = true
        
        departmentTextField.inputAccessoryView = toolBar
        
        let yearPickerView = UIPickerView()
        yearPickerView.delegate = self
        yearTextField.inputView = yearPickerView
        yearPickerView.tag = 2
        
        yearPickerView.showsSelectionIndicator = true
        
        yearTextField.inputAccessoryView = toolBar
    }
    
    @objc func donePicker() {
        collegeTextField.resignFirstResponder()
        departmentTextField.resignFirstResponder()
        yearTextField.resignFirstResponder()
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 { return colleges.count }
        else if pickerView.tag == 1 { return departments.count }
        else { return years.count }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 { return colleges[row] }
        else if pickerView.tag == 1 { return departments[row] }
        else { return years[row] }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            collegeTextField.text = colleges[row]
            departments = departmentList.filter{$0.college == colleges[row]}.map{$0.name}
            print(departments)
        }
        else if pickerView.tag == 1 { departmentTextField.text = departments[row] }
        else { yearTextField.text = years[row] }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
