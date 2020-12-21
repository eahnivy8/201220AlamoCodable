
import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private let url = "https://jsonplaceholder.typicode.com/posts/1"
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        alamoBasic()
        decodeFast_step3 { (userdata) in
            print(userdata)
        }
        // Do any additional setup after loading the view.
    }
    // 순서를 잘 기억해라.
    func alamoBasic() {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let res):
                guard let res = res as? [AnyHashable: Any] else {
                    return
                }
                guard let title = res["title"] as? String else{
                    return
                }
                guard let id = res["id"] as? Int else {
                    return
                }
                guard let body = res["body"] as? String else {
                    return
                }
                self.label.text = title + "\(id)" + body
            case .failure(let err):
                print(err.localizedDescription)
                
            }
        }
    }
    
    // 알라모파이어로 가장빠르게 decoding하는 방법
    func decodeFast(){
        // URL 주소
        let requestTodos = "https://jsonplaceholder.typicode.com/posts/1"
        // AF.request 변수 저장
        let resp = AF.request(requestTodos)
        
        resp.responseDecodable(of: UserData.self) { resp in
            switch resp.result {
            case .success(let userDatas):
                let id = userDatas.id
                print(id)
            case .failure(let error):
                print(error)
            }
        }
    }
    func decodeFast_step3(handler: (UserData) -> Void) {
        let requestTodos = "https://jsonplaceholder.typicodecom/posts/1"
        let resp = AF.request(requestTodos)
        resp.responseDecodable(of: UserData.self) { resp in
            switch resp.result {
            case .success(let userDatas):
                print("빠른 결과", userDatas)
                handler(userDatas)
            case .failure(let error):
                print(error)
            }
        }
    }
    func alamoBasic_header() {
        let url = "https://jsonplaceholder.typicode.com/posts/1"
        let headers: HTTPHeaders = ["Content-Type":"application/json",
                       "Accept":"application/json"
                        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let res):
                
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


struct UserData: Codable {
    let userId: Int
    let id: Int
    let body: String
    let title: String
}
