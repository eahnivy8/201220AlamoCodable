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
    var datasource2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url2 = "https://jsonplaceholder.typicode.com/posts"
        Network.fetchApi(url: url2, handler: { (stringArray :[String]) in
            //print("array:", stringArray)
            self.datasource = stringArray
         })
        Network2.fetchApi(url: url2, handler: { (intArray :[Int]) in
            // Int 배열을 String 배열로 변환해서 datasource2 에 대입
            self.datasource2 = intArray.map{ "\($0)" }
        })
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
            if indexPath.section == 0 {
                cell.textLabel?.text = datasource[indexPath.row]
                return cell
        } else {
            cell.textLabel?.text = datasource2[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
// 숙제 핸들러 숙지
class Network {
    static func fetchApi(url: String, handler: ([String]) -> Void) {
        let samples = ["aaa", "bbb", "ccc", "ddd", "eee"]
        handler(samples)
    }
    
    
}

class Network2 {
    static func fetchApi(url: String, handler: ([Int]) -> Void) {
        let samples = [1, 2, 3, 4, 5]
        handler(samples)
    }
}
// Int 배열클로저를 리턴해주는 함수 생성하기
// String:10개 , Int: 10개
// 테이블뷰 섹션 2개로 할 것.

// 사람이름 5개 배열 만들 것. 누구님 안녕하세요. 출력하는 것.
// completionHandler

// 2. 사람이름 5개 배열. 학생 50점, 40점, 60점 출력하게끔. 각각 테이블뷰 리스트
