//
//  ActivityDetailViewController.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/21.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {
    
    var image: String = ""
    var activityTitle: String = ""
    var detail: String = ""
    var clubName: String = ""
    var time: String = ""
    var location: String = ""

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var clubNameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageView.layer.cornerRadius = 3
        postImageView.layer.masksToBounds = true
        detailText.layer.cornerRadius = 5
        detailText.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        postImageView.image = UIImage(named: image)
        detailText.text = detail
        titleLbl.text = activityTitle
        clubNameLbl.text = clubName
        timeLbl.text = time
        locationLbl.text = location
    }
    
//    func reloadDetailData(postImage: String, title: String, detail: String){
//        postImageView.image = UIImage(named: postImage)
//        titleLbl.text = title
//        detailText.text = detail
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
