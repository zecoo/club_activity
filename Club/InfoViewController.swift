//
//  InfoViewController.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/21.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var image = "japan"
    var clubName = "武汉大学日语协会"
    

    @IBOutlet weak var badgeImageView: UIImageView!
    @IBOutlet weak var clubNameLbl: UILabel!
    @IBOutlet weak var detailTextField: UITextView!
    @IBOutlet weak var joinBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        badgeImageView.image = UIImage(named: image)
        clubNameLbl.text = clubName
    
        // Do any additional setup after loading the view.
        badgeImageView.contentMode = UIViewContentMode.scaleToFill
    }
    
    func reloadInfoData(image: String, clubName: String, detail: String){
        badgeImageView.image = UIImage(named: image)
        clubNameLbl.text = clubName
        detailTextField.text = detail
    }

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
