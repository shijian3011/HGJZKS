//
//  JZColorDefine.h
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#ifndef JZColorDefine_h
#define JZColorDefine_h

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGB3(a) [UIColor colorWithRed:(a)/255.0 green:(a)/255.0 blue:(a)/255.0 alpha:1]
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define kCellSelectColor RGB(237, 237, 237)
#define kBaseColor   RGB(247,245,248)
#define kC1 RGB(255,255,255)
#define kC2 RGB(53,53,53)
#define kC3 RGB(76,76,76)
#define kC4 RGB(53,40,40)
#define kC5 RGB(231,55,12)
#define kC6 RGB(206,206,206)
//#define kC7 RGB(150,150,150)
//#define kC8 RGB(110,,255)
#define kC9 RGB(150,150,150)
#define kC10 RGB(110,110,110)
#define kC11 RGB(0,0,0)
#define kC12 RGB(51,51,51)
#define kC13 RGB(0,233,255)
#define kC15 RGB(225,121,0)
#define kC17 RGB(219,217,220)
#define kC19 RGB(99,141,187)

#endif /* JZColorDefine_h */
