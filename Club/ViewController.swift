//
//  ViewController.swift
//  hangge_1591
//
//  Created by hangge on 2017/3/12.
//  Copyright © 2017年 hangge.com. All rights reserved.
//

import UIKit

//每月书籍
struct Clubs {
    var catalog: String
    var images: [String]
    var names: [String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let clubs = [
        Clubs(catalog: "推荐社团", images: ["japan.png","flute.png","cy.png","xueshC","pugyC"], names: ["日语协会","笛箫协会","春英诗社","学生会","蒲公英社"]),
        Clubs(catalog: "兴趣类", images: ["dongmC","feiyC","kouqC","shanlC","sissC","flute.png","yuancC"], names: ["动漫协会","飞扬舞协","樱之音社","闪灵舞协","四圣兽社","笛箫协会","原创音协"]),
        Clubs(catalog: "体育类", images: ["taiqdC","wusC"], names: ["跆拳道协会","武术协会"]),
        Clubs(catalog: "学术类", images: ["afC","shaC","whucc","yingyjC","yueyC","japan"], names: ["法语协会","莎士比亚社","计算机协会","英语街","粤语社","日语协会"]),
        Clubs(catalog: "其他高校", images: ["Tsinghua.png","Peking.png","zhejU","xiamU","jiaotU","tongjU","wuhU"], names: ["清华大学","北京大学","浙江大学","厦门大学","交通大学","同济大学","武汉大学"])
    ]
    
    
    //显示内容的tableView
    @IBOutlet weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置tableView代理
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        //去除单元格分隔线
        self.tableView!.separatorStyle = .none
        
        //创建一个重用的单元格
        self.tableView!.register(UINib(nibName:"MyTableViewCell", bundle:nil),
                                 forCellReuseIdentifier:"myCell")
        
        //设置estimatedRowHeight属性默认值
        self.tableView!.estimatedRowHeight = 44.0
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView!.rowHeight = UITableViewAutomaticDimension
    }
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //返回表格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clubs.count
    }
    
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            as! MyTableViewCell
        
        //下面这两个语句一定要添加，否则第一屏显示的collection view尺寸，以及里面的单元格位置会不正确
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        
        //重新加载单元格数据
        cell.reloadData(catalog: clubs[indexPath.row].catalog,
                        images: clubs[indexPath.row].images, names: clubs[indexPath.row].names)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
