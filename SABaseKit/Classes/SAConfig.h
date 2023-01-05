//
//  SAConfig.h
//  Pods
//
//  Created by 赵郧陕 on 2023/1/5.
//

#ifndef SAConfig_h
#define SAConfig_h

// 必须成对使用，使用该宏前必须加@，如@weakify(self);  @strongify(self);
#define weakify( x ) autoreleasepool{} __weak typeof(x) weak##x = x
#define strongify( x ) autoreleasepool{} __strong typeof(weak##x) x = weak##x


#endif /* SAConfig_h */
