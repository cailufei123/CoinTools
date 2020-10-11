//
//  GTChartPMarkerView.swift
//  CoinTools
//
//  Created by 蔡路飞 on 2020/10/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//
//enum methodType {
//    case RequestMethodGet
//    case RequestMethodPost
//}
 
import UIKit
import YYKit
 open class GTChartPMarkerView: MarkerView {
      @objc open var xAxisValueFormatter: IAxisValueFormatter?
     @objc open var models: NSMutableArray = NSMutableArray()
    @objc open var possArr: [Any] = [Any]()
    @objc open var lineChartView: LineChartView?
      @objc open var chartsView: CombinedChartView?
      @objc open var selectModels: [GatePublicSelectModel] = [GatePublicSelectModel]()
    
//     @objc open var lineChartView: BarLineChartViewBase?
    @IBOutlet weak var publicView: GTChartPMarkerPublicView!
    open override func awakeFromNib() {
        super.awakeFromNib()
        publicView.backgroundColor = UIColor .red
        self.autoresizesSubviews = false

      
    }
  
   @objc public static func loadFromNib(_ nibname : String? = nil) -> Self {
//           let loadName = nibname == nil ? "\(self)" : nibname!
 
           return Bundle.main.loadNibNamed("CoinTools.framework/GTChartPMarkerView", owner: nil, options: nil)?.first as! Self
       }
    open override func refreshContent(entry: ChartDataEntry, highlight: Highlight)
       {

     
        models.removeAllObjects()
       let str = "时间:\(String(self.xAxisValueFormatter!.stringForValue(entry.x, axis: XAxis())))"
        models.append(getPublicSelectModel(selectEnabled: false, color: UIColor.red, titleText: str))
        
         
        let bcoin_btc_vix_data_infoModel:bcoin_coin_long_short_infoModel =  self.possArr[NSInteger(entry.x)] as! bcoin_coin_long_short_infoModel
         guard let long_rate =  Double(bcoin_btc_vix_data_infoModel.long_rate) else { return  }
       

        let tt = String(format:"%.2f",long_rate*100)//123.32
        
        
        
                let str1 = "开多比例:\(tt)\("%")"
        
      
      
       
        models.append(getPublicSelectModel(selectEnabled: true, color: selectModels.last?.color ?? UIColor.blue, titleText: str1))
        
        let str2 =  "\(bcoin_btc_vix_data_infoModel.coin_type)报价:\(bcoin_btc_vix_data_infoModel.offer)"
        
        models.append(getPublicSelectModel(selectEnabled: true, color: selectModels.first?.color ?? UIColor.blue, titleText: str2))
        
        publicView.publicSelectModels = models as! [Any];
        self.frame = CGRect(x: 0, y: 0,width: 130, height: models.count*20);
        self.layoutIfNeeded();
//
       }
    
    func getPublicSelectModel(selectEnabled:Bool,color:UIColor,titleText:String) -> GatePublicSelectModel {
        let publicSelectModel:GatePublicSelectModel = GatePublicSelectModel()
        publicSelectModel.color = color
          publicSelectModel.selectEnabled = selectEnabled
          publicSelectModel.titleText = titleText
        return publicSelectModel;
    }
      
}





