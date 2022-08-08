//
//  ASViewController.h
//  SABaseKit
//
//  Created by acct<blob>=<NULL> on 08/03/2022.
//  Copyright (c) 2022 acct<blob>=<NULL>. All rights reserved.
//

@import UIKit;
@import SABaseKit;

@interface CellModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *target;
@end

@interface ASViewController : UIViewController

@end

@interface ASTableViewCell : UITableViewCell<TableViewCellProtocol>

@end
