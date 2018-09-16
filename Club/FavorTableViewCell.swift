//
//  FavorTableViewCell.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/18.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit
import Masonry

class FavorTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var commentsTable: UITableView!
    
    @IBOutlet weak var commentsTableHeight: NSLayoutConstraint!
    
    
    var comments: [String] = []
    var tableHeight: CGFloat = 15
    
    //@IBOutlet weak var tableViewHeight: NSLayoutConstraint
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.commentsTable.dataSource = self
        self.commentsTable.delegate = self
        postImg.layer.cornerRadius = 3
        postImg.layer.masksToBounds = true
        self.commentsTable.register(UINib.init(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "commentCell")
        
        commentsTable.estimatedRowHeight = 15
        commentsTable.rowHeight = UITableViewAutomaticDimension
        // Initialization code
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return self.comments.count
    }
    
    func getTableHeight() -> CGFloat{
        return self.tableHeight
    }
    
    func reloadBasicData(image: String,title: String, detail: String){
        if UIImage(named: image) == nil {
            self.postImg.image = UIImage.init(contentsOfFile: image)
        } else {
            self.postImg.image = UIImage(named: image)
        }
        self.titleLbl.text = title
        self.detailLbl.text = detail
    }
    
    
    func reloadCommentData (comments: [String]){
        self.comments = comments
        commentsTable.reloadData()
        self.tableHeight = 15 * CGFloat(self.comments.count)
        commentsTableHeight.constant = self.tableHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.commentsTable.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        print("in Cell: \(indexPath)")
        print(self.comments)
        cell.commentLbl.text = self.comments[indexPath.section]
        return cell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
