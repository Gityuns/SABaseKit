//
//  NSFileManager+Path.h
//  SABaseKit
//
//  Created by mac on 2022/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (Path)

/// 您应该将所有de应用程序数据文件写入到这个目录下。这个目录用于存储用户数据或其它应该定期备份的信息
+ (NSURL *)documentsURL;
+ (NSString *)documentsPath;

/// 这个目录下有两个子目录：Caches 和 Preferences
/// Preferences 目录：包含应用程序的偏好设置文件。您不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好
+ (NSURL *)libraryURL;
+ (NSString *)libraryPath;
/// 用于存放应用程序专用的支持文件，保存应用程序再次启动过程中需要的信息。
+ (NSURL *)cachesURL;
+ (NSString *)cachesPath;
@end

NS_ASSUME_NONNULL_END
