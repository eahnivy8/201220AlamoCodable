//
//  ListController.swift
//  Alamofire201221
//
//  Created by SWAhn on 2020/12/23.
//
/// 숙제: 1. 20201223_TableView + CompletionHandler  깃허브에 올리기
///          2.
///
import UIKit

class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var datasource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let url2 = "https://jsonplaceholder.typicode.com/posts"
        Network.fetchApi(url: url2, handler: { (stringArray :[String]) in
            //print("array:", stringArray)
            self.datasource = stringArray
         })
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = datasource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
// 숙제 핸들러 숙지
class Network {
    static func fetchApi(url: String, handler: ([String]) -> Void) {
        let samples = ["aaa", "bbb", "ccc"]
        handler(samples)
    }
    
    
}

class Network2 {
    static func fetchApi(url2: String, handler: ([String]) -> Void) {
        let samples = ["bbb", "ccc", "ddd"]
        handler(samples)
    }
}
// Int 배열클로저를 리턴해주는 함수 생성하기
// String:10개 , Int: 10개
// 테이블뷰 섹션 2개로 할 것.
