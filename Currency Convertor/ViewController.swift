import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selectFromCurrencyBtn: UIButton!
    @IBOutlet weak var selectToCurrencyBtn: UIButton!
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyLbl: UILabel!
    @IBOutlet weak var convertBtn: UIButton!
    var currencyConvertRateDict = ["BYN 🇧🇾":2.56,"RUB 🇷🇺":77.4,"EUR 🇪🇺":0.88,"USD 🇺🇸":1.0]
    var fromCurrency = ""
    var toCurrency = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Currency Convertor"
    }

    @IBAction func selectFromCurrencyBtnAxn(_ sender: UIButton) {
        let sheet = UIAlertController(title: "Select From Currency", message: nil, preferredStyle: .actionSheet)
        for key in self.currencyConvertRateDict.keys{
            let action = UIAlertAction(title: key, style: .default) { (action) in
                self.fromCurrency = key
                self.selectFromCurrencyBtn.setTitle(key, for: .normal)
                self.toCurrencyLbl.text = ""
                
            }
            sheet.addAction(action)
        }
        if let popoverPresentationController = sheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = sender.bounds
        }
        self.present(sheet, animated: true, completion: nil)
        
    }
    
    @IBAction func selectToCurrencyBtnAxn(_ sender: UIButton) {
         let sheet = UIAlertController(title: "Select To Currency", message: nil, preferredStyle: .actionSheet)
         for key in self.currencyConvertRateDict.keys{
             let action = UIAlertAction(title: key, style: .default) { (action) in
                 self.toCurrency = key
                 self.selectToCurrencyBtn.setTitle(key, for: .normal)
                self.toCurrencyLbl.text = ""
             }
             sheet.addAction(action)
         }
        if let popoverPresentationController = sheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = sender.bounds
        }
         self.present(sheet, animated: true, completion: nil)
    }
    
    @IBAction func convertBtnAxn(_ sender: Any) {

        //1 USD = 1.35 CAD = 2.65 BYN

//        1 BYN = 1/2.65 USD
//        1 BYN = 0.37 USD
//        1 USD = 75.20 INR
//        1 CAD = 0.74 USD = 0.74 * 75.20 INR = 55.65 INR
        if let fromCurrencyRate = currencyConvertRateDict[fromCurrency], let toCurrencyRate = currencyConvertRateDict[toCurrency], let textFieldVal = fromCurrencyTextField.text, let val: Double = Double(textFieldVal){
            let usdVal = 1.0/fromCurrencyRate
            let toCurrencyVal = usdVal * toCurrencyRate
            let totalVal = val * toCurrencyVal
            self.toCurrencyLbl.text = String(totalVal)
        }
       
        
    }
}

