#
#  Be sure to run `pod spec lint developer_rui.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
	s.name		   = 'developer_rui' 
	s.version	   =	'1.1.1'
	s.license      = {:type => 'MIT', :file  => 'LICENSE.md' }
	s.homepage     = 'https://github.com/pppqppqpphejj/develope_rui.git'
	s.authors      =  {'developer_rui' => 'developer_rui@139.com'}
	s.summary      = '自己整理常用工具'
	s.source       =  { :git => 'https://github.com/pppqppqpphejj/develope_rui.git', :tag => 'v1.1.1'}	
	s.source_files = 'wwonde_tools/wwonde_tools/*.{h,m}'
	s.requires_arc = true
	s.platform     = :ios, '8.0'
	s.description  = '12345678ytrdsfghbghgf'

end
