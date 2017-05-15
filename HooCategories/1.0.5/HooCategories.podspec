Pod::Spec.new do |s|
  s.name             = "HooCategories"
  s.version          = "1.0.5"
  s.summary          = "Common Categories Tools"
  s.homepage         = "https://github.com/jakciehoo/HooCategories"
  s.license          = 'Code is MIT, then custom font licenses.'
  s.author           = { "Jackiehoo" => "stevehufly@gmail.com" }
  s.source           = { :git => "https://github.com/jakciehoo/HooCategories.git", :tag => s.version }
  s.social_media_url = 'http://weibo.com/hooyoo/home?wvr=5'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'HooCategoriesDemo/Categories/*'

  s.resources = 'HooCategoriesDemo/Assets.xcassets'
  s.frameworks = 'UIKit', 'Foundation'
  s.module_name = 'HooCategories'
  s.dependency 'MBProgressHUD'
end

