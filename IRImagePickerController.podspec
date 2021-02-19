Pod::Spec.new do |spec|
  spec.name         = "IRImagePickerController"
  spec.version      = "1.0.0"
  spec.summary      = "A powerful ImagePickerController of iOS."
  spec.description  = "A powerful ImagePickerController of iOS."
  spec.homepage     = "https://github.com/irons163/IRImagePickerController.git"
  spec.license      = "MIT"
  spec.author       = "irons163"
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/irons163/IRImagePickerController.git", :tag => spec.version.to_s }
  spec.source_files  = "IRImagePickerController/**/*.{h,m}"
  spec.resource_bundles = { "IRImagePickerController" => "IRImagePickerController/**/*.storyboard" }
end