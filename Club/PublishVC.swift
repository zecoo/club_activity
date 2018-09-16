//
//  PublishVC.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/13.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

class PublishVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var titleItem: UITextField!
    @IBOutlet weak var detailItem: UITextView!
    @IBOutlet weak var maskView: UIView!
    @IBOutlet weak var postImageBtn: UIButton!
    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var locationText: UITextField!
    
    var activityTitle: String = "活动名称"
    var time: String = "2017-7-22"
    var location: String = "WHU-ISS"
    var detail: String = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    var newActivity: Activity?
    var imagePath: String = ""
    
    @IBAction func confirmTapped(_ sender: Any) {
        titleItem.resignFirstResponder()
        detailItem.resignFirstResponder()
    }
    
    @IBAction func publishTapped(_ sender: Any) {
        print("publishTapped")
        if !textfieldEmpty(t1: titleItem){
            activityTitle = titleItem.text!}
        if !textfieldEmpty(t1: timeText){
            time = timeText.text!}
        if detailItem.text.lengthOfBytes(using: String.Encoding.utf8) != 0 {
            detail = detailItem.text}
        if !textfieldEmpty(t1: locationText){
            location = locationText.text!}
        if imagePath == ""{
        imagePath = "defaultP"}
        let newActivity = Activity(title: activityTitle, detail: detail, image: imagePath, clubName: "日语协会", time: time, location: location)
        activities.append(newActivity)
    }
    
    func textfieldEmpty (t1: UITextField) -> Bool{
        let length1 = t1.text?.lengthOfBytes(using: String.Encoding.utf8)
        if length1 == 0  {
            return true
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleItem {
            detailItem.becomeFirstResponder()
        }
        return true
    }
    
    @IBAction func fromAlbum(_ sender: AnyObject) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //设置是否允许编辑
            picker.allowsEditing = true
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    
    func setImage(image: UIImage) {
        let data: Data = UIImagePNGRepresentation(image)!
        let tmpDir = NSHomeDirectory() + "/tmp"
        print(imagePath)
        let uuid: UUID = UUID.init()
        self.imagePath = tmpDir.appending("/\(uuid).png")
        let fm: FileManager = FileManager.default
        fm.createFile(atPath: self.imagePath, contents: data, attributes: nil)
    }
    
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        image = info[UIImagePickerControllerEditedImage] as! UIImage
        setImage(image: image)
        postImageBtn.setBackgroundImage(image, for: .normal)
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maskView.layer.cornerRadius = 5
        maskView.layer.masksToBounds = true
        postImageBtn.layer.cornerRadius = 3
        postImageBtn.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        titleItem.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
