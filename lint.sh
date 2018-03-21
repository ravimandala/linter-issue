xcodebuild -project Neo.xcodeproj -verbose -sdk iphonesimulator -configuration Debug -arch x86_64 clean build CLANG_ENABLE_MODULE_DEBUGGING=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY='' CODE_SIGNING_REQUIRED=NO ENABLE_BITCODE=NO COMPILER_INDEX_STORE_ENABLE=NO OTHER_CFLAGS="\$(inherited) -H" > xcodebuild.log 
/usr/local/Cellar/oclint/0.13/bin/oclint-xcodebuild
/usr/local/Cellar/oclint/0.13/bin/oclint-json-compilation-database -v -- -no-analytics -verbose -enable-clang-static-analyzer --report-type text
