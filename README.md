# PPLLockDemo
This project demonstrates the use of the libPPL Lock.a static library SDK

##### Manual integration

Drag the libPPLLock.a and PPLLock.h files into your Xcode project



Introduction

1) Import the header file in the class you need to use

```objective-c
import "PPLLock.h"
```

2) Create a PPLLock object and set the delegate object

```
PPLLock * PPObject =  [[PPLLock alloc] initWithDelegate:self];
```

Please refer to the documentation for detailed use.

