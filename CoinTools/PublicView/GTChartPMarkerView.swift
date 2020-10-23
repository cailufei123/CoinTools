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
  @objc(GTChartPMarkerViewCalendarPermission)
 public enum AleartType: Int {
         case duoKong = 10
         case baoCang
         case kongHuang
         case chiCang
         case daDan
     }
    
//   @objc open var cycleSelectBlock:(_ models : [Any]) -> NSArray = {_ in }

//    @objc open var cycleSelectBlock:(_ models : [Any]) -> NSArray = {_ in }
//    @objc public enum AleartType
    
//    @objc open var parameterEnclosure:((_ model :String) -> String)?
    @objc open var  cycleSelectBlock = {(index : NSInteger) ->Array<Any> in
    return []
    }
      @objc open var xAxisValueFormatter: IAxisValueFormatter?
     @objc open var models: [GatePublicSelectModel] = [GatePublicSelectModel]()
    @objc open var stylemodels: [[String:Any]] = [[String:Any]]()
    @objc open var possArr: [Any] = [Any]()
    @objc open var lineChartView: LineChartView?
      @objc open var chartsView: CombinedChartView?
      @objc open var selectModels: [GatePublicSelectModel] = [GatePublicSelectModel]()
    @objc open var aleartType = AleartType.duoKong
//     open var aleartTypew  = Bear.Black
//     @objc open var lineChartView: BarLineChartViewBase?
    @IBOutlet  @objc open weak var publicView: GTChartPMarkerPublicView!
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
//        aleartTypew.rawValue;
  
        
        models.removeAll()
        switch aleartType {
            
        case .baoCang:
           
          burstViewAleart(entry: entry)

            break
            
        case .duoKong:
            multiSpaceRatioAlert(entry: entry)
            break
            case .kongHuang:
            twoParameters(entry: entry, firstStr: "BTC价格", lastStr: "贪梦恐慌指数")
            break
        case .chiCang:
           
         holdViewAleart(entry: entry)

            break
         case .daDan:
           
         holdViewAleart(entry: entry)

            break
            
       
        default: break
            
        }
      

}
    
   
   
    
    func getPublicSelectModel(selectEnabled:Bool,color:UIColor,titleText:String) -> GatePublicSelectModel {
        let publicSelectModel:GatePublicSelectModel = GatePublicSelectModel()
        publicSelectModel.color = color
          publicSelectModel.selectEnabled = selectEnabled
          publicSelectModel.titleText = titleText
        return publicSelectModel;
    }
      
}







extension GTChartPMarkerView{
    func multiSpaceRatioAlert(entry: ChartDataEntry)  {//多空比
                     let str = "时间:\(String(self.xAxisValueFormatter!.stringForValue(entry.x, axis: XAxis())))"
                  models.append(getPublicSelectModel(selectEnabled: false, color: UIColor.red, titleText: str))
                  
//                   
////                  let bcoin_btc_vix_data_infoModel:bcoin_coin_long_short_infoModel =  self.possArr[NSInteger(entry.x)] as! bcoin_coin_long_short_infoModel
//                   guard let long_rate =  Double(bcoin_btc_vix_data_infoModel.long_rate) else { return  }
//                 
//
//                  let tt = String(format:"%.2f",long_rate*100)//123.32
//              
//                          let str1 = "开多比例:\(tt)\("%")"
//                 
//                  models.append(getPublicSelectModel(selectEnabled: true, color: selectModels.last?.color ?? UIColor.blue, titleText: str1))
//                  
//                  let str2 =  "\(bcoin_btc_vix_data_infoModel.coin_type)报价:\(bcoin_btc_vix_data_infoModel.offer)"
//                  
//                  models.append(getPublicSelectModel(selectEnabled: true, color: selectModels.first?.color ?? UIColor.blue, titleText: str2))
//                  
//                  publicView.publicSelectModels = models as! [Any];
//                  self.frame = CGRect(x: 0, y: 0,width: 130, height: models.count*20);
//                  self.layoutIfNeeded();
          }
    
    
    func burstViewAleart(entry: ChartDataEntry)  {//BurstStatistics-爆仓统计
           
        let srtingArr = cycleSelectBlock(NSInteger(entry.x))
        let str = "时间:\(String(self.xAxisValueFormatter!.stringForValue(entry.x, axis: XAxis())))"
            models.append(getPublicSelectModel(selectEnabled: false, color: UIColor.red, titleText: str))

       
           
 let buy_amount:[String:Any] =  srtingArr.first as! [String : Any]
          
        
        let str1 = "\(buy_amount["title"] ?? "")"
        
        
     
                 
        models.append(getPublicSelectModel(selectEnabled: true, color:  buy_amount["color"] as! UIColor, titleText: str1))
                
        let sell_amount:[String:Any] =  srtingArr.last as! [String : Any]
        let str2 = "\(sell_amount["title"] ?? "")"
          
            
            models.append(getPublicSelectModel(selectEnabled: true, color:  sell_amount["color"] as! UIColor, titleText: str2))
            
            publicView.publicSelectModels = models as! [Any];
            self.frame = CGRect(x: 0, y: 0,width: 130, height: models.count*20);
            self.layoutIfNeeded();
        
       }
    func twoParameters(entry: ChartDataEntry,firstStr: String,lastStr: String)  {//BurstStatistics-爆仓统计
              
           let srtingArr = cycleSelectBlock(NSInteger(entry.x))
           let str = "时间:\(String(self.xAxisValueFormatter!.stringForValue(entry.x, axis: XAxis())))"
               models.append(getPublicSelectModel(selectEnabled: false, color: UIColor.red, titleText: str))

          
              
    let buy_amount:[String:Any] =  srtingArr.first as! [String : Any]
             
           
           let str1 = "\(firstStr):\(buy_amount["title"] ?? "")"
           
           
        
                    
           models.append(getPublicSelectModel(selectEnabled: true, color:  buy_amount["color"] as! UIColor, titleText: str1))
                   
           let sell_amount:[String:Any] =  srtingArr.last as! [String : Any]
           let str2 = "\(lastStr):\(sell_amount["title"] ?? "")"
             
               
               models.append(getPublicSelectModel(selectEnabled: true, color:  sell_amount["color"] as! UIColor, titleText: str2))
               
               publicView.publicSelectModels = models ;
               self.frame = CGRect(x: 0, y: 0,width: 130, height: models.count*20);
               self.layoutIfNeeded();
           
          }
    
    
    func holdViewAleart(entry: ChartDataEntry)  {
//        let srtingArr = cycleSelectBlock(NSInteger(entry.x))
        let str = "时间:\(String(self.xAxisValueFormatter!.stringForValue(entry.x, axis: XAxis())))"
            models.append(getPublicSelectModel(selectEnabled: false, color: UIColor.red, titleText: str))

          
        for titleDic:[String:Any] in stylemodels {
            models.append(getPublicSelectModel(selectEnabled: true, color:  titleDic["color"] as! UIColor, titleText: titleDic["title"] as! String))
        }
        
     
            
           publicView.publicSelectModels = models ;
            self.frame = CGRect(x: 0, y: 0,width: 130, height: models.count*20);
            self.layoutIfNeeded();
    }
      
}
 
