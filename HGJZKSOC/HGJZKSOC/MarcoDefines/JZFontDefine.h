//
//  JZFontDefine.h
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#ifndef JZFontDefine_h
#define JZFontDefine_h

//系统标准字体
#define Font(a) [UIFont systemFontOfSize:(a)]
#define kF0 Font(22)
#define kF1 Font(17)
#define kF2 Font(15)
#define kF3 Font(13)
#define kF4 Font(12)
#define kF5 Font(10)
#define kF6 Font(28)
#define kF7 Font(14)
#define kF8 Font(8)
#define kF9 Font(6)
#define kF12 Font(11)
#define kF10 Font(50)
#define kF11 Font(19)
#define kF14 Font(18)
#define kF13 Font(16)
#define kFontComment                  [UIFont fontWithName:@"HelveticaNeue" size:14]
#define kFontUserCommentTimeLabel     [UIFont fontWithName:@"HelveticaNeue" size:12]
#define kFontUserName                 [UIFont fontWithName:@"HelveticaNeue" size:16]
#define kFontUserCommentContent       [UIFont fontWithName:@"HelveticaNeue" size:14]

/**
 *  宏定义标准字体 根据型号返回不同的字体大小
 */
#define kStandardFont  [UIFont systemFontOfSize:([M2DeviceHelper standardFontSystemSize])]
#define kStandardTitleFont [UIFont systemFontOfSize:([M2DeviceHelper standardFontSystemSize]+1)]
#define kStandardCommentTitleFont [UIFont systemFontOfSize:([M2DeviceHelper standardFontSystemSize]+2)]

#define     ALL_FONT(s)     [UIFont fontWithName:@"Heiti SC" size:s]
#define ALL_FONT_BOLD(s)    [UIFont fontWithName:@"Heiti SC" size:s]

#endif /* JZFontDefine_h */
