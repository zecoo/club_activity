//
//  FavorViewController.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/18.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit
import Masonry

struct activityData {
    let image: String
    let title: String
    let detail: String
    let clubName: String
    let time: String
    let location: String
}

var favorActivities = [Activity]()

class FavorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var activitiesTable: UITableView!
    @IBOutlet weak var nicknameLbl: UILabel!
    @IBOutlet weak var inClubLbl: UILabel!
    @IBOutlet weak var avtorBtn: UIButton!
    
    var imagePath: String = ""
    
    var ewenTextView:EwenTextView!
    let kScreenBounds = UIScreen.main.bounds
    var kScreenwidth:CGFloat!
    var kScreenheight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for activity in activities {
            if activity.isLiked == true {
                if favorActivities.contains(activity) == false {
                    favorActivities.append(activity)
                }
            }
        }
        
        nicknameLbl.text = "22Kon"
        inClubLbl.text = "日语协会"
        
        avtorBtn.setImage(#imageLiteral(resourceName: "defaultA"), for: .normal)
        avtorBtn.layer.cornerRadius = avtorBtn.layer.frame.size.width/2
        avtorBtn.layer.masksToBounds = true
        
        
        self.activitiesTable.dataSource = self
        self.activitiesTable.delegate = self
        self.activitiesTable.register(UINib.init(nibName: "FavorTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        // Do any additional setup after loading the view.
        
        kScreenwidth = kScreenBounds.size.width
        kScreenheight = kScreenBounds.size.height
        
        self.activitiesTable.estimatedRowHeight = 100
        self.activitiesTable.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorActivities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = activitiesTable.dequeueReusableCell(withIdentifier: "myCell") as! FavorTableViewCell
        
        cell.frame = activitiesTable.bounds
        cell.layoutIfNeeded()
        
        let activity = favorActivities[indexPath.row]
        let commentBtn: UIButton = UIButton()
        commentBtn.frame = CGRect(x: 268, y: 75, width: 15, height: 15)
        commentBtn.tag = 233
        commentBtn.addTarget(self, action: #selector(btnTapped(_:)), for: UIControlEvents.touchUpInside)
        commentBtn.setImage(#imageLiteral(resourceName: "commit"), for: UIControlState.normal)
        
        let shareBtn: UIButton = UIButton()
        shareBtn.frame = CGRect(x: 290, y: 75, width: 15, height: 15)
        shareBtn.tag = 222
        shareBtn.addTarget(self, action: #selector(btnTapped(_:)), for: UIControlEvents.touchUpInside)
        shareBtn.setImage(#imageLiteral(resourceName: "share"), for: UIControlState.normal)
        
        cell.addSubview(commentBtn)
        cell.addSubview(shareBtn)
        cell.reloadBasicData(image: activity.image, title: activity.title, detail: activity.detail)
        cell.reloadCommentData(comments: activity.comments)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = (favorActivities[indexPath.row].comments.count) * 15 + 100
        return CGFloat(cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let acticity = favorActivities[indexPath.row]
        let newActicityData = activityData(image: acticity.image, title: acticity.title, detail: acticity.detail, clubName: acticity.clubName, time: acticity.time, location: acticity.location)
        self.performSegue(withIdentifier: "ShowFavorDetail", sender: newActicityData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFavorDetail"{
            let detailVC = segue.destination as! ActivityDetailViewController
            let data = sender as! activityData
            
            // 不能直接这样做 detailVC.titleLbl.text = "test"
            detailVC.image = data.image
            detailVC.activityTitle = data.title
            detailVC.detail = data.detail
            detailVC.clubName = data.clubName
            detailVC.time = data.time
            detailVC.location = data.location
        }
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
        avtorBtn.setImage(image, for: .normal)
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        let btn = sender as! UIButton
        let cell = btn.superView(of:UITableViewCell.self)
        let indexPath = activitiesTable.indexPath(for: cell!)
        switch btn.tag {
        case 233:
            print("btn in section tapped")
            self.view.addSubview(self.TextView(indexPath: indexPath!))
        case 222:
            self.viewDidDisappear1(true)
        default:
            print("default")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        activitiesTable.reloadData()
    }
    
    // delete row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            favorActivities.remove(at: indexPath.row)
            self.activitiesTable.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    // Set Edit Mode
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.activitiesTable.setEditing(editing, animated: animated)
    }
    
    
    func TextView(indexPath: IndexPath) -> EwenTextView {
        
        self.ewenTextView = EwenTextView(frame: CGRect(x:0, y:kScreenheight - 100, width:kScreenwidth, height:100))
        self.ewenTextView.backgroundColor = UIColor(white: 0, alpha: 0.3)
        self.ewenTextView.setPlaceholderText("请输入文字")
        self.ewenTextView.ewenTextViewBlock = {(test) -> Void in
            /*输入的内容在上方显示*/
            let activity: Activity = favorActivities[indexPath.row]
            print("In VC :\(indexPath)")
            print(test!)
            activity.comments.append(test!)
            self.activitiesTable.reloadData()
            /*移除*/
            // self.TextView().removeFromSuperview()
        }
        return ewenTextView
    }
    
    func viewDidDisappear1(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let alertController = UIAlertController(title: "分享", message: "将活动分享至", preferredStyle: .actionSheet)
        let wechatAction = UIAlertAction(title: "微信", style: .default, handler: nil)
        let weiboAction = UIAlertAction(title: "微博", style: .default, handler: nil)
        let qqAction = UIAlertAction(title: "QQ", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(wechatAction)
        alertController.addAction(weiboAction)
        alertController.addAction(qqAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func shareTo() {
        print("分享至")
    }
    
}

extension UIView {
    //返回该view所在的父view
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father
            }
        }
        return nil
    }
}

