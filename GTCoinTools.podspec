Pod::Spec.new do |s|

  #库名，和文件名一样
  s.name         = "GTCoinTools"

  #tag方式：填tag名称
  #commit方式：填commit的id
  s.version      = "1.0.2"

  #库的简介
  s.summary      = "GTCoinTools"

  #库的描述
  s.description  = "币种模块"
 
  #库的远程仓库地址
  s.homepage     = "https://github.com/cailufei123"

  #版权方式
  s.license = { :type => "MIT", :file => "LICENSE" }

  #库的作者
  s.author             = { "cailufei" => "cailufei123@163.com" }

  #依赖于ios平台上的8.0
  s.platform     = :ios, "9.0"

  #库的地址
  s.source       = { :git => "https://github.com/cailufei123/GTCoinTools.git", :tag => s.version }


 s.xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
 
 #需要包含的源文件 
 s.source_files  =  'GTCoinTools/CoinTools.framework/Headers/*.{h}'

 s.public_header_files = 'GTCoinTools/CoinTools.framework/Headers/*.{h}'


 s.vendored_frameworks = 'GTCoinTools/CoinTools.framework'

 #s.resources = "Resources/*"
 #s.resources = "Classes/Resources/CTAssetsPickerController.bundle"
  s.resource =  'GTCoinTools/CoinTools.framework'
  s.dependency 'Charts'
  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'YYKit'
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.dependency 'MJRefresh'
  s.dependency 'JXCategoryView'
  s.dependency 'SYProgressView'

end




