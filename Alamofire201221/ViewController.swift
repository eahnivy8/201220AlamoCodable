import UIKit
import Alamofire
 
class ViewController: UIViewController {
    /// 실수   1. 잘못된 URL주소   2. 딕셔너리 밸류 값 타입 작성 오류  밸류 타입이 Int인데, String으로 기재. 3. 브레이크포인트 사용오류 4. guard let  세줄로 작성하기
    /*
     {
     "userId": 1,
     "id": 1,
     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
     }
     */
    @IBOutlet weak var label: UILabel!
    private let reqUrl = "https://jsonplaceholder.typicode.com/posts/1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.numberOfLines = 0
        decodeFast_step3 { (userdata) in
            print(userdata)
        }
        //decodeFast()
    }
    func decodeFast_step3(handler: (UserData) -> Void) {
        let requestTodos = "https://jsonplaceholder.typicode.com/posts/1"
        let resp = AF.request(requestTodos)
        resp.responseDecodable(of: UserData.self) { resp in
            switch resp.result {
            case .success(let userDatas):
                print("결과", userDatas)
                handler(userDatas)
            case .failure(let error):
                print(error)
            }
        }
    }
    func decodeFast() {
        let requestTodos = "https://jsonplaceholder.typicode.com/posts/1"
        let resp = AF.request(reqUrl)
        
        resp.responseDecodable(of: UserData.self) { resp in
            switch resp.result {
            case .success(let userDatas):
                let id = userDatas.id
                 print(id)
            //print("매우 빠른 결과:", userDatas)
            case .failure(let error):
                print(error)
            }
        }
    }
    func alamoBasic_header() {
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        
        let headers = ["Content-Type":"application/json",
                       "Accept":"application/json" ]
        
        AF.request(reqUrl,
                   headers: ["Content-Type":"application/json",
                             "Accept":"applicaiton/json" ])
            .responseJSON { (response) in
                switch response.result {
                case .success(let res):
                    print(res)
                    guard let res = res as? [AnyHashable: Any] else {
                        return
                    }
                    guard let title = res["title"] as? String else {
                        return
                    }
                    guard let id = res["id"] as? Int else {
                        return
                    }
                    guard let body = res["body"] as? String else {
                        return
                    }
                    self.label.text = title + " \(id)" + body
                    
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        
        func alamoBasic() {
            AF.request(reqUrl)
                .responseJSON { response in
                    switch response.result {
                    //                case .success(let res):
                    //                    print(res)
                    case .success(let res):
                        //                case .failure(let err):
                        //                    print(err.localizedDescription)
                        guard let res = res as? [AnyHashable: Any] else {
                            return
                        }
                        guard let title = res["title"] as? String else{
                            return
                        }
                        guard let id = res["id"] as? Int else{
                            return
                        }
                        guard let body = res["body"] as? String else
                        {
                            return
                        }
                        self.label.text = title + " \(id)" + body
                        
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
            
            
            func alamoBasic() {
                AF.request(reqUrl)
                    .responseJSON { response in
                        switch response.result {
                        //                case .success(let res):
                        //                    print(res)
                        case .success(let res):
                            //                case .failure(let err):
                            //                    print(err.localizedDescription)
                            guard let res = res as? [AnyHashable: Any] else {
                                return
                            }
                            guard let title = res["title"] as? String else{
                                return
                            }
                            guard let id = res["id"] as? Int else{
                                return
                            }
                            guard let body = res["body"] as? String else
                            {
                                return
                            }
                            self.label.text = title + " \(id)" + body
                            
                        case .failure(let err):
                            print(err.localizedDescription)
                        }
                    }
            }
        }
    }
}
 
struct UserData: Codable {
    let userId: Int
    let id: Int
    let body: String
    let title: String
}

