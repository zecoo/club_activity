//
//  ActivityViewController.swift
//  Club
//
//  Created by 张泽锟 on 2017/7/22.
//  Copyright © 2017年 张泽锟. All rights reserved.
//

import UIKit

var activities = [
    Activity(title: "合气道",detail: "合气道是一门锻炼身心的武术。有时又被称为“动中禅”，是源自日本的一门武术，建基于宇宙和谐的哲理。主要特点是在“以柔克刚”，“借劲使力”，“不主动攻击”。现在一般所称的合气道又分为日本与韩国两种流派，彼此在各自发展之下已有一些差异。", image: "aikidoP", clubName: "武术协会", time: "2017-6-8", location: "风雨操场"),
    Activity(title: "夏日祭",detail: "活动分为庙会摆点和晚会两个部分。\n1.16:00-18:00日式庙会。武大日协负责主要的武大日协负责主要的庙会“门店”摆设。（详见第六条）其他学校日协及武大友协可选择摆设摊点宣传或派工作人员协助武大日协的摊点。\n2.18：30-20:00夏祭晚会。18:30晚会正式开始。晚会包括歌唱、舞蹈等活动，由各校日语协会、武汉大学友协及日本留学生共同呈现。\n3.与其他高校参与社团进行交流沟通，分享社团运行管理的工作经验，提高社团管理水平。", image: "post", clubName: "日语协会", time: "2017-5-20", location: "外国语言文学学院"),
    Activity(title: "一梦笛箫",detail: "今年音乐会的节目编排还是可圈可点的，首先值得肯定的是它沿袭了以往的传统，以自己会员的节目为主，充分展现武大新一代笛箫人的风采；其次一大亮点是首创了民乐的音乐剧，虽然情节简单短小，甚至有点雷人，但也算是实现了上一代前辈的夙愿；再一大亮点是本届演奏队的“横空出世", image: "fluteP", clubName: "笛箫协会", time: "2017-5-20", location: "人文馆"),
    Activity(title: "仲夏夜之梦",detail: "一切卑劣的弱点，在恋爱中都称为无足轻重，而变成美满和庄严。爱情是不用眼睛而用心灵看的，因此生着翅膀的丘比特常被描成盲目；而且爱情的判断全然没有理性，只用翅膀不用眼睛，表现出鲁莽的急性，因此爱神据说是一个孩儿，因为在选择方面他常会弄错。", image: "summerP", clubName: "莎士比亚社", time: "2017-5-13", location: "外国语言文学学院"),
    Activity(title: "法语电影节",detail: "武汉大学首届法语电影节由武汉大学法语系和武汉大学艺术学系联合举办。本届电影节以学生原创的微电影和法语地区选送的法语电影为两大主线，同时设置了“最佳微电影”、“最佳影片”和“最佳男（女)演员”等评选活动。2013年武汉大学法语电影节——视觉暂留 光影初生。", image: "laP", clubName: " 法语协会", time: "2017-3-30", location: "外国语言文学学院"),
    Activity(title: "汉服讲座",detail: "汉服，指的是汉民族的传统服饰，而并非单指汉朝一朝的服饰。其基本特点是褒衣大袖，右衽系带。《易传》里说道，“黄帝、尧舜，垂衣裳而天下治，盖取诸《乾》《坤》”，炎黄是华夏民族的人文初祖，虽不敢说是黄帝创制了衣冠，然其必然也对服饰作出了一定的规范与要求，可以认为上古是汉服真正的起源之时。此前的汉服，称为衣冠，华服。直至清朝入关剃发易服，汉服在主流社会中消失，汉族失落了自己的民族服饰。", image: "hanfuP", clubName: "春英诗社", time: "2017-3-28", location: "新图书总馆"),
    Activity(title: "网球赛", detail: "一、主办单位：武汉大学体育部\n二、比赛赞助：PK体育（冠名），致力于创建优质的体育赛事活动社区。\n同道文化聚会专家（倾情赞助），竭诚为同学聚会提供一站式服务！主要业务包括：创意策划、会场布置、同学联系、吃喝住预定、定制纪念册、文化衫、U盘等等。\n三、比赛时间：2015年5月9-10日，周六团体赛，周日单项赛\n四、比赛地点：武汉大学工学部网球场、桂园网球场 、信息学部网球场\n五、比赛项目\n1. 单项赛：男单、女单\n2. 团体赛：团体赛每个队伍出场顺序为：男单、女单、双打，比赛采取三场两胜制，允许运动员兼项。\n六、参赛资格：武汉大学所有注册在校学生，包括本科生、研究生、博士生、留学生。\n七、报名办法：\n1. 单项赛：以学生个人为单位报名，无需报名费。\n2. 院系团体赛：每个院系出2~5人，无需报名费。\n八、报名时间：即日起至开赛前两天（报名成功后请加QQ群：315965213）", image: "tennisP", clubName: "武大体育部", time: "2017-3-27", location: "信息学部网球场")
]

class ActivityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ActivityTable: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ActivityTable.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        let activity = activities[indexPath.row]
        let postImageView = cell.viewWithTag(10) as! UIImageView
        let titleLbl = cell.viewWithTag(11) as! UILabel
        let detailLbl = cell.viewWithTag(12) as! UILabel
        let favorBtn = cell.viewWithTag(13) as! UIButton
        postImageView.image = UIImage(named: activity.image)
        postImageView.layer.cornerRadius = 3
        postImageView.layer.masksToBounds = true
        postImageView.contentMode = UIViewContentMode.scaleAspectFill
        titleLbl.text = activity.title
        detailLbl.text = activity.detail
        if favorBtn.isSelected ==  true {
            if !favorActivities.contains(activity) {
                favorBtn.isSelected = false
            }
        }
        return cell
    }
    
    @IBAction func favorTapped(_ sender: Any) {
        let btn = sender as! UIButton
        let cell = btn.superView(of:UITableViewCell.self)
        let indexPath = ActivityTable.indexPath(for: cell!)
        let activity = activities[(indexPath?.row)!]
        if btn.isSelected {
            activity.isLiked = false
            btn.isSelected = false
        }else{
            activity.isLiked = true
            favorActivities.append(activity)
            btn.isSelected = true
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ActivityTable.reloadData()
    }
    
    @IBAction func submitClose (segue: UIStoryboardSegue) {
        ActivityTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowActivityDetail"{
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

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activity = activities[indexPath.row]
        let newActicityData = activityData(image: activity.image, title: activity.title, detail: activity.detail, clubName: activity.clubName, time: activity.time, location: activity.location)
        self.performSegue(withIdentifier: "ShowActivityDetail", sender: newActicityData)
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
