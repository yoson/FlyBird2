//
//  FlyBirdTool.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "FlyBirdTool.h"
#import <CommonCrypto/CommonDigest.h>

@implementation FlyBirdTool
+(NSString *) formatStatus:(NSString*)status{
    NSString *statusStr = @"未提交";
    if([status isEqualToString:@"1"]){
        statusStr = @"待初审";
    }
    if([status isEqualToString:@"2"]){
        statusStr = @"初审补充材料";
    }
    if([status isEqualToString:@"3"]){
        statusStr = @"初审未通过";
    }
    if([status isEqualToString:@"4"]){
        statusStr = @"待终审";
    }
    if([status isEqualToString:@"5"]){
        statusStr = @"终审补充材料";
    }
    if([status isEqualToString:@"6"]){
        statusStr = @"终审未通过";
    }
    if([status isEqualToString:@"7"]){
        statusStr = @"完成";
    }
    return statusStr;
}
+(NSURL *)stringToUrl:(NSString *)param{
    NSString *str = [NSString stringWithFormat:@"http://123.57.215.151/%@",param];
    return [NSURL URLWithString:str];
}
+(NSString *)md5:(NSString *)str{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                             result[0], result[1], result[2], result[3],
                                             result[4], result[5], result[6], result[7],
                                             result[8], result[9], result[10], result[11],
                                            result[12], result[13], result[14], result[15]];
}
+(NSString *)getTsTK{
    UInt64 ts = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *str = [NSString stringWithFormat:@"%llu123qwe!@#",ts];
    NSString *tk= [self md5:str];
    return [NSString stringWithFormat:@"&ts=%llu&tk=%@",ts,tk];
}
+(NSString *)getValue:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:key];
}
+(BOOL)setKey:(NSString *)key Value:(NSString *)value{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:value forKey:key];
    return YES;
}

+(void)httpPost:(NSString *)url param:(NSString *)param completeHander:(HandlerBlock)handler{
    NSURLSessionConfiguration *defaultConf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConf delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *nsUrl = [FlyBirdTool stringToUrl:url];
    NSMutableURLRequest *urlReq = [NSMutableURLRequest requestWithURL:nsUrl];
    [urlReq setHTTPMethod:@"POST"];
    [urlReq setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSessionDataTask *dataTask =[session dataTaskWithRequest:urlReq completionHandler:handler];
    [dataTask resume];
}
+(void)submitImg:(NSString *)url pic:(NSData *)data param:(NSDictionary *)param completeHander:(HandlerBlock)handler{
    NSURLSessionConfiguration *defaultConf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConf delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURL *nsUrl = [FlyBirdTool stringToUrl:url];
    NSMutableURLRequest *urlReq = [NSMutableURLRequest requestWithURL:nsUrl];
    
    [urlReq addValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
    [urlReq addValue:@"text/html" forHTTPHeaderField:@"Accept"];
    [urlReq addValue:[param objectForKey:@"remark"]  forHTTPHeaderField:@"remark"];
    [urlReq setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    [urlReq setTimeoutInterval:20];
    NSURLSessionUploadTask *upLoadTask = [session uploadTaskWithRequest:urlReq fromData:data completionHandler:handler];
    [upLoadTask resume];
}

+(UIView*)getMaxCutLine:(CGPoint)frame{
    UIView *_view = [[UIView alloc]initWithFrame:CGRectMake(frame.x, frame.y, SCREEN_WIDTH, 10)];
    _view.backgroundColor = GRAY;
    _view.alpha = 0.2;
    return  _view;
}
+(UIView*)getMinCutLine:(CGPoint)frame{
    UIView *_view = [[UIView alloc]initWithFrame:CGRectMake(frame.x, frame.y, SCREEN_WIDTH, 1)];
    _view.backgroundColor = GRAY;
    _view.alpha = 0.2;
    return  _view;
}
@end
