# Objective
Repo to reproduce OCLint issue with unexpected compiler errors in iOS project

# Steps to reproduce the linter issue
* Checkout this repo.
* Edit the oclint binary location, as needed in ./lint.sh
* Run ./lint.sh
* Typical output is...
```
$ ./lint.sh 
This binary is no longer under maintenance by OCLint team.
Please consider using xcpretty (https://github.com/supermarin/xcpretty) instead!
------------------------------ OCLint ------------------------------
/usr/local/Cellar/oclint/0.13/bin/oclint -p /Users/user_name/git/linter-issue -no-analytics -verbose -enable-clang-static-analyzer --report-type text /Users/user_name/git/linter-issue/NEOViewInfra/Collections/TableView/Adapters/NEOTableViewAdapter.m /Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c
--------------------------------------------------------------------
Compiling /Users/user_name/git/linter-issue/NEOViewInfra/Collections/TableView/Adapters/NEOTableViewAdapter.m. /Users/user_name/git/linter-issue/NEOViewInfra/Collections/TableView/Adapters/NEOTableViewAdapter.h
.. /Users/user_name/git/linter-issue/build/Debug-iphonesimulator/NEOViewInfra.framework/Headers/NEOBaseAdapter.h
.. /Users/user_name/git/linter-issue/NEOViewInfra/Collections/Commons/Adapter/NEOBaseAdapter+Internal.h
... /Users/user_name/git/linter-issue/NEOViewInfra/Collections/Commons/Adapter/NEOBaseAdapter.h
 - Failed
Compiling /Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c - Success
Analyzing /Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c - Done
Clang Static Analyzer /Users/user_name/git/linter-issue/NEOViewInfra/Collections/TableView/Adapters/NEOTableViewAdapter.m. /Users/user_name/git/linter-issue/NEOViewInfra/Collections/TableView/Adapters/NEOTableViewAdapter.h
.. /Users/user_name/git/linter-issue/build/Debug-iphonesimulator/NEOViewInfra.framework/Headers/NEOBaseAdapter.h
.. /Users/user_name/git/linter-issue/NEOViewInfra/Collections/Commons/Adapter/NEOBaseAdapter+Internal.h
... /Users/user_name/git/linter-issue/NEOViewInfra/Collections/Commons/Adapter/NEOBaseAdapter.h
 - Finished with Failure
Clang Static Analyzer /Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c - Done

Compiler Errors:
(please be aware that these errors will prevent OCLint from analyzing this source code)

/Users/user_name/git/linter-issue/NEOViewInfra/Collections/Commons/Adapter/NEOBaseAdapter.h:3:1: duplicate interface definition for class 'NEOBaseAdapter'

Clang Static Analyzer Results:

/Users/user_name/git/linter-issue/NEOViewInfra/Collections/Commons/Adapter/NEOBaseAdapter.h:3:1: duplicate interface definition for class 'NEOBaseAdapter'
/Users/user_name/git/linter-issue/build/Debug-iphonesimulator/NEOViewInfra.framework/Headers/NEOBaseAdapter.h:3:12: previous definition is here


OCLint Report

Summary: TotalFiles=1 FilesWithViolations=1 P1=0 P2=0 P3=5 

/Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c:4:1: long line [size|P3] Line with 121 characters exceeds limit of 100
/Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c:1:2: long variable name [naming|P3] Length of variable name `NEOViewInfraVersionString` is 25, which is longer than the threshold of 20
/Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c:2:2: long variable name [naming|P3] Length of variable name `NEOViewInfraVersionNumber` is 25, which is longer than the threshold of 20
/Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c:4:2: long variable name [naming|P3] Length of variable name `NEOViewInfraVersionString` is 25, which is longer than the threshold of 20
/Users/user_name/git/linter-issue/build/Neo.build/Debug-iphonesimulator/NEOViewInfra.build/DerivedSources/NEOViewInfra_vers.c:5:2: long variable name [naming|P3] Length of variable name `NEOViewInfraVersionNumber` is 25, which is longer than the threshold of 20

[OCLint (http://oclint.org) v0.13]
```

**Note:** Even though the #import's are perfectly valid in Obj-C, OCLint's libclang has an issue compiling this code.

