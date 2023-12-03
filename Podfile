platform :ios, '16.0'

source 'https://cdn.cocoapods.org/'

def firebase
  pod 'Firebase/Messaging'
end

def thirdparty
  pod 'DGCharts'
  pod 'SwiftQRScanner', :git => ‘https://github.com/vinodiOS/SwiftQRScanner’
end

def testing
  pod 'Nimble'
  pod "Quick"
end

target 'CaseStudySDD' do
  use_frameworks!

  thirdparty
  firebase

  target 'CaseStudySDDTests' do
    inherit! :search_paths
    testing
  end

end
