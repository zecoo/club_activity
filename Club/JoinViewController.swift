//
//  JoinViewController.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/21.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var department: UITextField!
    @IBOutlet weak var birth: UIDatePicker!
    @IBOutlet weak var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.delegate = self
        id.delegate = self
        department.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        id.resignFirstResponder()
        department.resignFirstResponder()
        return true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let alertController = UIAlertController(title: "提示", message: "申请已经提交啦\nヾ(o◕∀◕)ﾉ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        name.text = ""
        id.text = ""
        department.text = ""
    }
    
    func registerUnfinished() {
        let alertController = UIAlertController(title: "提示", message: "某项信息漏填啦\n(｡・`ω´･)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "完善", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        if isTextfieldsEmpty(t1: name, t2: id, t3: department) {
            registerUnfinished()
        } else {
            viewDidDisappear(true)
        }
    }
    
    func isTextfieldsEmpty (t1: UITextField, t2: UITextField, t3: UITextField) -> Bool{
        let length1 = t1.text?.lengthOfBytes(using: String.Encoding.utf8)
        let length2 = t2.text?.lengthOfBytes(using: String.Encoding.utf8)
        let length3 = t3.text?.lengthOfBytes(using: String.Encoding.utf8)
        if length1 == 0 || length2 == 0 || length3 == 0 {
            return true
        } else {
            return false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
