//
//  TranslateViewController.m
//  魅眼
//
//  Created by xbo on 16/9/6.
//  Copyright © 2016年 xbo. All rights reserved.
//

#import "TranslateViewController.h"
#import "PrefixHeader.pch"
#import "AFNetworking.h"

#import "iflyMSC/IFlyMSC.h"
#import "iflyMSC/IFlySpeechRecognizerDelegate.h"
#import "iflyMSC/IFlyRecognizerViewDelegate.h"
#import "iflyMSC/IFlySpeechSynthesizerDelegate.h"


#import<CommonCrypto/CommonDigest.h>


@interface TranslateViewController ()<IFlySpeechRecognizerDelegate,IFlyRecognizerViewDelegate,IFlySpeechSynthesizerDelegate>

@property (nonatomic,strong) IFlyRecognizerView    *iflyRecognizerView;
@property (nonatomic,strong) IFlySpeechSynthesizer *iFlySpeechSynthesizer;
@property(nonatomic,strong)  UITextView *textView ;
@property(nonatomic,strong)  UILabel *resultlab;
@property (nonatomic,strong) AFHTTPSessionManager *manager;
@property (strong, nonatomic) NSString *translate;
@end

@implementation TranslateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self settingSpeechSynthesizer];
    [self settingRecognizerView];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 80)];
    imageView.image=[UIImage imageNamed:@"fy-102-拷贝"];
    imageView.userInteractionEnabled=YES;
    [self.view addSubview:imageView];
    
    
    
    UIButton *titlebut=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2-20, 30, 40, 40)];
    [titlebut setImage:[UIImage imageNamed:@"wzfy_zh"] forState:UIControlStateNormal];
    [imageView addSubview:titlebut];

    
    UIButton *butt=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2-40, 40, 20, 20)];
    [butt setImage:[UIImage imageNamed:@"wzfy_xh"] forState:UIControlStateNormal];
    [imageView addSubview:butt];
    
    UIButton *butte=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2-80, 30, 40, 40)];
    [butte setTitle:@"中文" forState:UIControlStateNormal];
    [imageView addSubview:butte];
    

    UIButton *butt1=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2+20, 40, 20, 20)];
    [butt1 setImage:[UIImage imageNamed:@"wzfy_xh"] forState:UIControlStateNormal];
    [imageView addSubview:butt1];
    
    UIButton *butte1=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2+40, 30, 40, 40)];
    [butte1 setTitle:@"英文" forState:UIControlStateNormal];
    [imageView addSubview:butte1];

    
    
    
    
     self.view.backgroundColor=XBColor(230 , 231, 232);
    
    _textView =[[UITextView alloc]initWithFrame:CGRectMake(0, 80, self.view.width, 150)];
    _textView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_textView];
    
    
    UIButton *clearbut=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-50, 110, 40, 30)];
    [clearbut setTitle:@"清除" forState:UIControlStateNormal];
    clearbut.titleLabel.font=[UIFont systemFontOfSize:13];
    [clearbut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [clearbut addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
    [_textView addSubview:clearbut];

    [[NSNotificationCenter defaultCenter]removeObserver:self];
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(0, 240, self.view.width, 30)];
    [but setTitle:@"翻译" forState:UIControlStateNormal];
    but.backgroundColor=XBColor(73, 198, 238);
    [but addTarget:self action:@selector(startTranslate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 280, self.view.width, 150)];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    
    _resultlab=[[UILabel alloc]initWithFrame:CGRectMake(0, 280, self.view.width-50, 40)];
    _resultlab.backgroundColor=[UIColor whiteColor];
    _resultlab.numberOfLines=0;
    _resultlab.adjustsFontSizeToFitWidth=YES;
    _resultlab.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:_resultlab];
    
    
    UIButton *but1=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-50, 280, 40, 40)];
    [but1 setImage:[UIImage imageNamed:@"wzfy_yl"] forState:UIControlStateNormal];
     [but1 addTarget:self action:@selector(speakingTranslate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2=[[UIButton alloc]initWithFrame:CGRectMake(self.view.width-80, 350, 80, 80)];
    [but2 setImage:[UIImage imageNamed:@"0213"] forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(startListenVoice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];

    
    

}
-(void)clearText
{
    self.textView.text=nil;
    self.resultlab.text=nil;
}
- (void)startTranslate
{
    [self startYoudaoTranslate];
}
-(void)speakingTranslate
{
    [self startSpeaking:self.resultlab.text];
    

}
- (void)startListenVoice
{
    //启动识别服务
    [_iflyRecognizerView start];

    
}

-(void)settingSpeechSynthesizer
{
    _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    _iFlySpeechSynthesizer.delegate = self;
    //设置语音合成的参数
    //语速,取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];
    //音量;取值范围 0~100
    [_iFlySpeechSynthesizer setParameter:@"50" forKey: [IFlySpeechConstant VOLUME]];
    //发音人,默认为”xiaoyan”;可以设置的参数列表可参考个 性化发音人列表
    [_iFlySpeechSynthesizer setParameter:@" vixl " forKey: [IFlySpeechConstant VOICE_NAME]];
    //音频采样率,目前支持的采样率有 16000 和 8000
    [_iFlySpeechSynthesizer setParameter:@"8000" forKey: [IFlySpeechConstant SAMPLE_RATE]];
    //asr_audio_path保存录音文件路径，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iFlySpeechSynthesizer setParameter:@" tts.pcm" forKey: [IFlySpeechConstant TTS_AUDIO_PATH]];
    

}

-(void)startSpeaking:(NSString *)words
{
    //启动合成会话
    [_iFlySpeechSynthesizer startSpeaking: [NSString stringWithFormat:@"%@",words]];
    
    self.resultlab.text=words;
}

//合成结束，此代理必须要实现
- (void) onCompleted:(IFlySpeechError *) error{}
//合成开始
- (void) onSpeakBegin{}
//合成缓冲进度
- (void) onBufferProgress:(int) progress message:(NSString *)msg{}
//合成播放进度
- (void) onSpeakProgress:(int) progress{}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)settingRecognizerView
{
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    _iflyRecognizerView.delegate = self;
    [_iflyRecognizerView setParameter: @"iat" forKey: [IFlySpeechConstant IFLY_DOMAIN]];
    
    [_iflyRecognizerView setParameter: @"en" forKey: [IFlySpeechConstant LANGUAGE_ENGLISH]];
    
    
    //设置听写结果格式为json
    [_iflyRecognizerView setParameter:@"json" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    //asr_audio_path保存录音文件名，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iflyRecognizerView setParameter:@"asrview.pcm " forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    
    //设置最长录音时间
    [_iflyRecognizerView setParameter:@"30000" forKey:[IFlySpeechConstant SPEECH_TIMEOUT]];
    //设置语言
    [_iflyRecognizerView setParameter:@"mandarin" forKey:[IFlySpeechConstant ACCENT]];
    
     [_iflyRecognizerView setParameter:@"8000" forKey:[IFlySpeechConstant MFV_WTT]];
    
    //设置后端点
    [_iflyRecognizerView setParameter:@"3000" forKey:[IFlySpeechConstant VAD_EOS]];
    //设置前端点
    [_iflyRecognizerView setParameter:@"3000" forKey:[IFlySpeechConstant VAD_BOS]];
    //网络等待时间
    [_iflyRecognizerView setParameter:@"20000" forKey:[IFlySpeechConstant NET_TIMEOUT]];
    
    //设置采样率，推荐使用16K
    [_iflyRecognizerView setParameter:@"16000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
    //设置语言
    [_iflyRecognizerView setParameter:@"zh_cn" forKey:[IFlySpeechConstant LANGUAGE]];
    //设置是否返回标点符号
    [_iflyRecognizerView setParameter:@"0" forKey:[IFlySpeechConstant ASR_PTT]];
}

-(void)startYoudaoTranslate
{
    NSString *key=@"1960477376";
    NSString *keyfrom=@"AiTour";
    
    self.manager =[AFHTTPSessionManager manager];
    self.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [self.manager GET:[[NSString stringWithFormat:@"http://fanyi.youdao.com/openapi.do?keyfrom=%@&key=%@&type=data&doctype=json&&only=translate&version=1.1&q=%@",keyfrom,key,_textView.text]  stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray *ary=dic[@"translation"];
        
        NSLog(@"%@",ary);
        
        
       self.resultlab.text=ary[0];
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)onResult: (NSArray *)resultArray isLast:(BOOL) isLast
{
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = resultArray [0];
    for (NSString *key in dic) {
        [resultString appendFormat:@"%@",key];
    }
    
    NSString *result=[NSString stringWithFormat:@"%@%@",self.textView.text,resultString];
    NSString * resultFromJson =  [self stringFromJson:resultString];
    
    self.textView.text = [NSString stringWithFormat:@"%@%@",self.textView.text,resultFromJson];
    
    
    
    
    if (isLast){
        NSLog(@"听写结果(json)：%@测试",  result);
        
       
        
    }
   
}



- (void) onBeginOfSpeech
{
    NSLog(@"onBeginOfSpeech");
}

/**
 停止录音回调
 ****/
- (void) onEndOfSpeech
{
    NSLog(@"onEndOfSpeech");
    
     
    
}

-(NSString *)stringFromJson:(NSString*)params
{
    if (params == NULL) {
        return nil;
    }
    
    NSMutableString *tempStr = [[NSMutableString alloc] init];
    
    //返回的格式必须为utf8的,否则发生未知错误
    NSDictionary *resultDic  = [NSJSONSerialization JSONObjectWithData:[params dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    
    if (resultDic!= nil) {
        NSArray *wordArray = [resultDic objectForKey:@"ws"];
        
        for (int i = 0; i < [wordArray count]; i++) {
            NSDictionary *wsDic = [wordArray objectAtIndex: i];
            NSArray *cwArray = [wsDic objectForKey:@"cw"];
            
            for (int j = 0; j < [cwArray count]; j++) {
                NSDictionary *wDic = [cwArray objectAtIndex:j];
                NSString *str = [wDic objectForKey:@"w"];
                [tempStr appendString: str];
            }
        }
    }
    return tempStr;
}

/*识别会话错误返回代理
 @ param  error 错误码
 */
- (void)onError: (IFlySpeechError *) error
{
    //    NSLog(@"%@",error);
}


- (void) onResults:(NSArray *) results isLast:(BOOL)isLast
{
}



- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *returnStr=[NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    //    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
    //                                                           mutabilityOption:NSPropertyListImmutable
    //                                                                     format:NULL
    //                                                           errorDescription:NULL];
    
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
